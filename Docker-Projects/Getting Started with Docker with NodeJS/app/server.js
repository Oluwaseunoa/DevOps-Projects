let express = require('express');
let path = require('path');
let fs = require('fs');
let MongoClient = require('mongodb').MongoClient;
let bodyParser = require('body-parser');

let app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(__dirname));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

app.get('/profile-picture', (req, res) => {
  let img = fs.readFileSync(path.join(__dirname, "images/profile-1.jpg"));
  res.writeHead(200, { 'Content-Type': 'image/jpg' });
  res.end(img, 'binary');
});

// Safe construction of MongoDB connection URL
let mongoUrlDocker;
if (!process.env.MONGO_USER || !process.env.MONGO_PASSWORD) {
  console.error("MONGO_USER or MONGO_PASSWORD not set in environment!");
  console.warn("Falling back to unauthenticated connection (will fail if auth is required).");
  mongoUrlDocker = "mongodb://mongodb:27017";
} else {
  const username = encodeURIComponent(process.env.MONGO_USER);
  const password = encodeURIComponent(process.env.MONGO_PASSWORD);
  mongoUrlDocker = `mongodb://${username}:${password}@mongodb:27017`;
}

let databaseName = "my-db";
let db = null;

// Function to connect to MongoDB with retry
function connectToMongo(retries = 10, delay = 3000) {
  MongoClient.connect(mongoUrlDocker, (err, client) => {
    if (err) {
      console.error("MongoDB connection failed:", err.message);
      if (retries > 0) {
        console.log(`Retrying connection in ${delay / 1000} seconds... (${retries} attempts left)`);
        setTimeout(() => connectToMongo(retries - 1, delay), delay);
      } else {
        console.error("Max retries reached. Continuing without DB connection (save/load features disabled).");
      }
      return;
    }
    db = client.db(databaseName);
    console.log("Connected successfully to MongoDB");
  });
}

// Start connection attempts as soon as the app starts
connectToMongo();

// POST: Update profile
app.post('/update-profile', (req, res) => {
  let userObj = req.body;
  userObj.userid = 1;

  if (!db) {
    return res.status(503).send({ error: "Database not available yet. Please try again shortly." });
  }

  db.collection("users").updateOne(
    { userid: 1 },
    { $set: userObj },
    { upsert: true },
    (err, result) => {
      if (err) {
        console.error("Update error:", err);
        return res.status(500).send({ error: err.message });
      }
      console.log("Profile updated successfully");
      res.send(userObj);
    }
  );
});

// GET: Retrieve profile
app.get('/get-profile', (req, res) => {
  if (!db) {
    return res.status(503).send({});
  }

  db.collection("users").findOne({ userid: 1 }, (err, result) => {
    if (err) {
      console.error("Find error:", err);
      return res.status(500).send({});
    }
    res.send(result || {});
  });
});

// Listen on all interfaces
app.listen(3000, '0.0.0.0', () => {
  console.log("App listening on port 3000!");
});

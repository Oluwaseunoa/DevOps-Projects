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
  res.writeHead(200, {'Content-Type': 'image/jpg'});
  res.end(img, 'binary');
});

const mongoUrlDocker = `mongodb://${process.env.MONGO_USER}:${process.env.MONGO_PASSWORD}@mongodb:27017`;
let mongoClientOptions = { useNewUrlParser: true, useUnifiedTopology: true };
let databaseName = "my-db";

app.post('/update-profile', (req, res) => {
  let userObj = req.body;
  userObj.userid = 1;

  MongoClient.connect(mongoUrlDocker, mongoClientOptions, (err, client) => {
    if (err) return res.status(500).send(err.message);

    let db = client.db(databaseName);

    db.collection("users").updateOne(
      { userid: 1 },
      { $set: userObj },
      { upsert: true },
      () => client.close()
    );
  });

  res.send(userObj);
});

app.get('/get-profile', (req, res) => {
  MongoClient.connect(mongoUrlDocker, mongoClientOptions, (err, client) => {
    if (err) return res.status(500).send({});

    let db = client.db(databaseName);

    db.collection("users").findOne({ userid: 1 }, (err, result) => {
      client.close();
      res.send(result || {});
    });
  });
});

app.listen(3000, () => console.log("Your app listening on port 3000!"));

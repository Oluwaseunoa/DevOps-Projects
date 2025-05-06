

## 📁 **Project Title: Advanced Linux File Operations Project**

### 🎯 **Goal:**

Learn and demonstrate advanced file management in Linux using real-world tools like `wget`, `tar`, `gzip`, `bzip2`, `zip`, and basic scripting.

---

## ✅ **Project Summary**

This project simulates a real DevOps or sysadmin task:

> **“Download a configuration file, create backups, compress them, archive them, and later restore them.”**

You’ll walk through:

* Fetching a remote file
* Creating backups
* Archiving files (`tar`)
* Compressing files (`gzip`, `bzip2`, `zip`)
* Restoring archives
* Writing a reusable shell script

---

## 🧩 **Step-by-Step Breakdown**

---

### 🔹 **Step 1: Fetch a Remote Configuration File**

```bash
wget https://raw.githubusercontent.com/darey-io/globomantics-ansible/refs/heads/master/group_vars/all/vars.yml
```

* **Why?** Simulates pulling configs from GitHub for automation tools like Ansible.
* **Result:** A `vars.yml` file is saved in your current directory.

📁 *Save this file in a folder called* `config/`.

---

### 🔹 **Step 2: Move and Rename for Backup Simulation**

```bash
mv vars.yml Desktop/
cd Desktop/
mv vars.yml doc1
cp doc1 doc2
cp doc1 doc3
```

* **Why?** You’re simulating creation of backup copies (`doc1`, `doc2`, `doc3`).

📁 *You now have 3 files ready for packaging.*

---

### 🔹 **Step 3: Archive the Files Using `tar`**

```bash
tar -cvf archived.tar doc1 doc2 doc3
```

* **Why?** `tar` is used to package multiple files into a single archive.
* **Check Contents:**

  ```bash
  tar -tvf archived.tar
  ```

---

### 🔹 **Step 4: Compress the Archive**

#### a. Using `bzip2`:

```bash
bzip2 archived.tar
```

To decompress:

```bash
bunzip2 archived.tar.bz2
```

#### b. Using `gzip`:

```bash
gzip archived.tar
```

To decompress:

```bash
gunzip archived.tar.gz
```

#### c. Using `zip`:

```bash
zip archived.tar.zip archived.tar
```

To unzip:

```bash
unzip archived.tar.zip
```

💡 **Compare Sizes**:

```bash
du -h archived.*
```

---

### 🔹 **Step 5: Extract and Restore Files**

```bash
tar -xvf archived.tar
```

* **Why?** Simulates restoring original files after backup.

---

### 🔹 **Step 6: Automate the Workflow**

Create a script: `scripts/archive_and_compress.sh`

```bash
#!/bin/bash

echo "Step 1: Creating backup files..."
cp doc1 doc2
cp doc1 doc3

echo "Step 2: Archiving..."
tar -cvf archived.tar doc1 doc2 doc3

echo "Step 3: Compressing with gzip..."
gzip archived.tar

echo "Done. Archive is: archived.tar.gz"
```

Make it executable:

```bash
chmod +x scripts/archive_and_compress.sh
```

Run it:

```bash
bash scripts/archive_and_compress.sh
```

---

### 🔹 **Step 7: Cleanup & Reuse**

#### Cleanup:

```bash
rm doc*
```

#### Re-extract:

```bash
tar -xvzf archived.tar.gz
```

---

## 📚 **Optional Add-ons**

* Add a cron job to run the script weekly.
* Use `logrotate` to manage archive sizes.
* Use `sha256sum` or `md5sum` to verify file integrity.

---

## 🧾 Final Files/Folders Structure

```
Advanced_File_Operations_Project/
├── config/
│   └── vars.yml
├── Desktop/
│   ├── doc1, doc2, doc3
│   ├── archived.tar.gz
│   ├── archived.tar.zip (optional)
│   └── ...
├── scripts/
│   └── archive_and_compress.sh
├── notes/
│   └── full_command_log.txt
└── README.md
```

---

## 🧠 **Learning Outcomes**

* Understand file packaging and compression.
* Learn the differences and use-cases of `tar`, `gzip`, `bzip2`, and `zip`.
* Build a Bash script for automation.
* Practice cleanup and restoration operations.

---

Would you like me to generate this folder structure and script for you in a downloadable `.zip`?

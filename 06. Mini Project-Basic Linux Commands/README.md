
# Mini Project - Linux Basic Commands 

## 1. What is a Linux Command?

A Linux command is an instruction that you input into the Linux terminal to perform a specific task. It typically consists of:
- **Command Name**: The main instruction (e.g., `ls`, `cd`, `pwd`).
- **Option or Flag**: Additional options to modify behavior (e.g., `ls -a`, where `-a` is a flag).
- **Parameter or Argument**: The target (e.g., `cd /home/user`, `/home/user` is the argument).

**Note**: Linux is **case-sensitive**. `CD` and `cd` are different commands.

---

## 2. Manipulating Files and Directories

In Linux, manipulating files and directories is essential for organizing data, installing software, and managing the system.

Here are some common operations:

- **Creating a directory**:
    ```bash
    mkdir my_directory
    ```
![creating directory](./img/1.mkdir.png)

- **Changing into a directory**:
    ```bash
    cd my_directory
    ```
![changing directory](./img/2.cd.png)
- **Creating a file**:
    ```bash
    touch myfile.txt
    ```
![Creating file](./img/3.touch.png)
- **Viewing files in a directory**:
    ```bash
    ls
    ```
![Listing files](./img/4.ls.png)
- **Moving a file**:
    ```bash
    mv myfile.txt /home/username/Documents/
    ```
![Moving file](./img/5.mv.png)

- **Deleting a file**:
    ```bash
    rm myfile.txt
    ```
![Removing files](./img/6.rm.png)

- **Deleting a directory**:
    ```bash
    rmdir my_directory
    ```
    ![Removing folder](./img/7.rmdir.png)

---

## 3. Using `sudo` Command

- **Without `sudo`**:
    ```bash
    mkdir /root/myfolder
    ```
    **Result**:
    ```
    mkdir: cannot create directory ‘/root/myfolder’: Permission denied
    ```
    ![creating folder in root folder](./img/8.rootwithoutsudo.png)

- **With `sudo`**:
    ```bash
    sudo mkdir /root/myfolder
    ```
![Sudo Creating folder in the root folder](./img/9.withsudo.png)

- **Verify folder creation**:
    ```bash
    sudo ls /root
    ```
![Verifying created folder](./img/10.sudols.png)
---

## 4. `pwd` Command (Print Working Directory)

- **Command**:
    ```bash
    pwd
    ```
- **Output**:
    ```
    /home/username
    ```

The `pwd` command shows the absolute path of the current working directory.
![Print working directory](./img/11.pwd.png)
---

## 5. Linux Directory Structure

- `/` - Root directory (top of the hierarchy)
- `/bin` - Essential binary files (e.g., basic commands like `ls`, `cp`)
- `/etc` - Configuration files
- `/home` - Home directories for users
- `/root` - Home directory for root user
- `/var` - Variable files (logs, spool files)
- `/usr` - User programs and data

**Exploring with `ls`:**
```bash
ls /
ls /bin
ls /etc
ls /home
ls /root
ls /var
ls /usr
```
---

## 6. `cd` Command (Change Directory)

- Navigate to root:
    ```bash
    cd /
    pwd
    ```
    **Output**:
    ```
    /
    ```
![Chanding directory to root](./img/12.cdroot.png)
- List contents:
    ```bash
    ls
    ```
![List root files and directories](./img/13.lsroot.png)
- Navigate into `/usr`:
    ```bash
    cd usr
    pwd
    ```
![Change directory to usr](./img/14.cdusr.png)
---

## 7. Side Hustle Task 1 — Creating Directories

- Create a `photos` directory inside `/usr`:
    ```bash
    sudo mkdir /usr/photos
    ```
- Navigate into `photos`:
    ```bash
    cd /usr/photos
    ```
![Creating folder in usr](./img/15.mkdirphotos.png)

- Create 3 random folders inside `photos`:
    ```bash
    sudo mkdir folder2 folder3 folder4
    ```
- Show newly created folders:
    ```bash
    ls
    ```
![Creating and listing multiple folders](./img/16.mkdirmultiplephotos.png)
- Navigate into one folder:
    ```bash
    cd folder1
    ```
- Show full path:
    ```bash
    pwd
    ```
    **Output**:
    ```
    /usr/photos/folder1
    ```
![Changing directory into folder1](./img/17.cdfolder1.png)
---

## 8. Using `ls` Command

- List contents of a directory:
    ```bash
    ls
    ```
![List content of a directory]()
- List recursively:
    ```bash
    ls -R
    ```
![List folder recursively](./img/18.lsrecursive.png)
- List hidden files:
    ```bash
    ls -a
    ```
![List hidden items](./img/19.lshiddenfile.png)

- List in human-readable format:
    ```bash
    ls -lh
    ```
![List human readably](./img/20.lslh.png)

---

## 9. Using `cat` Command

- Display content of a file:
    ```bash
    cat /etc/os-release
    ```
- **Output Example**:
    ```
    NAME="Ubuntu"
    VERSION="22.04.3 LTS (Jammy Jellyfish)"
    ID=ubuntu
    ...
    ```
![Concatenate os details](./img/21.catetcos.png)
---

## 10. Using `cp` Command

- **Copy a single file**:
    ```bash
    cp file1.txt /home/username/
    ```
    ![Copy file1 to home](./img/22.file1tohome.png)

- **Copy multiple files**:
    ```bash
    cp file1.txt file2.txt /home/username/
    ```
![Copy multiple files to home](./img/23.cpmultiplefile.png)


- **Copy a file to a new file**:
    ```bash
    cp file1.txt file1_backup.txt
    ```
![Make a back up copy of a file](./img/24.backupfile1.png)
---

# Conclusion

This document explains and demonstrates basic Linux commands and navigation practices using practical examples.  
Mastering these basics builds the foundation for advanced Linux operations and system management.

View the full project on GitHub:  
👉 [DevOps Projects GitHub Repository](https://github.com/Oluwaseunoa/DevOps-Projects)

![My GitHub Repo](./img/GitHub.png)

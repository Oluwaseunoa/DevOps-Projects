
# 🛠️ Shell Scripting Project: Hands-On Demonstration

## Project Introduction  

This project introduces fundamental concepts and practices essential for shell scripting and Linux command-line automation. It focuses on the creation and execution of basic shell scripts to perform system-level tasks efficiently. The key objectives include understanding and demonstrating the following core concepts:

- **Shebang (#!) Usage:** Implemented to specify the script interpreter.

- **Variable Declaration and Usage:** Demonstrated the creation and use of variables within scripts.

- **Script File Creation:** Covered how to write and save executable script files.

- **Granting Execute Permissions:** Explored the use of chmod to make scripts executable.

- **Automated User and Folder Creation:** Used scripting to create system users and directories automatically.

- **Inline Command Execution:** Demonstrated embedding and executing commands within scripts.

## 📁 1. Create Project Folder

**Screenshot:**  
![Create Folder](./img/1.create_shell_scripting_folder.png)


**Description:**  
Created a dedicated directory to organize all shell script files.

```bash
mkdir shell_scripting
````

---

## 📄 2. Create Shell Script File

**Screenshot:**
![Create Script File](img/2.create_shell_script_file.png)

**Command:**

```bash
sudo vim my_first_shell_script.sh
```

Navigated into the project directory and created the script file.

---

## ✍️ 3. Write Script Content

**Screenshot:**
![Write Script](img/3.add_script_and_save.png)

**Concepts Demonstrated:**

* Shebang line
* Variable declaration and initialization
* Creating folders and users via `mkdir` and `useradd`

**Script Sample:**

```bash
#!/bin/bash

#Create directories
mkdir Folder1
mkdir Folder2
mkdir Folder3

#Create users
sudo useradd user1
sudo useradd user2
sudo useradd user3
```

---

## ✅ 4. Confirm Folder Creation

**Screenshot:**
![Confirm Folder](img/4.confirm_folder_creation.png)

Confirmed that the program file  `/home/jiro/shell_scripting/my_first_shell_script.sh` was created successfully.
```bash
ls -latr /home/jiro/shell_scripting
```
---

## ⚠️ 5. Initial Execution Denied

**Screenshot:**
![Execution Denied](img/5.execute_permission_denied.png)

Tried to execute the script without permissions.

```bash
./my_first_shell_script.sh
# Output: Permission denied
```

---

## 🔐 6. Assign Execute Permission

**Screenshot:**
![Add Permission](img/6.add_execute_permission to file.png)

Added permission to execute the file:

```bash
chmod +x my_first_shell_script.sh
```

---

## 🚀 7. Successfully Ran Script

**Screenshot:**
![Success Run](img/7.successfully_ran_script.png)

The script executed successfully after permission was granted.
```bash
./my_first_shell_script.sh
```
---

## 🔍 8. Evaluate Folder Creation

**Screenshot:**
![Evaluate Folder](img/8.evaluate_to_ensure_folders_are_created.png)

Checked using `ls` or `tree` to ensure the folder was created.

```bash
ls Folder1 Folder2 Folder3
```
---

## 🔍 9. Evaluate User Creation

**Screenshot:**
![Evaluate User](./img/9.evaluate_to_ensure_users_are_created.png)

Checked that the user was created using:

```bash
id user1 user2 user3
```

---

## 📌 10. Intro to Shebang

**Screenshot:**
![Shebang](img/10.intro_to_shebang.png)

Described the importance of the shebang (`#!/bin/bash`) for interpreter declaration.

---

## 📂 11. `/bin/bash` Exploration

**Screenshot:**
![Bin Bash](img/11.bin_bash_exploration.png)

Verified the bash shell path:

```bash
cd
ls /bin/bash
```

---

## 🧮 12. Variable Declaration & Initialization

**Screenshot:**
![Var Declaration](img/12.declaration_and_initialization_of_variable.png)

Example:

```bash
name="john"
```

---

## 📞 13. Calling Variables

**Screenshot:**
![Call Var](img/13.calling_variable.png)

Example usage:

```bash
echo $name
```

---

## 📤 14. Output of the Program

**Screenshot:**
![Program Output](img/14.output_of_program.png)

Expected terminal output:

```
john
```

---

## ❓ 15. Running Script Without File

**Screenshot:**
![Inline Execution](img/15.entering_the_program_on_the_terminal_without_file.png)

Demonstrated inline script execution directly on terminal:

```bash
name="john"
echo "My name is $name"
```
Expected terminal output:

```
My name is john
```
---

## 🧾 Summary of Key Concepts Covered

| Concept                               | Demonstrated |
| ------------------------------------- | ------------ |
| Shebang (`#!`)                        | ✅            |
| Variable declaration and usage        | ✅            |
| Script file creation                  | ✅            |
| Granting execute permission           | ✅            |
| Creating users and folders via script | ✅            |
| Inline command execution              | ✅            |

```
## 📁 GitHub Repository Validation

🔗 Repository URL: [DevOps Projects GitHub Repo](https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/09.%20Linux%20Shell%20Scripting)
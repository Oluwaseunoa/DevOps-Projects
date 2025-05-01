

# 📝 Mini Project – Text Editing in Linux: VIM and NANO

## 1. Introduction to Linux Text Editors

Linux text editors are essential for configuring system files, writing shell scripts, and managing application data. In this project, we explore **VIM**, a powerful modal editor preferred by advanced users, and **NANO**, a user-friendly editor great for beginners.

### 🔧 Tools Used

| Tool        | Description                  |
|-------------|------------------------------|
| Ubuntu 22.04| Operating system             |
| VIM         | Advanced CLI text editor     |
| Nano        | Simple CLI text editor       |
| Terminal    | Command-line interface (CLI) |

---

## 2. Getting Started with VIM

**VIM (Vi IMproved)** is a powerful and highly configurable text editor used for efficient text manipulation in the terminal.

### 🚀 Launching VIM

```bash
vim filename.txt
```

> If the file doesn't exist, VIM creates it.

📷 ![Vim Interface](./img/1.vimcreatefile.png)  
📷 ![Vim Start](./img/2.startVIM.png)

---

## 3. Understanding VIM Modes

VIM operates in different modes to separate actions like navigation, editing, and executing commands.

### 🔁 VIM Modes

- **Normal Mode** – Navigation and command execution  
  📷 ![Vim Normal Mode](./img/3.vimNormal.png)

- **Insert Mode** – Typing and editing text  
  📷 ![Vim Insert Mode](./img/4.vimInsert.png)

- **Command Mode** – Saving, quitting, searching, etc.  
  📷 ![Vim Command Mode](./img/5.vimCommand.png)

### 🔄 Switching Between Modes

- `i` → Insert Mode  
  📷 ![Insert Mode](./img/4.vimInsert.png)

- `Esc` → Return to Normal Mode  
  📷 ![Normal Mode](./img/3.vimNormal.png)

- `:` → Enter Command Mode  
  📷 ![Command Mode](./img/5.vimCommand.png)

---

## 4. Essential VIM Commands

| Task                      | Command     |
|---------------------------|-------------|
| Save and exit             | `:wq` or `ZZ` |
| Save only                 | `:w`         |
| Quit without saving       | `:q!`        |
| Delete a line             | `dd`         |
| Copy a line               | `yy`         |
| Paste                     | `p`          |
| Move to beginning of line | `0`          |
| Move to end of line       | `$`          |
| Search for a word         | `/word`      |

### 🛠 Visual Walkthrough
**Save and Exit**
📷 ![Save and Exit Vim](img/6.vimWQ.png)  
**Cat saved content**
📷 ![Cat Saved File](./img/7.catFilename.png)  

**Save without exiting**
📷 ![Save without Exiting Vim](./img/8.saveWithoutExiting.png)  
📷 ![Saved without Exiting](./img/9.SavedWithoutExiting.png) 

**Quit without saving**
📷 ![Quit without saving](./img/10.QuitWithoutSaving.png)
**Confirm unsaved change**  
📷 ![Check unsaved changes](./img/11.catunsavedchange.png) 

**Delete a line with `dd`**
📷 ![Choose line to delete](./img/12.linetodelete.png)  
📷 ![Deleted the line](./img/13.linedeleted.png) 

**Copy a line with `yy`** 
📷 ![Copying a line](./img/14.tocopyline.png)  

**Pasting the copied line with `p`**
📷 ![Pasting line](./img/15.copied.png)  
📷 ![Pasting](./img/16.pasted.png) 

**Moving beginning of line with `0`**
📷 ![Moving beginning lines](./img/17.tomovebetweenlines.png)  
📷 ![Moved beginning lines](./img/18.movedbetweenlines.png) 

**Move to the end of line with `$`**
📷 ![Moved to end of line](./img/19.movedtoendofline.png)  

**Searching for word with `/word`**
📷 ![Searching for words](./img/20.searchforwords.png)

---

## 5. Editing a File with VIM

```bash
vim filename.txt
```

📷 ![Vim edit file](./img/21.VimEditFile.png)

### ✏️ Insert the following text:
```text
Hello world!
This is VIM.
```

📷 ![Hello World](./img/22.HelloWorldVim.png)

### 💾 Save and Exit

- From insert mode, press `Esc` to go to normal mode
📷 ![Exit](./img/23.EscEditeMode.png)

- Type `:wq` to exit vim from normal mode
📷 ![Quit Vim](./img/24.QuiteVim.png) 

- You are back to the terminal 
📷 ![Back to Terminal](./img/25.BacktoTerminal.png)

---

## 6. Introduction to NANO

**NANO** is a simple and easy-to-use terminal text editor. Its commands are listed at the bottom of the screen, making it beginner-friendly.
![Nano Interface](./img/NanoInterface.png)
### 🚀 Launching NANO

```bash
nano filename.txt
```

📷 ![Nano Interface](./img/26.NanoInterface.png)

---

## 7. Common NANO Commands

| Task              | Command        |
|-------------------|----------------|
| Save              | `Ctrl + O`     |
| Exit              | `Ctrl + X`     |
| Cut line          | `Ctrl + K`     |
| Paste line        | `Ctrl + U`     |
| Search            | `Ctrl + W`     |
| Go to line number | `Ctrl + _`     |

📷 ![Nano Commands](./img/27.variousCommands.png)

---

## 8. Editing a File with NANO

```bash
nano example.txt
```
📷 ![Nano example.txt](./img/28.NanoTxtFile.png)

### ✏️ Type the following:
```text
Welcome to NANO editor!
Simple and fast.
```

📷 ![Type into the file](./img/29.TypeInNanoFile.png)

### 💾 Save and Exit
 
- `Ctrl + O` → Enter  to save
📷 ![nano edit](./img/30.ToSave.png) 

- `Ctrl + X` to exit 
📷 ![Saved](./img/31.Saved.png)

---

## 9. VIM vs NANO: Feature Comparison

| Feature        | VIM                        | NANO                    |
|----------------|-----------------------------|--------------------------|
| Learning Curve | Steep                      | Beginner-friendly        |
| Speed          | Very fast (with mastery)   | Moderate                 |
| Interface      | Modal                      | Non-modal (menu-driven) |
| Use Case       | Power users, developers    | New users, quick edits  |

---

## 10. Conclusion

Learning both VIM and NANO equips you with flexibility and confidence to work efficiently in various Linux environments—whether you're configuring servers or writing code on the fly.

---

## 📁 GitHub Repository Validation

🔗 **Repository URL**: [DevOps Projects GitHub Repo](https://github.com/Oluwaseunoa/DevOps-Projects)




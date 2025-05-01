Thanks for sharing your past project. Based on the new project instruction and your previous work, you're expected 

# Mini Project – Text Editing in Linux: VIM and NANO

## 1. Introduction to Linux Text Editors

Linux text editors are essential tools for managing configuration files, writing scripts, and editing system files. In this project, we’ll explore **VIM**, a powerful modal editor, and **NANO**, a beginner-friendly editor. The below are the tools we'll be using:

| Tool | Description |
|------|-------------|
| Ubuntu 22.04 | Operating system |
| VIM | Advanced CLI text editor |
| Nano | Simple CLI text editor |
| Terminal | Command-line interface |
---

## 2. Introduction to VIM

**VIM** (Vi Improved) is a powerful text editor built for efficiency.
### Starting VIM

```bash
vim filename.txt
```

If the file doesn’t exist, it will be created.

![Vim Interface](./img/1.vimcreatefile.png)
![Vim Start](./img/2.startVIM.png)

---

## 3. VIM Modes

VIM has three main modes:
- **Normal Mode**: For navigation and command execution.

![Vim Normal Mode](./img/3.vimNormal.png)

- **Insert Mode**: For typing/editing text.

![Vim Insert Mode](./img/4.vimInsert.png)

- **Command Mode**: For saving, quitting, etc.

![Vim Command Mode](./img/5.vimCommand.png)

### Switching Modes:
- Press `i` – Enter Insert Mode.
![Vim Insert Mode](./img/4.vimInsert.png)

- Press `Esc` – Return to Normal Mode.
![Vim Normal Mode](./img/3.vimNormal.png)

- Press `:` – Enter Command Mode.
![Vim Command Mode](./img/5.vimCommand.png)
---

## 4. Basic VIM Commands

| Task                        | Command         |
|-----------------------------|-----------------|  

**Save and exit**                `:wq` or `ZZ`   
![Save and Exit Vim](img/6.vimWQ.png)
![Cat Saved File](./img/7.catFilename.png)


**Save without exiting**        `:w`            

![Save without Exiting Vim](./img/8.saveWithoutExiting.png)
![Saved without Exiting](./img/9.SavedWithoutExiting.png)

**Quit without saving**             `:q!`  

![Quit without saving](./img/10.QuitWithoutSaving.png)
![Check unsaved changes](./img/11.catunsavedchange.png)


**Delete a line**               `dd`     

![Choose line to delete](./img/12.linetodelete.png)
![Deleted the line](./img/13.linedeleted.png)


**Copy a line**                 `yy`   

![Copying a line](./img/14.tocopyline.png) 
![Pasting line](./img/15.copied.png)   

**Paste**                       `p` 

![Pasting ](./img/16.pasted.png)

**Move to beginning of line**   `0`    
![Moving between lines](./img/17.tomovebetweenlines.png)
![Moved between lines](./img/18.movedbetweenlines.png)

**Move to end of line**          `$`     
![Pasting line](./img/19.movedtoendofline.png)        

**Search for a word**          `/word`         
![Searching for word](./img/20.searchforwords.png)

---

## 5. Editing a File in VIM (Example)

```bash
vim hello.txt
```
![Vim edit file](./img/21.VimEditFile.png)
- Press `i` and type:
    ```
    Hello world!
    This is VIM.
    ```
![Hello World](./img/22.HelloWorldVim.png) 

- Press `Esc`, then type:
    ```
    :wq
    ```
![Exit](./img/23.EscEditeMode.png)
![Pasting line](./img/24.QuiteVim.png)
![Back to Terminal](./img/25.BacktoTerminal.png)
---

## 6. Introduction to NANO

**NANO** is a simpler text editor, great for beginners.

### Starting NANO

```bash
nano filename.txt
```

---

## 7. NANO Interface & Commands
![Nano Interface](./img/26.NanoInterface.png)

Commands are displayed at the bottom (e.g., `^X` means Ctrl + X).

| Task                  | Command       |
|------------------------|---------------|
| Save                  | `Ctrl + O`    |
| Exit                  | `Ctrl + X`    |
| Cut line              | `Ctrl + K`    |
| Paste line            | `Ctrl + U`    |
| Search                | `Ctrl + W`    |
| Go to line number     | `Ctrl + _`    |

![Nano Commands](./img/27.variousCommands.png)
---

## 8. Editing a File in NANO (Example)

```bash
nano welcome.txt
```
![Nano a welcome.txt](./img/28.NanoTxtFile.png)
- Type:
    ```
    Welcome to NANO editor!
    Simple and fast.
    ```
![Type into the file](./img/29.TypeInNanoFile.png)

- Press `Ctrl + O` → Enter → `Ctrl + X` to save and exit.

![nano edit](./img/30.ToSave.png)
![Nano Interface](./img/31.Saved.png)
---

## 9. Use Case Comparison

| Feature        | VIM                        | NANO                   |
|----------------|-----------------------------|-------------------------|
| Learning Curve | Steep                      | Beginner-friendly       |
| Speed          | Faster once mastered       | Slower                  |
| Interface      | Minimal (modal)            | Menu-driven (non-modal)|
| Ideal For      | Power users, scripting     | Beginners, quick edits |

---

## 10. Conclusion

Understanding both VIM and NANO empowers you to confidently manage and edit files in a Linux environment—whether you're editing complex configs or making quick changes.

## 📁 GitHub Repository Validation

🔗 Repository URL: [DevOps Projects GitHub Repo](https://github.com/Oluwaseunoa/DevOps-Projects)

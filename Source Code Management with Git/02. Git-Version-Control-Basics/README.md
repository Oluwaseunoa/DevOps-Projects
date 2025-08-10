

# 🧪 Hands-On Git Collaboration: Version Control System in Action

## 👋 Project Overview

This project demonstrates the practical use of a **Version Control System (VCS)** in a collaborative software development environment using **Git** and **GitHub**. It simulates a team scenario where multiple contributors work on different sections of a web project while preserving each other’s work, resolving conflicts, and managing pull requests.

### 👥 Team Roles
- 👤 **Oluwaseunoa**: Project Owner & Developer  
- 👨‍💻 **Seuntrial**: Collaborator Developer (Feature Contributor)  
- 👀 **Jirosecurities**: Reviewer (Code Reviewer)  

---

## 🔧 Project Setup

### ✅ Step 1: Oluwaseunoa Creates the Repository

- Create a repository `02. Git-Version-Control-Basics` on [GitHub](https://github.com/login)

  ![Repository Creation](./img/1.repocreation.png)

- Clone the repository locally

  ![Clone Repo](./img/2.gitclonerepowithgitbash.png)

- Add an `index.html` file

  ![Add HTML File](./img/3.addindexhtmlfile.png)
  ![HTML Code](./img/4.addindexhtmlcode.png)

- Preview website in a browser

  ![Website View](./img/5.websiteview.png)

- Stage, commit, and push the changes:

  ```bash
  git add .
  git commit -m "Added initial commit of the AI Website"
  git push
  ```

---

### ✅ Step 2: Add Collaborators

- Add **Seuntrial** and **Jirosecurities** from the repository settings

  ![Add Collaborators](./img/6.Addcollaborators.png)
  ![Collaborator Invitation](img/7.invitedcollaborator.png)

---

### ✅ Step 3: Seuntrial Clones the Repository and Creates a Branch

- Locate repo [here](https://github.com/Oluwaseunoa/DevOps-Projects)

- Copy repo link

  ![Copy Link](./img/8.Seutrialcopyrepolink.png)

- Clone, navigate, and create a new branch:

  ```bash
  git clone https://github.com/Oluwaseunoa/DevOps-Projects.git
  cd DevOps-Projects
  git checkout -b update-navigation
  cd '02. Git-Version-Control-Basics>'
  ```

- Update the navigation section in `index.html`

  ![Cloning Repo](./img/9.seuntrialclonedrepo.png)
  ![Editing HTML](./img/10.seuncreatedabranch.png)

- Save changes, commit, and push:

  ```bash
  git add index.html
  git commit -m "Updated navigation bar"
  git push origin update-navigation
  ```

  ![Commit Changes](./img/11.seuncommitchanges.png)

---

## 🔁 Code Review Process

### ✅ Step 4: Seuntrial Creates a Pull Request (PR)

- Open PR to merge `update-navigation` into `main` and assign a reviewer

  ![PR Creation](./img/12.seunpulrequest.png)
  ![Create PR](./img/13.seuncreatepullrequest.png)

---

### ✅ Step 5: Code Review by Jirosecurities

- Reviewer checks the PR, adds comments, and approves the changes

  ![Review PR](./img/14.jirosecurityreviewPR.png)
  ![Approve PR](./img/15.jiroapprovePR.png)

---

### ✅ Step 6: PR Merge by Oluwaseunoa

- Project owner merges the PR into `main`

  ![Merge PR](./img/16.oluwaseunmergePR.png)
  ![Merged](./img/17.oluwaseunmergePR.png)

---

## 🤝 Simulating Another Contributor

### ✅ Step 7: Oluwaseunoa Creates Another Branch (`add-contact-info`)

- Pull latest changes, create new branch, update footer with contact info:

  ![Pull Updates](./img/28.firstupdate.png)
  ![Git Pull](./img/18.oluwaseungitpullmain.png)

  ```bash
  git checkout main
  git pull origin main
  git checkout -b add-contact-info
  # Edit index.html to update footer
  git add index.html
  git commit -m "Added contact info to footer"
  git push origin add-contact-info
  ```

  ![Edit & Push](img/19.oluwaseunbranchandedit.png)
  ![Push to Remote](./img/20.oluwaseunbranchpushremote.png)

---

### ✅ Step 8: Oluwaseunoa Creates PR & Reviewer Responds

- Create another PR and assign reviewer

  ![Compare PR](./img/21.oluwaseuncomparePR.png)
  ![Create PR](./img/22.oluwaseunCreatePR.png.png)

- Reviewer approves or flags conflicts

  ![Review Again](./img/24.jiroreview.png)

---

### ✅ Step 9: Final Merge and Project Completion

- Merge PR into `main`

  ![Merge PR](./img/25.oluwaseunMergeprove.png)

- Final version of the project reflects combined contributions

  ![Before](./img/26.before.png)  
  ![After](./img/27.after.png)

---

## 🎯 Key Git Concepts Demonstrated

- ✅ Branching strategy (`git checkout -b`)
- ✅ Commit and push workflow
- ✅ Pull Requests (PRs)
- ✅ Reviewer feedback & approval
- ✅ Merge conflict handling
- ✅ Role-based collaboration

---

## 📂 Project Folder Structure

```
/DevOps-Projects/02. Git-Version-Control-Basics/
├── index.html
└── README.md
```

---

## 🌐 GitHub Repository

🔗 [View on GitHub](https://github.com/Oluwaseunoa/DevOps-Projects)

---

## 🧠 What I Learned

This simulation provided hands-on experience in:

- Managing multiple contributors effectively
- Isolating features with branches
- Collaborating with feedback and code reviews
- Maintaining a clean, conflict-free codebase using Git



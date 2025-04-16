

# 🛠️ Mini Project – Git Branching and Merging

This project demonstrates how multiple developers (Tom and Jerry) can collaborate on a project using Git branching and merging strategies. It outlines the process of creating and reviewing Pull Requests (PRs) before merging into the main branch.

---

## 🔀 Workflow Overview

The project simulates collaboration between two developers, each working on their own branch:

- Tom: update-navigation
- Jerry: edit-contact (formerly add-contact-info)

Both developers push their changes, create Pull Requests, and merge into the main branch.

---

## 📌 Understanding Pull Requests

A Pull Request (PR) is a GitHub feature that enables developers to:

- Propose code changes,
- Request code reviews,
- Collaborate on improvements,
- Merge only approved contributions into shared branches.

---

## 👨‍💻 Developer 1: Tom – update-navigation

### Step-by-Step Workflow

1. Create and switch to feature branch:

```bash
git checkout -b update-navigation
```
!![Git checkout to new branch: update-navigation](./img/1.VScodeGit1stbranch.png)
2. Edit navigation content.
!![Editing html](./img/2.VScodeGit1stbranchhtmledit.png)
3. Stage and commit changes:

```bash
git add .
git commit -m "Update navigation menu"
```

4. Push the feature branch to GitHub:

```bash
git push origin update-navigation
```

 ![Screenshot Placeholder: Push confirmation in terminal](./img/3.VScodeGitAddcommitandpushbranch.png)

5. Open GitHub Repository and switch to update-navigation branch  
![🖼️ Screenshot Placeholder: GitHub branch switch](./img/4.GithubOpenpullrequest.png)

6. Create a Pull Request  
![🖼️ Screenshot Placeholder: New Pull Request creation](./img/5.GithubCreatepullrequest.png)
![🖼️ Screenshot Placeholder: Opened Created Pull Request creation](./img/6.OpenCreatedPR.png)

7. Review and approve the PR  
![🖼️ Screenshot Placeholder: Reviewer approval screen](./img/7.approvalofPR.png)

8. Merge the PR into main  
![🖼️ Screenshot Placeholder: Merged PR confirmation](./img/8.mergePRtomain.png)

9. Confirm merge success  
![🖼️ Screenshot Placeholder: GitHub PR shows "Merged" status](./img/9.PRMergetomain.png)

✅ Status: update-navigation successfully merged into main

---

## 👨‍💻 Developer 2: Jerry – edit-contact

### Step-by-Step Workflow

1. Create and switch to new feature branch:

```bash
git checkout -b edit-contact
```
!![Git checkout to new branch: edit-contact](./img/10.VscodeGitbranchEditContact.png)
2. Pull the latest updates from main:

```bash
git pull origin main
```

![🖼️ Screenshot Placeholder: Pull success with merge confirmation](./img/11.GitPullOriginMain.png)

3. Confirm branch status:

```bash
git status
```
!![Git status check](./img/12.GitStatusCheckEditContact.png)

4. Push updated branch to GitHub:

```bash
git push origin edit-contact
```

!![🖼️ Screenshot Placeholder: GitHub shows edit-contact pushed](./img/13.GitPushEditContact.png)
![Check pushed edit-contact](./img/14.GitHubcheckbranch.png)
5. Open a Pull Request on GitHub  
![🖼️ Screenshot Placeholder: New Pull Request for edit-contact](./img/15.openPR.png)
![Create new PR for edit-contact](./img/16.CreatePR.png)


6. Review changes and approve  
![Review and approve changes](./img/17.EditContactPR.png)  
![🖼️ Screenshot Placeholder: Reviewer review and approval](./img/18.ReviewandApprovePR.png)
7. Merge the PR into main  
![🖼️ Screenshot Placeholder: Merge confirmation](./img/19.MergePREditcontact.png)

8. Confirm successful merge  
[🖼️ Screenshot Placeholder: GitHub PR shows "Merged" status](./img/20.MergedEditContact.png)

✅ Status: edit-contact successfully merged into main

---

## 📁 GitHub Repository Validation

🔗 Repository URL: [DevOps Projects GitHub Repo](https://github.com/Oluwaseunoa/DevOps-Projects)


---

## 📚 Summary

This Git collaboration workflow demonstrates:

- Feature isolation through branching.
- Controlled integration with Pull Requests.
- Conflict prevention via branch synchronization.
- Traceable contributions through commits, screenshots, and PR history.

It highlights DevOps best practices for collaborative software development using Git and GitHub.

---

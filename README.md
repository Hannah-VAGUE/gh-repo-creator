# GitHub Repository Creator Script ✨

## Overview
This script automates the process of creating a new GitHub repository using the command line. It initializes a local Git repository, creates a corresponding remote repository on GitHub, and sets up the connection—all in one go!

## Features
- Creates a new GitHub repository directly from your terminal.
- Initializes a local Git repository with a README file.
- Adds and commits initial files.
- Connects the local repo to GitHub and pushes the first commit.
- Supports both SSH and HTTPS remote URLs.

## Prerequisites
Before running the script, ensure you have:

1. **Git installed** – [Download Git](https://git-scm.com/downloads)
2. **GitHub CLI (`gh`) installed** – [Install GitHub CLI](https://cli.github.com/)
3. **Authenticated GitHub CLI** – Run the following command and follow the login steps:
   ```sh
   gh auth login
   ```
4. **GitHub Personal Access Token (if using HTTPS)** – [Generate Token](https://github.com/settings/tokens)
   - Export your token before running the script:
   ```sh
   export GITHUB_TOKEN="your_personal_access_token"
   ```
5. **SSH Keys (if using SSH)** – Ensure your SSH key is generated and added to GitHub:
   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_rsa
   ```
   Add the public key to GitHub under **Settings > SSH and GPG keys**.

## Installation & Usage
### 1️⃣ Clone the Script
```sh
git clone https://github.com/Hannah-VAGUE/gh-repo-creator.git
cd gh-repo-creator
```

### 2️⃣ Run the Script
Using SSH:
```sh
./newGhRepo.sh <repository-name>
```
Or using HTTPS:
```sh
GIT_URL_TYPE="https" ./newGhRepo.sh <repository-name>
```
If no repository name is provided, the script will prompt you to enter one.

### 3️⃣ Verify the Repository
After execution, check your GitHub profile to confirm the repository was created:
[https://github.com/<your_profile>](https://github.com/<your_profile>)

## Troubleshooting
### "Unable to add remote 'origin'"
- Ensure you're authenticated with `gh auth login`.
- If using SSH, verify that your SSH key is added to GitHub (`~/.ssh/id_rsa.pub`).
- If using HTTPS, confirm your GitHub personal access token is set and exported.

### "Remote repository creation failed"
- Ensure your GitHub account allows repository creation.
- Check if the repo name is already in use.
- Try running `gh repo create <repo-name>` manually to debug.

## License
This script is open-source under the **MIT License**.

## Author
**[Hannah.VAGUE](https://github.com/Hannah-VAGUE)**  🚀✨


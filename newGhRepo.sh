#!/bin/sh
# Set GitHub Username and Token (Optional: Use if not already set in the environment)
GITHUB_USERNAME="Hannah-VAGUE"

# Ensure GITHUB_TOKEN is set externally (Recommended)
# Export your GitHub Token before running the script
# export GITHUB_TOKEN="your_personal_access_token"
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN is not set. Export it using: export GITHUB_TOKEN='your_personal_access_token'"
    exit 1
fi

repoName=$1

# Get repo name from argument or ask user
while [ -z "$repoName" ]
do
   echo 'Provide a repository name'
   read -r -p $'Repository name:' repoName
done

# Create a README.md file with the repository name
echo "# $repoName" >> README.md

# Initialize local git repository
git init
git add .
git commit -m "First commit"

# Create GitHub repo using `gh` CLI instead of curl
gh auth status >/dev/null 2>&1 || gh auth login  # Ensure authenticated

gh repo create "$repoName" --public --source=. --remote=origin
if [ $? -ne 0 ]; then
    echo "Error: GitHub repository '$repoName' creation failed."
    exit 1
fi

# Use SSH instead of HTTPS for authentication
GIT_URL="git@github.com:$GITHUB_USERNAME/$repoName.git"

# Validate the clone URL
if [ "$GIT_URL" = "null" ]; then
    echo "Error: Repository was not created properly. Check API response above."
    exit 1
fi

#Debugging: Confirm the clone URL
echo "Cloning from: $GIT_URL"

# Set up Git remote and push
git branch -M main
git remote add origin "$GIT_URL"
        # OR
# If there's an error pushing the origin branch to main
# Remove existing origin if it exists, then add a new one
git remote remove origin 2>/dev/null 
git remote add origin "$GIT_URL"
# git remote set-url origin https://"$GITHUB_TOKEN"@github.com/"$GITHUB_USERNAME"/"$repoName".git

# Verify remote URL and push to GitHub
git remote -v
git push -u origin main 
       # OR
# If there's an error pushing the origin branch to main
# git push -u origin main --force

echo "Repository successfully pushed to GitHub: https://github.com/$GITHUB_USERNAME/$repoName"

# When you git clone, git fetch, git pull, or git push to a private remote repository using HTTPS URLs on the command line, Git will ask for your GitHub username and password. 
# When Git prompts you for your password, enter your personal access token.
# https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token'

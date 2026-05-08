# additions to omz/git
alias gpl="git pull"
alias gra="git remote add origin"

# open merge conflicts in cursor
gitfix() { git diff --name-only | uniq | xargs cursor }

# copy current branch name
gitcpb() { git rev-parse --abbrev-ref HEAD | tr -d '\n ' | pbcopy }

# nuke a branch locally and on remote
gitnuke() { git branch -D "$1" && git push origin --delete "$1" }

# rename branch and update
gitrename() { git branch -m "$1" "$2" && git push origin --delete "$1" && git push origin -u "$2" }

# setup branch to track remote branch
gittrack()  { git branch "$1" --set-upstream-to "origin/$1" }

# show diff of unpushed changes
gitunpushed() { git diff "origin/$(git rev-parse --abbrev-ref HEAD)..HEAD" }

# clean local branches
gitclean() { git branch --merged | grep -vE '^\*|^\s*(master|main)\s*$' | xargs -r git branch -d }

# generate gitignore from gitignore.io
gitignore() { curl -L -s "https://www.gitignore.io/api/$*" }
alias gi="gitignore"

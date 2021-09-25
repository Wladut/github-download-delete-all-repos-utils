#!/bin/bash
#clone all repositories (including private ones) at once
#you need ssh key generated because is using ssh github link
GITHUB_USER="YOUR GITHUB USERNAME"
ACCESS_TOKEN="YOUR GITHUB GENERATED TOKEN"
curl -H "Authorization: token $ACCESS_TOKEN" "https://api.github.com/search/repositories?q=user:$GITHUB_USER&page=1&per_page=100" | grep -o 'git@[^"]*' | xargs -L1 git clone
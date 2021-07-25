#Delete all repositories (including private) bash script
#generate token access from github to use it also for private repositories
GITHUB_USERNAME="YOUR GITHUB USERNAME"
ACCESS_TOKEN="YOUR GITHUB GENERATED TOKEN"
#Save all repositories to url_list.txt
curl "https://api.github.com/search/repositories?q=user:$GITHUB_USERNAME&access_token=$ACCESS_TOKEN&page=1&per_page=100" | grep git_url | sed -r 's/(    "git_url": "git:\/\/github.com\/)//' | sed -r 's/.git",//'  > url_list.txt
#Delete all the repositories it found on the line before
while read r;do curl -X DELETE "https://api.github.com/repos/$r?q=user:$GITHUB_USERNAME&access_token=$ACCESS_TOKEN";done < url_list.txt
rm url_list.txt
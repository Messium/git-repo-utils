repo=$(gh repo list --limit 100 --json name,description | jq -r '.[] | "\(.name)"' | fzf)
user=$1
url="https://github.com/$user/$repo.git"
echo "$url"
firefox "$url"
dest_path="$HOME/dev/git/"
repo_name=$(echo "$url" | awk -F'/' '{print $NF}' | sed 's/\.git$//')
response=$(gum choose "yes" "no" --header "Do you want to clone repo?")
if [ "$response" == "yes" ]; then
    git clone "$url" "$dest_path""$repo_name"
fi

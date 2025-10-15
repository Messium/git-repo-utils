star=$(gh api user/starred | jq -r '.[].full_name' | fzf)
url=$(gh api repos/$star | jq -r '.html_url')
echo "$url"
firefox "$url"
dest_path="$HOME/git"
repo_name=$(echo "$url" | awk -F'/' '{print $NF}')
response=$(gum choose "yes" "no" --header "Do you want to clone repo?")
if [ "$response" == "yes" ]; then
    git clone "$url" "$dest_path"/"$repo_name"
fi

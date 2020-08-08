####################
###### general #####
####################
mkcd() { #mkdir && cd
	if [[ ! -n "$1" ]]; then
		echo "Enter a directory name"
	elif [[ -d "$1" ]]; then
		echo "\`$1' already exists"
	else
		mkdir -p "$1" && cd "$1"
	fi
}

mktc() { #mkdir && touch
	if [[ ! -n "$1" ]]; then
		echo "Enter a directory/file name"
	elif [[ -d "$(dirname "$1")" || -f "$1" ]]; then
		echo "\`$1' already exists"
	else
		mkdir -p "$(dirname "$1")" && touch "$1"
	fi
}

###############
##### git #####
###############
gcr() {( #git-create-repo
	set -e

	if [[ $PWD/ != ~/dev/git/* ]]; then
		echo "Directory not under ~/dev/git/"
		exit 1
	fi

	repository_name=${PWD##*/}
	token=$(cat ~/dev/resources/secrets/github-repo-pat)
	success_response="Repository successfully created"
	error_response="Error"
	response_code="Response Code:"

	response=$(curl -s -o /dev/null -w '%{http_code}' \
		-H "Authorization: token $token" \
		https://api.github.com/user/repos \
		-d "{ \"name\":\"${repository_name}\" }")

	if [[ "$response" == "201" ]]; then
		echo ${success_response}
		echo ${response_code} $response
	else
		echo ${error_response}
		echo ${response_code} $response
		exit 1
	fi

	git init
	touch README.md
	git add README.md
	git commit -m "initial commit"
	git remote add origin git@github.com:gomdopi/${repository_name}.git
	git push -u origin master
)}

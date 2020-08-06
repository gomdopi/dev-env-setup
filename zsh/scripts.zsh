#general
mkcd() {
	if [ ! -n "$1" ]; then
		echo "Enter a directory name"
	elif [ -d $1 ]; then
		echo "\`$1' already exists"
	else
		mkdir -p $1 && cd $1
	fi
}

#git
gcr() { ~/dev/scripts/git-create-repo.sh $1; }

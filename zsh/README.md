<p align="center">
  <img src="/resources/images/oh-my-zsh-logo.png" alt="Oh My Zsh">
</p>

# Installation/Set-up
## [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

- Copy directory contents to $ZSH_CUSTOM

---

# More Details
## alias.zsh
### alias ujv (update java version)
- Make sure to set the following:

  ```zsh
  $ export JAVA_HOME=/opt/java/current
  $ export PATH=$JAVA_HOME/bin:$PATH
  ```

  [Setting up your own alternatives](https://stackoverflow.com/a/60377885)

---

## scripts.zsh
### gcr()
- Set the following such that it makes sense for your set-up:
  - **${GIT_DIRECTORY}**
  
    > This assures you are only creating git repos in directories/projects under the specified directory
    ```sh
    if [[ $PWD/ != ${GIT_DIRECTORY}/* ]]; then
        echo "Directory not under ${GIT_DIRECTORY}"
        exit 1
    fi
    ``` 
  
  - **${PATH_TO_FILE_WITH_PERSONAL_ACCESS_TOKEN}**
  
    > Required for access to GitHub's APIs to create repos via CLI
    ```sh
    token=$(cat ${PATH_TO_FILE_WITH_PERSONAL_ACCESS_TOKEN})
    ```
    >   e.g. `${PATH_TO_FILE_WITH_PERSONAL_ACCESS_TOKEN} = ~/github/tokens/repo`
    >
    >   where `repo` would be a one-line file containing just the personal access token
    >
    >   You could also directly copy in your personal access token
    >   
    >   I just set it up this way so my token isn't exposed
    
    [Creating A Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)
  
  - **${GITHUB_USERNAME}**
  
    > Should be your GitHub username
    ```sh
    git remote add origin git@github.com:${GITHUB_USERNAME}/${repository_name}.git
    ```

- Parentheses `()` inside the curly braces `{}` are to run the script in a subshell such that
  the `exit 1` command inside the function exits the subshell instead of the main terminal shell:
  ```sh
  gcr() {( <===
    //...
  )}
  ^
  |
  |
  ```

  [Subshells](https://www.tldp.org/LDP/abs/html/subshells.html)

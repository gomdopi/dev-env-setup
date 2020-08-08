<p align="center">
  <img src="/resources/images/oh-my-zsh-logo.png" alt="Oh My Zsh">
</p>

<pre background-color: gray><code>
testing
</code></pre>

<pre style="color: blue"><code>
testing2
</code></pre>

# Installation/Set-up
## [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

- Copy directory contents to $ZSH_CUSTOM

---

# More Details
## alias.zsh
### alias ujv (update java version)
- Make sure to set the following:

  ```
  $ export JAVA_HOME=/opt/java/current
  $ export PATH=$JAVA_HOME/bin:$PATH
  ```

  https://stackoverflow.com/a/60377885

---

## scripts.zsh
### gcr()
- Set the following that makes sense for your set-up:
  - **${GIT_DIRECTORY}**
  
    > This assures you are only creating git repos in directories/projects under the specified directory
    ```
    ...
    if [[ $PWD/ != ${GIT_DIRECTORY}/* ]]; then
        echo "Directory not under ${GIT_DIRECTORY}"
        exit 1
    fi
    ...
    ``` 
  
  - **${TOKEN}**
  
    > Required for access to GitHub's APIs to create repos via CLI
    ```
    ...
    repository_name=${PWD##*/}
    token=${TOKEN}
    success_response="Repository successfully created"
    ...
    ```
    https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token
  
  - **${GITHUB_USERNAME}**
  
    > Should be your GitHub username
    ```
    ...
    git commit -m "initial commit"
    git remote add origin git@github.com:${GITHUB_USERNAME}/${repository_name}.git
    git push -u origin master
    ...
    ```

- Parentheses `()` inside the curly braces `{}` are to run the script in a subshell such that
  the `exit 1` command inside the function exits the subshell instead of the main terminal shell:
  ```zsh
  gcr() {( <===
    //...
  )}
  ^
  |
  |
  ```

  https://www.tldp.org/LDP/abs/html/subshells.html

<p align="center">
  <img src="/resources/images/oh-my-zsh-logo.png" alt="Oh My Zsh">
</p>

# Installation/Set-up
[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

Copy directory contents to $ZSH_CUSTOM

---

# More Details
## alias.zsh
### alias ujv (update java version)
Make sure to set the following:

```
$ export JAVA_HOME=/opt/java/current
$ export PATH=$JAVA_HOME/bin:$PATH
```

https://stackoverflow.com/a/60377885

## scripts.zsh
### gcr()
Parentheses inside the curly braces are to run the script in a subshell or child process
```
gcr() {( <===
	//...
)}
^
|
|
```

https://www.tldp.org/LDP/abs/html/subshells.html

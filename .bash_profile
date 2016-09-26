export PATH="/Applications/CMake.app/Contents/bin:$PATH"
export PATH="/Applications:$PATH"
export PATH="/usr/local/bin:$PATH" # use brewed stuff before system
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color # or screen-256color


# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

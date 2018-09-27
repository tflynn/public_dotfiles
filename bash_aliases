# Startup files

alias startup="cd $STARTUP_DIR"
alias dotfiles="cd $DOTFILES"
alias mybin="cd $MYBIN"

# Load rbenv unless already loaded
echo "$PATH" | grep "$HOME/.rbenv/shims" 2>&1 >/dev/null
exit_code=$?
if [ "$exit_code" == "1" ]; then	
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

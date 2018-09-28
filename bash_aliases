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

function link_bin_file() {
    source_file=$1
    full_source_file="${STARTUP_DIR}/mybin/${source_file}"
    full_target_file="${HOME}/bin/${source_file}"
    if [ -e ${full_target_file} ]; then
        rm -f ${full_target_file}
    fi
    if ! [ -e ${full_target_file} ]; then
        ln -s ${full_source_file} ${full_target_file}
    fi
}

function link_bin_files() {
    for bin_file in $(ls -1 "$STARTUP_DIR/mybin")
    do
        link_bin_file ${bin_file}
    done
}

function update_startup() {
	startup_repo_dirs=('bash-it' 'my-bash-it' 'dotfiles' 'mybin')
	for repo_dir in ${startup_repo_dirs[@]}
	do
		full_repo_dir="$STARTUP_DIR/$repo_dir"
		if [ -d $full_repo_dir ]; then
			pushd $full_repo_dir
			git pull origin master
			popd
		fi
	done

	link_bin_files
}

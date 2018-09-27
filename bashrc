#
# .bashrc is invoked by ssh
#
if [ "{BASH_PROFILE_LOADED:-false}" == "false" ]; then
	source ${HOME}/.bash_profile
fi

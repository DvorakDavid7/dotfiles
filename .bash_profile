
if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

##
# Your previous /Users/david/.bash_profile file was backed up as /Users/david/.bash_profile.macports-saved_2022-04-17_at_15:48:07
##

# MacPorts Installer addition on 2022-04-17_at_15:48:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$HOME/.elan/bin:$PATH"

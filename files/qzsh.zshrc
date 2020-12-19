#!/usr/bin/zsh
# Set this to the location of your qzsh installision
# if you decided to change the path.
export QZSH_PREFIX="${HOME}/.qzsh"

# Make shure zsh starts instantly.
if [[ -r "${QZSH_PREFIX}/instant-zsh.zsh" ]]; then
	source "${QZSH_PREFIX}/instant-zsh.zsh"

	# Set this to something that more or less matches your prompt theme!
	instant-zsh-pre '%n@%m %~%# '
fi

#--------------------------------------------------------------#
# You can configure some parts of qzsh here.

# The plugins you want to have loaded qzsh.
qzsh plugins load git

# The theme you want to have loaded by qzsh.
qzsh theme load agnoster

# Enables some aliases and functions that I personally like but that
# you may or may not find annoying. This does not effect the aliases
# for ls and cat as well as the ones purely for color, as those are
# configured below.
# Possible values: *true*, false
QZSH_ENABLE_ALIASES=true

# Enables colors in some commands as well as in completion.
# Possible values: *true*, false
QZSH_ENABLE_COLORS=true

# Replace cat with bat, which supports syntax coloring. Does
# nothing if bat is not installed.
# Possible values: *true*, false
QZSH_REPLACE_CAT_WITH_BAT=true

# Replace ls with either exa or lsd. Does nothing if neither
# is installed.
# Possible values: *exa*, lsd, false
QZSH_REPLACE_LS_WITH=exa

#--------------------------------------------------------------#
# Your custom user configuration goes here.



#--------------------------------------------------------------#

(( ! ${+functions[instant-zsh-pre]} )) || instant-zsh-pre
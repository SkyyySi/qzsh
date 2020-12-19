#!/usr/bin/zsh
# Environment
setopt promptsubst
autoload -Uz add-zsh-hook

# Oh-my-zsh.
if [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/init/omz.zsh" ]]; then
	source "${QZSH_PREFIX:-$HOME/.qzsh}/init/omz.zsh"
fi

function qzsh {
	local function load_plugin {
		local p
		for p in $@; do
			# First, check for plugins installed in qzsh's plugin folder...
			  if [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}/${p}.plugin.zsh" ]];            then source "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}/${p}.plugin.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}/${p}.zsh" ]];                   then source "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}/${p}.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}.plugin.zsh" ]];                 then source "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}.plugin.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}.zsh" ]];                        then source "${QZSH_PREFIX:-$HOME/.qzsh}/plugins/${p}.zsh"

			# ...then, check for plugins installed in oh-my-zsh's plugin folder...
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}/${p}.plugin.zsh" ]];        then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}/${p}.plugin.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}/${p}.zsh" ]];               then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}/${p}.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}.plugin.zsh" ]];             then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}.plugin.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}.zsh" ]];                    then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/plugins/${p}.zsh"

			# ...then, check for plugins installed in oh-my-zsh's "custom" plugin folder...
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}/${p}.plugin.zsh" ]]; then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}/${p}.plugin.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}/${p}.zsh" ]];        then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}/${p}.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}.plugin.zsh" ]];      then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}.plugin.zsh"
			elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}.zsh" ]];             then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/plugins/${p}.zsh"

			# ...and lastly, check for plugins installed in /usr/share/zsh/plugins, a common folder for global zsh plugins.
			elif [[ -r "/usr/share/zsh/plugins/${p}/${p}.plugin.zsh" ]];                         then source "/usr/share/zsh/plugins/${p}/${p}.plugin.zsh"
			elif [[ -r "/usr/share/zsh/plugins/${p}/${p}.zsh" ]];                                then source "/usr/share/zsh/plugins/${p}/${p}.zsh"
			elif [[ -r "/usr/share/zsh/plugins/${p}.plugin.zsh" ]];                              then source "/usr/share/zsh/plugins/${p}.plugin.zsh"
			elif [[ -r "/usr/share/zsh/plugins/${p}.zsh" ]];                                     then source "/usr/share/zsh/plugins/${p}.zsh"
		done
	}

	local function load_theme {
		# First, check for themes installed in qzsh's plugin folder...
		  if [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}/${1}.zsh-theme" ]];            then source "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}/${1}.zsh-theme"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}/${1}.zsh" ]];                  then source "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}/${1}.zsh"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}.zsh-theme" ]];                 then source "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}.zsh-theme"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}.zsh" ]];                       then source "${QZSH_PREFIX:-$HOME/.qzsh}/themes/${1}.zsh"

		# ...then, check for themes installed in oh-my-zsh's plugin folder...
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}/${1}.zsh-theme" ]];        then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}/${1}.zsh-theme"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}/${1}.zsh" ]];              then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}/${1}.zsh"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}.plugin.zsh" ]];            then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}.zsh-theme"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}.zsh" ]];                   then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/themes/${1}.zsh"

		# ...then, check for themes installed in oh-my-zsh's "custom" plugin folder...
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}/${1}.zsh-theme" ]]; then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}/${1}.zsh-theme"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}/${1}.zsh" ]];       then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}/${1}.zsh"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}.zsh-theme" ]];      then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}.zsh-theme"
		elif [[ -r "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}.zsh" ]];            then source "${QZSH_PREFIX:-$HOME/.qzsh}/omz/custom/themes/${1}.zsh"

		# ...and lastly, check for themes installed in /usr/share/zsh/themes, a common folder for global zsh plugins.
		elif [[ -r "/usr/share/zsh/themes/${1}/${1}.zsh-theme" ]];                         then source "/usr/share/zsh/themes/${1}/${1}.zsh-theme"
		elif [[ -r "/usr/share/zsh/themes/${1}/${1}.zsh" ]];                               then source "/usr/share/zsh/themes/${1}/${1}.zsh"
		elif [[ -r "/usr/share/zsh/themes/${1}.zsh-theme" ]];                              then source "/usr/share/zsh/themes/${1}.zsh-theme"
		elif [[ -r "/usr/share/zsh/themes/${1}.zsh" ]];                                    then source "/usr/share/zsh/themes/${1}.zsh"
	}

	case "${1}" in
		plugins)
			if [[ -z "${2}" ]]; then
				echo 'Expected at least one argument.'
				exit 1
			else
				shift
				case "${1}" in
					load)
				esac
			fi
		;;
	esac
}
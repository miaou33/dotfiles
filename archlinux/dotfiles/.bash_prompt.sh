# Reset
reset="\[\e[0m\]"

# Regular Colors
black="\[\e[0;30m\]"
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
magenta="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[0;37m\]"
orange="\[\e[0;38;5;208m\]"
light_blue="\[\e[0;38;5;39m\]"
light_purple="\[\e[0;38;5;141m\]"
dark_grey="\[\e[0;38;5;236m\]"
light_grey="\[\e[0;38;5;250m\]"

# Bright Colors
bright_red="\[\e[0;38;5;196m\]"
bright_green="\[\e[0;38;5;46m\]"
bright_yellow="\[\e[0;38;5;226m\]"
bright_blue="\[\e[0;38;5;21m\]"
bright_magenta="\[\e[0;38;5;201m\]"
bright_cyan="\[\e[0;38;5;51m\]"
bright_white="\[\e[0;38;5;15m\]"


# High Intensity Text Colors
intense_black="\[\e[0;90m\]"
intense_red="\[\e[0;91m\]"
intense_green="\[\e[0;92m\]"
intense_yellow="\[\e[0;93m\]"
intense_blue="\[\e[0;94m\]"
intense_magenta="\[\e[0;95m\]"
intense_cyan="\[\e[0;96m\]"
intense_white="\[\e[0;97m\]"


sep_color=$intense_green
on_error="\$([[ \$? != 0 ]] && echo \"${red}✗${white}${sep_color}]─\")"
username_host="$(if [[ ${EUID} == 0 ]]; then echo "${bright_red}root"; else echo "${magenta}\u";	fi)"
current_directory="${light_purple}\w"
git_branch="${dark_grey}\$(git branch 2>/dev/null | grep \* | colrm 1 2)"
symbol="${bright_magenta}\$"

# Combine all parts to form the PS1
PS1="${sep_color}┌─${on_error}"
PS1+="${sep_color}[${username_host}"
PS1+="${sep_color}]─[${current_directory}"
PS1+="${sep_color}] ${git_branch}"
PS1+="${sep_color}\n└──╼ ${symbol} "
PS1+="${reset}"



export PS1

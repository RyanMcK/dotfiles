export OMPI_CC="/opt/local/bin/gcc"
export OMPI_CXX="/opt/local/bin/g++"

export PATH="/opt/local/libexec/gnubin:/opt/local/bin:${PATH}"
export PATH="/opt/local/lib/openmpi/bin:${PATH}"

export CC="/opt/local/bin/gcc"
export CXX="/opt/local/bin/g++"

# Enable color highlighting for `ls`.
alias ls="ls --color=auto"

# Import custom Solarized dircolors.
eval `dircolors ~/.dir_colors`

# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Colors will work nice when used with "Solarized" palette.
# Nothing new here
White='\[\e[0;37m\]'        # White
BPurple='\[\e[1;35m\]'      # Purple
Green='\[\e[0;32m\]'        # Green
Blue='\[\e[0;34m\]'         # Blue
Yellow='\[\e[0;33m\]'       # Yellow
Purple='\[\e[0;35m\]'       # Purple
BWhite='\[\e[1;37m\]'       # White

# custom prompt. 
# User input is colored in white
# the trap will reset the colors before execution of commands
#PS1="${BPurple}\A ${Green}\u${Color_Off}@${Blue}\h${Color_Off}:[${Yellow}\w${Color_Off}]${Purple}\n$ ${BWhite}"

export PS1="${Blue}\u${Color_off} ${BPurple}\w${Color_Off}\$ "
# reset color after prompt
#trap "echo -ne '\e[0m'"

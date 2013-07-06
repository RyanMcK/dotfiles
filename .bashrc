export PATH="/opt/local/libexec/gnubin:/opt/local/bin:${PATH}"

export CC="/opt/local/bin/gcc"
export CXX="/opt/local/bin/g++"

# Enable color highlighting for `ls`.
alias ls="ls --color=auto"

# Import custom Solarized dircolors.
eval `dircolors ~/.dir_colors`

export PS1="\u \W\$ "

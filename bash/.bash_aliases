# ls runs ls with color set to auto
alias ls="ls --color=auto"

# dir runs dir with color set to auto
#alias dir="dir --color=auto"

# vdir runs vdir with color set to auto
#alias vdir="vdir --color=auto"

# grep runs grep with color set to auto
alias grep="grep --color=auto"

# egrep runs egrep with color set to auto
alias egrep="egrep --color=auto"

# fgrep runs fgrep with color set to auto
alias fgrep="fgrep --color=auto"

# zgrep runs zgrep with color set to auto
alias zgrep="zgrep --color=auto"

# ll prints out all files including files with . (dot) (a), lists
# the links, owners groups, size in bytes, and last mod time (l),
# and puts a slash after name if dir (F)
alias ll="ls -alF"

# la prints out all files except those with . (dot) and .. (dot-dot) (A)
alias la="ls -A"

# l prints out all files where they are sorted vertically in multicolumn
# format (C) and puts slashes after name if dir (F)
alias l="ls -CF"

# lsa prints out the files with the links, owners, groups, size in bytes,
# and last mod time (l), sorted by time of last mod (t), with all entries
# except . (dot) and .. (dot-dot) (A), slashes after name if dir (F) and
# sizes converted from bytes to KB, MB, etc (human-readable). The output is
# displayed by most recently modified then name
alias lsa="ls -ltAF --human-readable"

# lsr prints out the files with the links, owners, groups, size in bytes,
# and last mod time (l), sorted by time of last mod (t), then reversed by
# alphabetic order or oldest mod time (r), with all entries except . (dot)
# and .. (dot-dot) (A), slashes after name if dir (F) and sizes converted
# from bytes to KB, MB, etc (human-readable). The output is displayed by
# most recently modified then name
alias lsr="ls -ltrAF --human-readable"

# tls lists all tmux sessio
alias tls="tmux ls"

# ta attaches a named tmux session. Since alias can't take parameters, a
# function is used. The parameter passed should be the session name to attach
ta() {
	tmux a -t "$1"
}

# zgrepR runs recursive zgrep. Since alias can't take parameters, a function
# is used. The zgrep -r, -R, or --recursive flag is not supported in all
# versions or installations. The parameter passed is the string to search
# in the files
zgrepR() {
	zgrep "$1" $(find . -name "*.gz")
}

# tkill kills a named tmux session. Since alias can't take parameters, a
# function is used. The parameter passed should be the session name to kill
tkill() {
	tmux kill-session -t "$1"
}

# machoff runs a send event to turn a machine offline. Since alias can't take
# parameters, a function is used. The parameter passed should be the machine
# name to take offline
machoff() {
        sendevent -N $1 -E MACH_OFFLINE
}

# machon runs a send event to turn a machine online. Since alias can't take
# parameters, a function is used. The parameter passed should be the machine
# name to take online
machon() {
        sendevent -N $1 -E MACH_ONLINE
}

# djob runs a send event to delete a job. Since alias can't take parameters,
# a function is used. The parameter passed should be the job (or partial job
# string with wildcards) to delete
djob() {
        sendevent -j $1 -e DELETEJOB
}

# onice runs a send event to set a job on ice. Since alias can't take parameters,
# a function is used. The parameter passed should be the job (or partial job string
# with wildcards) to set on ice
onice() {
        sendevent -j $1 -e JOB_ON_ICE
}

# office runs a send event to set a job off ice. Since alias can't take parameters,
# a function is used. The parameter passed should be the job (or partial job string
# with wildcards) to set off ice
office() {
        sendevent -j $1 -e JOB_OFF_ICE
}

# jr gets autorep job info. Since alias can't take parameters, a function
# is used. The parameter passed should be the job (or partial job string
# with wildcards) to get info on
jr() {
        autorep -j $1
}

# jd gets detailed autorep job info. Since alias can't take parameters, a
# function is used. The parameter passed should be the job (or partial job
# string with wildcards) to get info on
jd() {
        autorep -j $1 -d
}

# jq gets an autorep jil report. Since alias can't take parameters, a
# function is used. The parameter passed should be the job (or partial job
# string with wildcards) to get info on
jq() {
        autorep -j $1 -q
}

# jq0 gets an autorep jil report about at the top level. Since alias
# can't take parameters, a function is used. The parameter passed should be
# the top level job to get info on to get info on
jq0() {
        autorep -j $1 -q -l 0
}

# def prints out a function declaration. Since alias can't take parameters,
# a function is used. The parameter passed should be the function name
# to get the declaration for
def() {
        declare -f $1
}

# aux runs ps aux to see what processes are running with the given string
# in the name. Since alias can't take parameters, a function is used. The
# parameter passed should be the process name or name substring to check
# if running
aux() {
    ps -aux | { head -1; grep $1; }
}

# ef runs ps ef to see what processes are running with the given string
# in the name. Since alias can't take parameters, a function is used. The
# parameter passed should be the process name or name substring to check
# if running
ef() {
    ps -ef | { head -1; grep $1; }
}

# alert shows an alert for long running commands. It can be used like this:
#	sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? - 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

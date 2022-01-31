# la prints out the files with the links, owner, group, size in bytes,
# and last mod time (l), sorted by time of last mod (t), with all entries
# except . (dot) and .. (dot-dot) (A), slashes after name if dir (F) and
# sizes converted from bytes to KB, MB, etc (human-readable). The output is
# displayed by most recently modified then name
alias la="ls -ltAF --human-readable"

# lr prints out the files with the links, owner, group, size in bytes,
# and last mod time (l), sorted by time of last mod (t), then reversed by
# alphabatic order or oldest mod time (r), with all entries except . (dot)
# and .. (dot-dot) (A), slashes after name if dir (F) and sizes converted
# from bytes to KB, MB, etc (human-readable). The output is displayed by 
# least recently modified then by name
alias lr="ls -ltrAF --human-readable"

# ll prints out the files with the links, owner, group, size in bytes,
# and last mod time (l), sorted by time of last mod (t), slashes after name
# if dir (F) and sizes converted from bytes to KB, MB, etc (human-readable).
# The output is displayed by least recently modified then by name.
alias ll="ls -ltF --human-readable"

# tls lists all tmux sessions
alias tls="tmux ls"

# ta attaches a named tmux session. Since alias can't take paramters a 
# function is used. The parameter passed should be the session name to attach
ta() {
	tmux a -t "$1"
}

# zgrepR runs recursive zgrep. Since alias can't take paramaters, a function
# is used. The zgrep -r, -R, or --recursive flag is not supported in all
# versions or installations. The parameter passed should be the string to 
# search in the files
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

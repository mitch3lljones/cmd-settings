# ---------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------
# CMD ALIASES
# ---------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# GENERAL BASH CMD ALIASES AND FUNCTIONS
# ---------------------------------------------------------------------------------------

# def prints out a function declaration
alias def="declare -f"

# aux runs ps aux to see what processes are running with certain name/pattern
aux()
{
	ps -aux | { head -1; grep $1; }
}

# ef runs ps ef to see what processes are running with certain name/pattern
ef()
{
    ps -ef | { head -1; grep $1; }
}

# zgrepR runs recursive zgrep
zgrepR()
{
	zgrep "$1" $(find . -name "*.gz")
}

# ---------------------------------------------------------------------------------------
# LS CMD ALIASES
# ---------------------------------------------------------------------------------------

# ll gives a detailed ls output (l) for all files excluding implied dirs (a), 
# slashes after name if dir (F) and sizes converted 
# from bytes to KB, MB, etc (human-readable).
alias ll="ls -lAF --human-readable"

# llt runs the alias cmd ll sorted by last modified time (t)
alias llt="ls -ltAF --human-readable"

# llr runs the alias cmd llt sorted by least recently modified (r)
alias llr="ls -ltrAF --human-readable"


# lgrep runs the base ls command piped to grep
alias lgrep="ls | grep"

# llgrep runs the ll aliased command piped to grep
alias llgrep="ll | grep"

# ---------------------------------------------------------------------------------------
# GIT CMD ALIASES AND FUNCTIONS
# ---------------------------------------------------------------------------------------

# better git log with more understandable tree
alias gl='git log --graph --decorate'
alias glsource='git log --graph --decorate --source'

# ---------------------------------------------------------------------------------------
# KUBERNETES AND KUBECTL ALIASES AND FUNCTIONS
# ---------------------------------------------------------------------------------------

# k8s runs a shorthand for kubectl
alias k8s="kubectl"

# k8s-cc prints out the current kubectl namespace and context
alias k8s-cc="k8s config get-contexts | grep '*' | awk '{print \"context name: \033[31m\", \$2, \"\033[0m      namespace: \033[31m\",(\$5 == \"\" ? \"default\" : \$5) \"\033[0m\"}'"

# ---------------------------------------------------------------------------------------
# TMUX CMD ALIASES
# ---------------------------------------------------------------------------------------

# tls lists all tmux sessions
alias tls="tmux ls"

# ta attaches a named tmux session
alias ta="tmux a -t"

# tkill kills a named tmux session
alias tkill="tmux kill-session -t"

# ---------------------------------------------------------------------------------------
# AUTOSYS CMD ALIASES AND FUNCTIONS
# ---------------------------------------------------------------------------------------

#jr gets a basic autosys job report
alias jr="autorep -j"

# jd gets a detailed autosys job report
alias jd="autorep -d -j"

# jq gets an autosys jil report for a job
alias jq="autorep -q -j"

# jq0 gets an autosys jil report for a job at the top level
alias jq0="autorep -q -l 0 -j"

# machoff runs a send event to turn a machine offline
alias machoff="sendevent -E MACH_OFFLINE -N"

# machon runs a send event to turn a machine online
alias machon="sendevent -E MACH_ONLINE -N"

# djob runs a send event to delete a job
alias djob="sendevent -e DELETEJOB -j"

# kjob runs a send event to force stop a job
alias kjob="sendevent -e KILLJOB -j"

# onice runs a send event to put an autosys job on ice
alias onice="sendevent -e JOB_ON_ICE -j"

# office runs a send event to take an autosys  job off ice
alias office="sendevent -e JOB_OFF_ICE -j"

# fsj runs a send event to force start an autosys job
alias fsj="sendevent -e FORCE_STARTJOB -j"

# ---------------------------------------------------------------------------------------
# AUTOSYS CMDS FROM BO
# ---------------------------------------------------------------------------------------

# ka sets an autosys job to not send an alarm on failure
ka()
{
	echo "update_job: $1 alarm_if_fail: 0" | jil
}

# ra sets an autosys job back to send an alarm on failure
ra()
{
	echo "update_job: $1 alarm_if_fail: 1" | jil
}

# autoelf grabs the latest log file for an autosys job
# log file path is pulled from the autosys job def std_out_file
# log file is read from either vip or a specific machine 
# if vip not specified in job def
autoelf()
{
    if [[ -z $1 ]]
    then
        echo "Must specify job name"
   else
        local jobinfo=$(jq ${1})

        local aod=$(jr ${1} | tail -n 1 | awk '{print $2}' | awk -F/ '{print $3$1$2}')

        local mname=$(echo "${jobinfo}" | grep machine | awk -F: '{print $2}')

        # Check for a vip
        if [[ $(echo "${mname}" | egrep '.+-vl$') ]]
        then
            # If we find a vip, we have to pull a machine from the pool
            mname=$(autorep -m ${mname} | grep Online | head -n 1 | awk '{print $1}' | awk -F. '{print $2}')
            echo "Pulled ${mname} from the vip pool"
        fi

        # Updated to pull the last start date so we can get the correct log if we are looking across date ends.
        local logfile=$(jq ${1} | grep std_out_file | awk -F: '{print $2}' | sed s'/>>//' | sed s"/\$\$YYYYMMDD/${aod}/" | sed s"/\$AUTO_JOB_NAME/${1}/")
        ssh -q -o StrictHostKeyChecking=no ${mname} "cat ${logfile}" | less

   fi
}

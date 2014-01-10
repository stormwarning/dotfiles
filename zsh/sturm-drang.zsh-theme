function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "
$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

parse_vm_state() {
    # Check to see if we're in a directory with vagrant
    [ -e .vagrant ] || return 1
    # vm_name=$(VBoxManage showvminfo  $(find .vagrant -type f -name 'id' | while read line; do cat "${line}"; echo; done) --machinereadable | grep 'Name=' | sed '\"(.*)\"')
    vm_state=$(VBoxManage showvminfo  $(find .vagrant -type f -name 'id' | while read line; do cat "${line}"; echo; done) --machinereadable | grep 'VMState=' | sed 's/.*"\(.*\)"[^"]*$/\1/')
    echo "$VM_PROMPT_PREFIX${vm_state}$VM_PROMPT_SUFFIX"
}

function get_pwd() {
    print -D $PWD
}

function put_spacing() {
    local git=$(git_prompt_info)
    if [ ${#git} != 0 ]; then
        ((git=${#git} - 10))
    else
        git=0
    fi

    local termwidth
        (( termwidth = ${COLUMNS} - 3 - ${#HOST} - ${#$(get_pwd)} - ${git} ))

    local spacing=""
    for i in {1..$termwidth}; do
        spacing="${spacing} " 
    done
    echo $spacing
}

function precmd() {
    print -rP '
$fg[cyan]%m: $fg[yellow]$(get_pwd)$(git_prompt_info) $(parse_vm_state)'
}

PROMPT='%{$reset_color%}→ '

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

VM_PROMPT_PREFIX="$fg[blue][vm:"
VM_PROMPT_SUFFIX="]$reset_color"
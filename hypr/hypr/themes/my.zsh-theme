setopt prompt_subst

# Right-side prompt
function right_side_prompt() {
    local uptime_info=$(uptime | awk -F, '{print $1}' | awk '{print $3,$4}')
    # Magenta + cyan/red variations
    echo -n "%{$fg[magenta]%}[%{$fg[yellow]%}%{$fg[blue]%}  $uptime_info%{$fg[magenta]%}]"
}

function git_prompt_info_colored() {
    local git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $git_branch ]]; then
        local dirty=""
        git diff --quiet 2>/dev/null || dirty="*"
        # Only echo branch, let Git handle colors in `git status`
        echo -n " $git_branch$dirty "
    fi
}


PROMPT='%{$fg[magenta]%}λ \
%{$fg[brightred]%}[\
%{$fg[magenta]%}%n\
%{$fg[white]%}@\
%{$fg[magenta]%}%m\
%{$fg[magenta]%}] \
%{$fg[magenta]%}/ \
%{$fg[white]%}%c \
%{$fg[cyan]%}$(git_prompt_info_colored)$(hg_prompt_info)\
$(right_side_prompt)
%{$fg[cyan]%}> %{$reset_color%}'

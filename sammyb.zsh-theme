# Depends on the git plugin for work_in_progress()
(( $+functions[work_in_progress] )) || work_in_progress() {}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$FG[044]%}\uE0D4"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[044]%}\uE0D2%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[196]%}\u25CF%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local branch=$(git_current_branch)
  [[ -n "$branch" ]] || return 0
  echo "$(parse_git_dirty)\
%{${fg_bold[yellow]}%}$(work_in_progress)%{$reset_color%}\
${ZSH_THEME_GIT_PROMPT_PREFIX}%{$BG[044]$fg[black]%}\uE0A0${branch}%{$reset_color%}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# RVM component of prompt
ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RUBY_PROMPT_SUFFIX="]%{$reset_color%}"

# Combine it all into a final right-side prompt
RPS1="\$(git_custom_status)\$(ruby_prompt_info)${RPS1:+ $RPS1}"
PROMPT='%{$FG[141]%}[$(shrink_path -f)]%B%{$FG[112]%}❱%{$FG[045]%}❱%{$FG[009]%}❱%b'

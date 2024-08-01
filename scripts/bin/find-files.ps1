$selected = fzf --margin 10% --border=rounded --header-first --header "Open File" --border-label " Find Files "

if ($selected) { nvim $selected }

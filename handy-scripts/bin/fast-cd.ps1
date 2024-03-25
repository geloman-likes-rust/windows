$selected = fd --hidden --type d | fzf --margin 10% --border=rounded --header-first --border-label=" Change Directory " --header "Select Directory"
if ($selected) { Set-Location $selected }

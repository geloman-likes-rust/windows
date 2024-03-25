$workspace = git rev-parse --show-toplevel 2> $null 
if (-not $workspace) { exit 0 }

$selected = git ls-files $workspace --exclude-standard --cached --others | fzf --margin 10% --border=rounded --header-first --header " Open File " --border-label " Git Files "

if ($selected) { nvim $selected }

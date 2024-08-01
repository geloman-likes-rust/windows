param([string]$GitFile)

if ($GitFile) {
    git restore --stage $GitFile 
    exit 0
}

$workspace = git rev-parse --show-toplevel 2> $null 
if (-not $workspace) { exit 0 }

$staged_files = git diff --name-only --cached
if (-not $staged_files) { exit 0 }

$selected = $staged_files | fzf --margin 10% --border=rounded --header-first --header "Select File" --border-label " Git Unstage File "

if (-not $selected) { exit 0 }

if ((git rev-list --count --all) -eq 0) { git rm --cached "$workspace/$selected" > $null }
else { git restore --stage "$workspace/$selected" }

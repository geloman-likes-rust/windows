$workspace = git rev-parse --show-toplevel 2> $null 
if (-not $workspace) { exit 0 }

$dirty_files = git diff --name-only --diff-filter=M $workspace
$untracked_files = git ls-files $workspace --full-name --exclude-standard --others

if (-not $dirty_files -and -not $untracked_files) {
    Write-Output "no dirty files, working tree clean"
    exit 0 
}

$selected = Write-Output $dirty_files $untracked_files | fzf --margin 10% --header-first --border=rounded --header "Open File" --border-label " Dirty Files "
if ($selected) { nvim "$workspace/$selected" }

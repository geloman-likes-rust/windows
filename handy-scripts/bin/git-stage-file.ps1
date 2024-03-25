param([string]$GitFile)

$workspace = git rev-parse --show-toplevel 2> $null 
if (-not $workspace) { exit 0 }

if($GitFile) { 
    git add $GitFile
    exit 0 
}

$git_files = git ls-files (git rev-parse --show-toplevel) -m --exclude-standard --other 

if (-not $git_files) {
    Write-Output "working tree clean, nothing to stage" 
    exit 0
}

$selected = $git_files | fzf --margin 10% --border=rounded --header-first --header "Select File" --border-label " Git Stage File "

if ($selected) { git add $selected }

param([string]$Pattern)
if(-not $Pattern) { exit 0 }

$matching_files = rg --line-number --column --only-matching --hidden --glob="!.git" -- "$Pattern"
if (-not $matching_files) { exit 0 }

$selected = $matching_files | fzf -e --delimiter : --margin 10% --border=rounded --header-first  --header "Select File" --border-label " Live Grep " --preview-window right,60% --preview "bat --theme=1337 --color=always --highlight-line {2} {1}" --preview-window '~3,+{2}+3/2'
if (-not $selected) { exit 0 }

$chunks = $selected -split ":"

$file_name = $chunks[0]
$line_number = $chunks[1]
$column_number = $chunks[2]
$search_string = $chunks[3]

nvim +"$line_number" -c "normal zt${column_number}|" "+match Search /\%.l${search_string}/" "$file_name"

$Env:Path += ";$Env:USERPROFILE\dotfiles\scripts\bin"

Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name ff -Value find-files
Set-Alias -Name fcd -Value fast-cd
Set-Alias -Name vr -Value vim-recent
Set-Alias -Name drt -Value dirty-files
Set-Alias -Name gs -Value git-status
Set-Alias -Name gf -Value git-files
Set-Alias -Name ga -Value git-stage-file
Set-Alias -Name guf -Value git-unstage-file
Set-Alias -Name lg -Value live-grep

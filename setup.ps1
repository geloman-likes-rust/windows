Get-Content $Env:USERPROFILE\dotfiles\profile.ps1 > $PROFILE

if (Test-Path -Path $Env:USERPROFILE\.gitconfig) {
    Move-Item -Path $Env:USERPROFILE\.gitconfig -Destination $Env:USERPROFILE\.gitconfig.bak
}
New-Item -ItemType SymbolicLink -Path $Env:USERPROFILE\.gitconfig -Target $Env:USERPROFILE\dotfiles\.gitconfig 

if (Test-Path -Path $Env:LOCALAPPDATA\nvim) {
    Move-Item -Path $Env:LOCALAPPDATA\nvim -Destination $Env:LOCALAPPDATA\nvim.bak
}
New-Item -ItemType SymbolicLink -Path $Env:LOCALAPPDATA\nvim -Target $Env:USERPROFILE\dotfiles\nvim

winget install --accept-source-agreements --id=Neovim.Neovim --exact
winget install --accept-source-agreements chocolatey.chocolatey
choco install -y delta bat fzf ripgrep fd jq gawk wget unzip gzip mingw make

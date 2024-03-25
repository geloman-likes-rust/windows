Get-Content $HOME\dotfiles\profile.ps1 > $PROFILE

if (Test-Path -Path $HOME\.gitconfig) {
    Move-Item -Path $HOME\.gitconfig -Destination $HOME\.gitconfig.bak
}
New-Item -ItemType SymbolicLink -Path $HOME\.gitconfig -Target $HOME\dotfiles\.gitconfig 

if (Test-Path -Path $Env:LOCALAPPDATA\nvim) {
    Move-Item -Path $Env:LOCALAPPDATA\nvim -Destination $Env:LOCALAPPDATA\nvim.bak
}
New-Item -ItemType SymbolicLink -Path $Env:LOCALAPPDATA\nvim -Target $HOME\dotfiles\nvim 

winget install --accept-source-agreements --id=Neovim.Neovim --exact
winget install --accept-source-agreements chocolatey.chocolatey
choco install -y git delta bat fzf ripgrep fd jg wget unzip gzip mingw make

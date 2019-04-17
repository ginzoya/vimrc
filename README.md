# vimrc
Backup/source controlled version of my vimrc file for nvim

## Windows
Be sure to add this to nvim's init in `~\AppData\Local\nvim\init.vim` (source https://vi.stackexchange.com/a/13506):
```
set runtimepath+=~/vimfiles,~/vimfiles/after
set packpath+=~/vimfiles
source ~/_vimrc
```
I made a symlink to the _vimrc file in my local git repo so I don't accidentally lose any changes. `mklink` requires a cmd launched in admin mode:
```
cd %USERPROFILE%
mklink _vimrc path/to/_vimrc
```

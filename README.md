# vim-v
![Code sample]()
_colorscheme: (iceberg)[]_

**vim-v** aims to provides syntax highlighting and other niceties for the
[V programming language](https://vlang.io). Goals:
 * full syntax coverage
 * good syntactic folding
 * warnings for invalid C-like syntax

_vim-v is still a work in progress, and contributions are very much welcomed!_

## Installation

Use the plugin manager of your choice. For example, with
[vim-plug](https://github.com/junegunn/vim-plug):
```vim
" ~/.vimrc

call plug#begin('~/.vim/plugged')

" […]
Plug 'cheap-glitch/vim-v'
" […]

call plug#end()
```
Then reload your _vimrc_ and run `:PlugInstall`.

## Acknowledgements

The first version of the code was based on [v.vim](https://github.com/andreyrmg/v.vim)
by [andreyrmg](https://github.com/andreyrmg).

## License

This software is distributed under the ISC license.

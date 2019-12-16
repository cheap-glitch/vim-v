<div align="center">
	<h1>vim-v</h1>
	<img src="https://raw.githubusercontent.com/cheap-glitch/vim-v/master/docs/sample.png" alt="code sample">
	<p><em>colorscheme: <a href="https://github.com/cocopon/iceberg.vim">Iceberg</a>, font: Hack</em></p>
</div>

**vim-v**  aims  to   provides  syntax   highlighting   for   the
[V  programming language](https://vlang.io), plus a  few niceties
such as syntactic folding and warnings for invalid C-like syntax.

 > vim-v is still a work in progress, and contributions are very much welcomed!

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

The first version of the code was based on
[v.vim](https://github.com/andreyrmg/v.vim)
by [andreyrmg](https://github.com/andreyrmg).

## License

This software is distributed under the ISC license.

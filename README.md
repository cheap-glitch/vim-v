<div align="center"><h1>vim-v</h1></div>
<img src="https://raw.githubusercontent.com/cheap-glitch/vim-v/main/docs/screenshot.png" alt="code sample">
<p align="right"><em><sub>
	colorscheme: <a href="https://github.com/cocopon/iceberg.vim">Iceberg</a>
	&nbsp;|&nbsp;
	font: <a href="http://sourcefoundry.org/hack">Hack</a>
</sub></em></p>
<p>&nbsp;</p>

**vim-v**  aims  to   provides  syntax  highlighting  for   the
[V  programming  language](https://vlang.io),  plus   a  few  niceties  such  as
auto-indenting, syntactic folding and warnings for invalid C-like syntax.

## Installation

Use  the plugin  manager of  your  choice to  install _vim-v_. For example, with
[vim-plug](https://github.com/junegunn/vim-plug):

```vim
" ~/.vimrc

call plug#begin('~/.vim/plugged')

" [...]
Plug 'cheap-glitch/vim-v'

call plug#end()
```
Then reload your _vimrc_ and run `:PlugInstall`.

#### Conditional loading with vim-plug

If you use _vim-plug_, you can do something like this:
```vim
" This will only load the syntax plugin when a .v file is first opened
Plug 'cheap-glitch/vim-v', { 'for': 'v' }
```

#### Display warnings for invalid C-like syntax

The syntax of V is very similar to that of C and C-like languages, but there are
nonetheless  some significant  differences. To  help you  avoid using  invalid C
syntax out of  habit, you can activate the option  `v_warnings`. It will display
invalid constructs as errors:
```vim
let g:v_warnings=1
```

## Acknowledgements

The first version of the code was based on [v.vim](https://github.com/andreyrmg/v.vim)
by [andreyrmg](https://github.com/andreyrmg).

## License

This software is distributed under the ISC license.

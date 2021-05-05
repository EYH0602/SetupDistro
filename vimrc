
"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }


"=================="
" Language Plugins "
"=================="
Plug 'sudar/comments.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'neovimhaskell/haskell-vim'

"======================"
" colorschemes Plugins "
"======================"
Plug 'EYH0602/sonokai'
Plug 'Mizux/vim-colorschemes'
Plug 'miyakogi/slateblue.vim'
Plug 'joshdick/onedark.vim'
Plug 'arzg/vim-corvine'
Plug 'sickill/vim-monokai'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'mhartington/oceanic-next'

"============"
" UI Plugins "
"============"
Plug 'luochen1990/rainbow'
Plug 'miyakogi/conoline.vim'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
" autocomplete parathese
Plug 'tmsvg/pear-tree' 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

call plug#end()






""""""""""""""""""
" Plugin settins "
""""""""""""""""""

" *** Markdown *** "
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" *** LaTeX *** "
let g:tex_flavor = 'latex'
let g:vimtex_version_check = 0
" let g:livepreview_previewer = 'okular'

" *** Haskell *** "
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" *** UI - lightline ***"
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" *** colorscheme - sonokai *** "
let g:sonokai_style = 'default'    "shusia, andromeda, atlantis, maia
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:vim_monokai_tasty_italic = 1

" *** UI - rainbow *** "
"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 

" *** UI - pear tree *** "
" Default rules for matching:
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'}
            \ }
" See pear-tree/after/ftplugin/ for filetype-specific matching rules

" Pear Tree is enabled for all filetypes by default:
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1


""""""""""""""""
" vim settings "
""""""""""""""""

" to use backspace on mac
set backspace=indent,eol,start

"============="
" colorscheme "
"============="
syntax on
set termguicolors

" colorscheme desert
" colorscheme onedark
" colorscheme corvine
colorscheme sonokai
" colorscheme slateblue
" colorscheme pencil
" colorscheme vim-monokai-tasty
" colorscheme OeanicNext


"===="
" UI "
"===="

" set tabs and indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

set laststatus=2
set noshowmode
" set number line on the left
set number relativenumber
set nu rnu
set numberwidth=2
set cpoptions+=n
" keep 8 lines to top and bottum
set scrolloff=8

" set vertical split to right
set splitright

" set language
set spelllang=en_us

" font ligatures
set renderoptions=type:directx
set encoding=utf-8

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" mappings
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType go setlocal shiftwidth=4 softtabstop=4 expandtab


" resize vertical split window
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>)

" map space to : in normal mode and virtual mode
nmap <space> :
vmap <space> :


" cap this word in normal mode
nnoremap <C-S-U> m1gUiw`1
" cap the just finished word in insert mode
inoremap <C-S-U> <ESC>gUiwgi


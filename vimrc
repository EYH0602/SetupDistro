
"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'wakatime/vim-wakatime'

"=================="
" Language Plugins "
"=================="
Plug 'sudar/comments.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'neovimhaskell/haskell-vim'
" Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'

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
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
" autocomplete parathese
Plug 'tmsvg/pear-tree' 
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'preservim/nerdcommenter'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'PhilRunninger/nerdtree-visual-selection'

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

" *** C/C++ *** "
" Disable function highlighting (affects both C and C++ files)
let g:cpp_no_function_highlight = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1
"

" *** UI - lightline ***"
" powerline, wombat, jellybeans, onedark, seoul256, PaperColor_dark
let g:lightline = {
      \ 'colorscheme': 'PaperColor_dark',
			\ 'active': {
			\ 'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
			\   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
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
let g:sonokai_enable_italic = 0
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

" *** UI - indent line *** "
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" *** UI - Nerd Commenter *** "
filetype plugin on
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" *** UI - NERDtree *** "
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 
  \ && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>



""""""""""""""""
" vim settings "
""""""""""""""""
set cursorline

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
" colorscheme OceanicNext


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



" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" syntex

" function list
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" *** color scheme ***
Plug 'sainnhe/sonokai'
" important!!
set termguicolors

Plug 'joshdick/onedark.vim'

Plug 'arzg/vim-corvine'

" the configuration options should be placed before `colorscheme sonokai`
let g:sonokai_style = 'atlantis'    "shusia, andromeda, atlantis, maia
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2



" colorful ([{
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" LaTeX
Plug 'lervag/vimtex'
let g:tex_flavor = 'latex'
let g:vimtex_version_check = 0

" LaTeX live preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" HTML
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" autocomplete parathese
Plug 'tmsvg/pear-tree'
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


Plug 'miyakogi/conoline.vim'

Plug 'wakatime/vim-wakatime'


" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)
" Pear Tree also makes <Plug> mappings for each opening and closing string.
"     :help <Plug>(PearTreeOpener)
"     :help <Plug>(PearTreeCloser)

" Not mapped by default:
" <Plug>(PearTreeSpace)
" <Plug>(PearTreeJump)
" <Plug>(PearTreeExpandOne)
" <Plug>(PearTreeJNR)
" local plugin
Plug 'itchyny/lightline.vim'
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
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
" Initialize plugin system
call plug#end()


" set tabs and indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

command! -nargs=0 Livepdf LLPStartPreview

" copy to system clipboard
" The reason for the double-command on <C-c> is due to some weirdness with the X clipboard system.
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" color sheme
syntax on
" colorscheme onedark
set termguicolors
colorscheme corvine


" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" set number line on the left
set number relativenumber
set nu rnu
set numberwidth=2
set cpoptions+=n

" set vertical split to right
set splitright

" set language
set spelllang=en_us

" to format file
" sudo apt install astyl
" :%!astyle

" comment out multiple lines & uncomment
map <S-c> :s/^/\/\//<Enter>
map <S-u> :s/^\/\///<Enter>


" keep 8 lines to top and bottum
set scrolloff=8
 
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" auto complete ([{
" function! ConditionalPairMap(open, close)
"   let line = getline('.')
"   let col = col('.')
"   if col < col('$') || stridx(line, a:close, col + 1) != -1
"     return a:open
"   else
"     return a:open . a:close . repeat("\<left>", len(a:close))
"   endif 
" endfunction
" inoremap <expr> ( ConditionalPairMap('(', ')')
" inoremap <expr> { ConditionalPairMap('{', '}')
" inoremap <expr> [ ConditionalPairMap('[', ']')

" auto complete ([{
" inoremap        (  ()<Left>
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"


" highlight current line
" set cursorline
" hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" highlight CursorLine guibg=#303000 ctermbg=234

" LaTeX
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on

" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
" set shellslash

" " OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'

" resize vertical split window
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>)

" map space to : in normal mode and virtual mode
nmap <space> :
vmap <space> :

" font ligatures
set renderoptions=type:directx
set encoding=utf-8


" cap this word in normal mode
nnoremap <C-S-U> m1gUiw`1
" cap the just finished word in insert mode
inoremap <C-S-U> <ESC>gUiwgi

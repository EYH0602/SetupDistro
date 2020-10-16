
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

" color scheme
" Plug 'sainnhe/sonokai'
" important!!
" set termguicolors

" the configuration options should be placed before `colorscheme sonokai`
let g:sonokai_style = 'atlantis'    "shusia, andromeda, atlantis, maia
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'

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

" local plugin
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" Initialize plugin system
call plug#end()


" set tabs and indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" copy to system clipboard
set clipboard=unnamedplus

" colorscheme sonokai

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

" use system clipboard

" keep 8 lines to top and bottum
set scrolloff=8
 
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" auto complete ([{
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif 
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')

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

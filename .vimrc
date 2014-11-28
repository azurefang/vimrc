set history=2000

filetype on
filetype indent on "允许插件
filetype plugin on
filetype plugin indent on

set nocompatible
set autoread " 文件修改之后自动载入。
set shortmess=atI " 启动的时候不显示那个援助索马里儿童的提示
set nobackup
set noswapfile

set cursorline " 突出显示当前行
set t_ti= t_te=

set mouse=a " 鼠标暂不启用
set selection=exclusive
set selectmode=mouse,key

set title " change the terminal's title
set novisualbell " don't beep
set noerrorbells " don't beep
set t_vb=
set tm=500

set number
"set nowrap " 取消换行。

set showmatch
set mat=2

set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual 手工折叠
" indent 使用缩进表示折叠
" expr 使用表达式定义折叠
" syntax 使用语法定义折叠
" diff 对没有更改的文本进行折叠
" marker 使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

set smartindent
set autoindent " always set autoindenting on

set tabstop=4 " 设置Tab键的宽度 [等同的空格个数]
set shiftwidth=4 " number of spaces to use for autoindenting
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]

set shiftround " use multiple of shiftwidth when indenting with '<' and '>'

set showcmd
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast
set relativenumber
au FocusLost * :set number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"create undo file
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo
if v:version >= 730
    set undofile " keep a persistent backup file
    set undodir=~/bak/vimundo/
endif

set wildignore=*.swp,*.bak,*.pyc,*.class

set ruler
set showcmd
set showmode
set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2

set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set termencoding=utf-8

set ffs=unix,dos,mac
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。

set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

set magic

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"hot key 自定义快捷键
let mapleader = ','
let g:mapleader = ','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H 0
noremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"set paste
set pastetoggle=<F5> " when in insert mode, press <F2> to go to
" paste mode, where you can paste mass data
" that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

map <space> /
"map <c-space> ?"

map Y y$
"cmap w!! %!sudo tee > /dev/null %
" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %
noremap <silent><leader>/ :nohls<CR>

inoremap kj <Esc>
" I can type :help on my own, thanks.
noremap <F1> <Esc>"

nnoremap ; :

nnoremap <leader>v V`}

"Use sane regexes"
nnoremap / /\v
vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" change buffer"
noremap <left> :bp<CR>
noremap <right> :bn<CR>
""Jump to start and end of line using the home row keys
nmap t o<ESC>k
nmap T O<ESC>j
" Quickly close the current window
nnoremap <leader>q :q<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
"nnoremap <silent> <leader>d "_d
"vnoremap <silent> <leader>d "_d

" remap U to <C-r> for easier redo
nnoremap U <C-r>

"au VimResized * exe "normal! \<c-w>=""

" select all
map <Leader>sa ggVG"

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" tabnext tabpreviouse

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"========================== config for plugins begin ======================================

filetype off " required! turn off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1

" 默认方向键左右可以切换buffer
nnoremap <TAB> :MBEbn<CR>
noremap <leader>bn :MBEbn<CR>
noremap <leader>bp :MBEbp<CR>
noremap <leader>bd :MBEbd<CR>

Plugin 'majutsushi/tagbar'
let g:tagbar_autofocus = 1
let g:tagbar_left = 1

Plugin 'vim-scripts/taglist.vim'
set tags=tags;/
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 50

"for file search ctrlp, 文件搜索
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown', 'RoyalBlue3'],
    \ ['Darkblue', 'SeaGreen3'],
    \ ['darkgray', 'DarkOrchid3'],
    \ ['darkgreen', 'firebrick3'],
    \ ['darkcyan', 'RoyalBlue3'],
    \ ['darkred', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown', 'firebrick3'],
    \ ['gray', 'RoyalBlue3'],
    \ ['black', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue', 'firebrick3'],
    \ ['darkgreen', 'RoyalBlue3'],
    \ ['darkcyan', 'SeaGreen3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['red', 'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

Plugin 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'

Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

Plugin 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

Plugin 'Valloric/MatchTagAlways'
"更高效的移动 ,, + w/fx
Plugin 'Lokaltog/vim-easymotion'

Plugin 'vim-scripts/matchit.zip'

Plugin 'Valloric/YouCompleteMe'
"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips"]

Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command
Plugin 'tpope/vim-repeat'

Plugin 'Raimondi/delimitMate'
au FileType python let b:delimitMate_nesting_quotes = ['"']

"for code alignment
Plugin 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"for visual selection
Plugin 'terryma/vim-expand-region'
map = <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

"for mutil cursor
Plugin 'terryma/vim-multiple-cursors'
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plugin 'osyo-manga/vim-over'

Plugin 'matze/vim-move'
let g:move_key_modifier = 'C'

Plugin 'rhysd/clever-f.vim'

Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_ignore_files = ['\.py$']
highlight SyntasticErrorSign guifg=white guibg=black

Plugin 'klen/python-mode'
let g:pymode_rope=0
let g:pymode_warnings = 1
let g:pymode_lint_on_fly = 1
let g:pymode_options_max_line_length = 100
let g:pymode_lint_signs = 1
let g:pymode_lint_cwindow = 0

Plugin 'fatih/vim-go'
let g:go_bin_path = "/Users/azurefang/.vim-go"

Plugin 'elixir-lang/vim-elixir'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

Plugin 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

Plugin 'Glench/Vim-Jinja2-Syntax'

" task list
Plugin 'vim-scripts/TaskList.vim'
map <leader>td <Plug>TaskList

Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'

"edit history, 可以查看回到某个历史状态
Plugin 'sjl/gundo.vim'
nnoremap <leader>h :GundoToggle<CR>

filetype plugin indent on

Plugin 'rizzatti/dash.vim'

"========================== config for plugins end ======================================

syntax enable
syntax on

if has("gui_running")
    "set gfn=Yahei\ Monaco\ 10
    set gfn=Fantasque\ Sans\ Mono:h15
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

colorscheme solarized
set background=light
set t_Co=256

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" settings for kien/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"F1 隐藏/显示菜单栏
set guioptions-=m
set guioptions-=T
map <silent> <F1> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

call togglebg#map("<F2>")
nmap <F3> :GundoToggle<cr>
nmap <F4> :TaskList<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F7> :TagbarToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

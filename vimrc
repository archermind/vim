" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

"---------------------------------------------------------------
"                                                              
"all of this below are add by Alan Wang for the purpose of learn
"how to use vim in right way                                   
"                                                              
"---------------------------------------------------------------

"show line numbers
set number

"is has mouse set mouse=a
if has('mouse')
    set mouse=a
endif

"set mapleader
let mapleader = ","
"Fast reloading of the .vimrc
noremap <silent> <leader>ss :source $MYVIMRC<cr>
"Fast editing of .vimrc
noremap <silent> <leader>ee :vsplit $MYVIMRC<cr>
"when .vimrc is edited, reload it
augroup AUTO_SOURCE
    au!
    autocmd! bufwritepost .vimrc source ~/.vimrc
augroup END

"--------------------------------------------------------------
"Tag list (ctags)
"--------------------------------------------------------------
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"--------------------------------------------------------------
"if want to make the tag list window 
"appears on the right hand use code blow
"--------------------------------------------------------------

"use hotkey F2 ctrl the Tlist
noremap <silent> <F2> :TlistToggle<cr>

"--------------------------------------------------------------
"netrw setting
"--------------------------------------------------------------
let g:newrw_winsize = 30
nnoremap <silent> <leader>fe :Sexplore!<cr>

"--------------------------------------------------------------
"BufExplorer
"--------------------------------------------------------------
let g:bufExplorerDefaultHelp=0  "Don't show default help
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize=30
let g:bufExplorerUseCurrentWindow=1
"autocmd BufWinEnter \[Buf\ List\] set1 nonumber

"--------------------------------------------------------------
"winManager setting
"--------------------------------------------------------------
let g:winManagerWindowLayout="NERDTree|TagList"
let g:NERDTree_title="[NERD Tree]"

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nnoremap <C-W><C-F> :FileExplorerWindow<CR>
nnoremap <C-W><C-B> :BottomExplorerWindow<CR>
nnoremap <silent> <leader>wm :<c-u>if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>

"--------------------------------------------------------------
"map Q to :qa!
"--------------------------------------------------------------
command! -bar -bang Q qa<bang>

"--------------------------------------------------------------
"map keys for fuzzyfinder plugin
"--------------------------------------------------------------
nnoremap <silent> <leader>fcf :FufCoverageFile<CR>
nnoremap <silent> <leader>f   :FufFile<CR>
nnoremap <silent> <leader>t   :FufTag<CR>

"--------------------------------------------------------------
"set tabstop=4
"--------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab

"--------------------------------------------------------------
"colorschema
"--------------------------------------------------------------
colorscheme desert

"--------------------------------------------------------------
"cscope setting
"--------------------------------------------------------------
set cscopequickfix=s-,c-,d-,i-,t-,e-

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
        let cscope_file=findfile("cscope.out", ".;")
        let cscope_pre=matchstr(cscope_file, ".*/")
        if !empty(cscope_file) && filereadable(cscope_file)
            exe "cs add" cscope_file cscope_pre
        endif      
     endif
endif

nnoremap <F8> :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"--------------------------------------------------------------
"some settings for QuickFix window
"--------------------------------------------------------------
"switch to next item
nmap<F6> :cn<CR>  
"switch to previous item
nmap<F7> :cp<CR>
"close quickfix window
nmap <silent> <leader>cl :ccl<CR>

"--------------------------------------------------------------
"syntax on
"--------------------------------------------------------------
if has("syntax")
    syntax on
endif

"--------------------------------------------------------------
"map ,nl to :nohl 
"--------------------------------------------------------------
nnoremap <silent> <leader>nl :nohl<CR>

"--------------------------------------------------------------
"set cursorline
"--------------------------------------------------------------
set cursorline

"--------------------------------------------------------------
"update more frequently
"--------------------------------------------------------------
set updatetime=100

"--------------------------------------------------------------
"set no wap file creation
"--------------------------------------------------------------
set noswapfile

"--------------------------------------------------------------
"Font setting to Monaco
"--------------------------------------------------------------
set guifont=Monaco\ 12

"--------------------------------------------------------------
"80 column layout concerns
"--------------------------------------------------------------
highlight ColorColumn guibg=yellow
set colorcolumn=80

"--------------------------------------------------------------
"Study zone
"--------------------------------------------------------------
"ABBREVIATIONS
iabbrev ssig Alan Wang<CR>alan_t@foxmail.com<ESC>kk<CR>ko

"No more arrow key again
map <Up>    <nop>
map <Down>  <nop>
map <Right> <nop>
map <Left>  <nop>

"set statusline=%f\ -\ FileType:\ %y


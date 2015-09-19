" Initialization {{{

" Setup directories
let s:vimdir     = $HOME . '/.vim'
let &backupdir   = s:vimdir . '/backup'     " backup files
let &undodir     = s:vimdir . '/undo'       " undo files

" Create the directories if they are not available
if !isdirectory(s:vimdir)
  call mkdir(s:vimdir, 'p')
endif

if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif

if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps with
Plug 'tpope/vim-speeddating' " Supporting dates
Plug 'tpope/vim-eunuch' " Helpers for UNIX
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'tpope/vim-rsi' " Readline style insertion
Plug 'talek/obvious-resize' " Resizing Vim windows
Plug 'terryma/vim-multiple-cursors' " Multiple cursors
Plug 'junegunn/vim-peekaboo' " Allows to see the contents of the registers.
Plug 'ConradIrwin/vim-bracketed-paste' " Handles bracketed-paste-mode
Plug 'vim-scripts/visualrepeat' " Repeat command extended to visual mode
Plug 'matchit.zip' " Extends the use of %
Plug 'matze/vim-move' " Moving/swapping lines
Plug 'wesQ3/vim-windowswap' " Swap windows/splits
Plug 'terryma/vim-expand-region' " Enchanted visual selection
Plug 'chrisbra/NrrwRgn' " Narrow Region
Plug 'drmikehenry/vim-fixkey' " non-ASCII keys of a terminal emulator
Plug 'dockyard/vim-easydir' " simple way to create, edit and save files and parent directories
Plug 'godlygeek/tabular' " Text filtering and alignment
Plug 'luochen1990/indent-detector.vim' " indent detect
Plug 'powerman/vim-plugin-viewdoc' " Flexible viewer for any documentation

" Workflow
Plug 'szw/vim-ctrlspace' " Vim Workspace Controller
Plug 'dyng/ctrlsf.vim' " ack/ag powered code search and view tool
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } " command-line fuzzy finder written
Plug 'justinmk/vim-gtfo' " Go to Terminal or File manager

" Search & Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " A tree explorer plugin for vim
Plug 'justinmk/vim-sneak' " Additional motions
Plug 'rking/ag.vim' " Search utility
Plug 'junegunn/vim-oblique' " Improved /-search

" UI
Plug 'bling/vim-airline' " Status line
Plug 'junegunn/rainbow_parentheses.vim', { 'on': 'RainbowParentheses' } " Rainbow parentheses
Plug 'Valloric/MatchTagAlways' " Highlighting the enclosing html/xml tags
Plug 'itchyny/vim-highlighturl' " URL highlight everywhere
Plug 'Yggdroot/indentLine' " Display the indention levels
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' } " :substitute preview
Plug 'KabbAmine/vCoolor.vim' " Color selector/picker
Plug 'ryanoasis/vim-webdevicons' " filetype font icons (glyphs) to vim for NERDTree and vim-airline plugins

" Coding helpers
Plug 'ludovicchabant/vim-gutentags' " Automated tag file generation
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 ./install.py' } " Auto completion framework
Plug 'SirVer/ultisnips' " Snippet engine
Plug 'honza/vim-snippets' " Snippets
Plug 'Raimondi/delimitMate' " Automatic closing of quotes
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'majutsushi/tagbar' " It displays tags in a window
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } " Undo tree
Plug 'tomtom/tcomment_vim' " Provides file-type sensible comments for Vim
Plug 'AndrewRadev/sideways.vim' " Move function arguments
Plug 'AndrewRadev/splitjoin.vim' " Simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/inline_edit.vim' " Edit code that's embedded within other code
Plug 'thinca/vim-quickrun' " Execute whole/part of editing file.
Plug 'Chiel92/vim-autoformat' " Code formatting by integrating existing code formatters
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " Alignment plugin


" Color themes
Plug 'morhetz/gruvbox' " Colorscheme gruvbox
Plug 'chriskempson/base16-vim' " Colorscheme Base 16

" Git support
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'gregsexton/gitv' " An extension of the 'fugitive' Plug .
Plug 'airblade/vim-gitgutter' " Git diff sign
" Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status

" Tmux support
Plug 'tmux-plugins/vim-tmux-focus-events' " Enables FocusGained and FocusLost
Plug 'wellle/tmux-complete.vim' " Completion of words in adjacent tmux panes
Plug 'christoomey/vim-tmux-navigator' " Navigation between tmux panes and vim splits
Plug 'edkolev/tmuxline.vim' " tmux statusline generator with airline integration
Plug 'tmux-plugins/vim-tmux' " Syntax highlighting for tmux.conf

" Perl support
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' } " Perl
Plug 'c9s/perlomni.vim' " perl omnicompletion
Plug 'c9s/cpan.vim' " Integration with CPAN


" Text objects
Plug 'kana/vim-textobj-entire' " (ae, ie) Text objects for entire buffer
Plug 'kana/vim-textobj-line' " (al, il) Text objects for current line
Plug 'kana/vim-textobj-indent' " (ai, ii, aI, iI) Text objects for indented blocks of lines
Plug 'glts/vim-textobj-comment' " (ac, ic, aC) Text objects for comments
Plug 'kana/vim-textobj-function' " (af, if) Text objects for functions (C, Java, VimL)
Plug 'thinca/vim-textobj-function-javascript' " Extends textobj-function
Plug 'thinca/vim-textobj-function-perl' " Extends textobj-function
Plug 'lucapette/vim-textobj-underscore' " (a_, i_) Underscore text-object
Plug 'whatyouhide/vim-textobj-xmlattr' " (ax, ix) Text object for XML/HTML attributes
Plug 'jceb/vim-textobj-uri' " (au, iu) Text objects for dealing with URIs
Plug 'saaguero/vim-textobj-pastedtext' " (*gb) Text object for last pasted text
Plug 'junegunn/vim-after-object' " Targeat text *after* the designated characters
Plug 'wellle/targets.vim' " Provides additional text objects and expands existing

" Utilities and dependencies
Plug 'kana/vim-textobj-user' " Create custom text objects
Plug 'tek/vim-fieldtrip' " simple sideways submode
Plug 'kana/vim-submode' " Allows to create custom submodes
Plug 'junegunn/vim-pseudocl' " Pseudo-command-line (dependensy for oblique)

" File types
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim

call plug#end()

" }}}

" General {{{

" Set UTF-8 everywhere
set encoding=utf-8
set termencoding=utf-8
set fileformats=unix,dos,mac "This gives the end-of-line (<EOL>)

" small tweaks
set ttyfast " indicate a fast terminal connection
set tf " improve redrawing for newer computers
set lazyredraw " turn on lazy redraw
" set shell=/bin/sh
set synmaxcol=500 " Do not highlight long lines
set viminfo+=! " Use viminfo file

" Lower the delay of escaping out of other modes
set timeoutlen=500

set noshelltemp "use pipes
set autowriteall " Set to auto write file
set autoread " Set autoread when a file is changed outside
set hidden " Allows making buffers hidden even with unsaved changes

set history=1000 " Increase the lines of history

" Set path
set path+=/usr/lib/gcc/**/include
set path+=** " Also search CWD

if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vii sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

set iskeyword+=_,$,@,%,# " None of these should be word dividers

set backspace=indent,eol,start " Make backspaces delete sensibly
set whichwrap+=h,l,<,>,[,] " Backspace and cursor keys wrap to
set virtualedit=block,onemore " Allow for cursor beyond last character
set scrolljump=3 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set title " Set title
set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)
set modeline " Enable modeline

set showfulltag

set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

"}}}

" UI {{{
syntax on " Enable syntax

set background=dark " Enable for dark terminals

colorscheme gruvbox " Set color scheme

set t_Co=256 " Use 256 colors


" This changes cursor shape in different Vim modes
let &t_SI .= "\<Esc>[5 q"
let &t_EI .= "\<Esc>[0 q"
let &t_SR .= "\<Esc>[3 q"

set display+=lastline " As much as possible of the last line in a window will be displayed
set laststatus=2 " Show the statusline
set noshowmode " Hide the default mode text
set ruler " Show cursor position in status bar
set number " Show numbers
set relativenumber " Show relative line numbers
set cursorline " Highlights the current line
set colorcolumn=+1 " this makes the color after the textwidth column highlighted

set completeopt=menu,menuone,longest " Auto complete options
set wildmenu " Completion in vim command mode
set wildmode=longest,full " Set 'wildmode' behaviour
set wildignore=.svn,CVS,.git,.hg,*.o
set wildignore+=*.a,*.class,*.mo,*.la
set wildignore+=*.so,*.obj,*.swp,*.jpg
set wildignore+=*.png,*.xpm,*.gif,.DS_Store
set wildignore+=*.aux,*.out,*.toc,tmp
set wildignore+=*.scssc,*.pyc,.tags

set showcmd " show typed command in status bar
set shortmess=atIc " Avoids hit enter

set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set showbreak=↪

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red term=bold
hi clear SpellCap
hi SpellCap cterm=underline ctermfg=blue
hi clear SpellLocal
hi SpellLocal cterm=underline ctermfg=blue
hi clear SpellRare
hi SpellRare cterm=underline ctermfg=blue

"}}}

" Folding {{{
set nofoldenable " don't fold by default
set foldmethod=marker " fold via syntax of files
set foldlevel=0 " fold everything if 'foldenable' is set
set foldnestmax=10 " maximum fold depth
let g:xml_syntax_folding=1 " enable xml folding

"}}}

" Indentation & Spaces & Tabs & Formatting {{{
set autoindent " Preserve current indent on new lines
set copyindent " copy the previous indentation on autoindenting
set cindent " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4 " see :h cinoptions-values
set breakindent " Wrapped lines will be visually indented
set expandtab " Convert all tabs typed to spaces
set smarttab " smart tab handling for indenting
set softtabstop=2 " number of spaces used with tab/bs
set shiftwidth=2 " indent with two spaces
set shiftround " Indent/outdent to nearest tabstop
set formatoptions=croqnj " Optimize format options
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set nowrap " Disable word wrapping
set textwidth=80 " Set text width

"}}}

" Searching {{{
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set nohlsearch " do not highlight searched-for phrases
set incsearch " ...but do highlight-as-I-type the search string
set gdefault " this makes search/replace global by default

if executable('ag') " Use Silver Searcher instead of grep
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

"}}}

" Backups {{{
set backup " Enable backups
set noswapfile " Disable swap files
set undofile " Set undo
set undolevels=1000 " Use many levels of undo

"}}}


" Key mappings {{{

" Set leader
let mapleader = " "

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_us<cr>

" spelling shortcuts using <leader>
" ]s next misspelled word
" [s previous misspelled word
" zg add to dict
" z= get suggestions
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>su z=

" Y to work from the cursor to the end of line
nnoremap Y y$

" Save
nnoremap <Leader>w :w<cr>

" map ; to :
nnoremap ; :
vnoremap ; :

" Make gt jump on tags
noremap gt <C-]>

"}}}

" Abbreviations {{{

" #!! | Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

"}}}

" Autocommands {{{

" We reset the vimrc augroup. Autocommands are added to this group throughout the file
augroup vimrc
  autocmd!

  " Only show trailing whitespace when not in insert mode
  autocmd vimrc InsertEnter * :set listchars-=trail:•
  autocmd vimrc InsertLeave * :set listchars+=trail:•

  " Turn on omni completion for file types which don't explisit support
  autocmd vimrc Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif

  " Auto reload vim after your cahange it
  autocmd vimrc BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

  " Automatically delete trailing DOS-returns and whitespace on file open and
  " write.
  autocmd vimrc BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//

  " Only show cursorline in the current window and in normal mode.
  autocmd vimrc WinLeave * set nocursorline
  autocmd vimrc WinEnter * set cursorline
  autocmd vimrc InsertEnter * set nocursorline
  autocmd vimrc InsertLeave * set cursorline

  " Remove trailing whitespaces when saving
  autocmd vimrc BufWritePre * :%s/\s\+$//e

  " Close vim if the only window left open is a NERDTree
  autocmd vimrc BufEnter *
        \ if (winnr("$") == 1 && exists("b:NERDTreeType") &&
        \ b:NERDTreeType == "primary") | q |
        \ endif

  " Active Rainbow Parentheses on Lisp file types
  autocmd FileType lisp,clojure,scheme RainbowParentheses

augroup END

"}}}

" Functions {{{

" When editing a file, always jump to the last known cursor position.
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction
autocmd BufReadPost * call SetCursorPosition()

" Combine multiple and vim-swoop, to make it compatible (no context move while
" multiple cursor)
function! Multiple_cursors_before()
  if exists('*SwoopFreezeContext') != 0
    call SwoopFreezeContext()
  endif
endfunction

function! Multiple_cursors_after()
  if exists('*SwoopUnFreezeContext') != 0
    call SwoopUnFreezeContext()
  endif
endfunction

" FZF function:
" Search lines in all open vim buffers
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf ' . keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '40%'
\})

" Jump to tags
command! FZFTag if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ }) | else | echo 'No tags' | endif

" MRU search
command! FZFMru call fzf#run({
            \'source': v:oldfiles,
            \'sink' : 'e ',
            \'options' : '-m',
            \'down':    15
            \})

"}}}

" Plugin settings {{{

" ==> Undotree
let g:undotree_SetFocusWhenToggle=1
nnoremap <F4> :UndotreeToggle<CR>

" ==> NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = [
      \ '.DS_Store', '\.swp$', '\~$', '.empty',
      \ '\.jpg$', '\.jpeg$', '\.png$', '\.gif$', '\.pdf$',
      \ '\.class$',
      \ '\.a$', '\.o$', '\.so$',
      \ '\.pyc$', '\.pyo$',
      \ '\.tags$'
      \ ]

function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'blue', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none')
call NERDTreeHighlightFile('yml', 'blue', 'none')
call NERDTreeHighlightFile('json', 'cyan', 'none')
call NERDTreeHighlightFile('html', 'red', 'none')
call NERDTreeHighlightFile('styl', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'blue', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none')
call NERDTreeHighlightFile('js', '142', 'none')
call NERDTreeHighlightFile('php', 'blue', 'none')
call NERDTreeHighlightFile('py', '142', 'none')
call NERDTreeHighlightFile('rb', 'red', 'none')
call NERDTreeHighlightFile('vim', '108', 'none')


" ==> TComment
let g:tcommentTextObjectInlineComment = ''


" ==> CtrlSpace
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1

hi CtrlSpaceSelected ctermfg=NONE   ctermbg=239     cterm=NONE
hi CtrlSpaceNormal   ctermfg=245    ctermbg=NONE    cterm=NONE
hi CtrlSpaceSearch   ctermfg=142    ctermbg=NONE     cterm=NONE
hi CtrlSpaceStatus   ctermfg=108    ctermbg=237      cterm=bold


" ==> Tagbar
nnoremap <F3> :TagbarToggle<CR>
let g:tagbar_sort = 0


" ==> Syntastic
let g:syntastic_id_checkers = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '♫'
let g:syntastic_style_error_symbol = '♪'
highlight link SyntasticStyleErrorSign Todo

let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_perl_checkers = ['perl', 'perlcritic']
let g:syntastic_enable_perl_checker = 1

let g:syntastic_filetype_map = {
      \ 'ansible': 'yaml',
      \ 'jinja': 'html',
      \ 'liquid': 'html',
      \ 'stylus': 'css',
      \ 'scss': 'css',
      \ 'less': 'css'
      \ }


" ==> YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1 " Suggest completion in comments
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_cache_omnifunc = 0
let g:ycm_filetype_specific_completion_to_disable = {
      \   'gitcommit': 1,
      \ }
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'help': 1
      \}


" ==> UltiSnips
" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsListSnippets = "<c-l>"
let g:UltiSnipsEditSplit='vsplit'


" ==> Airline
let g:airline#extensions#tabline#enabled = 1 " Enable tabline
let g:airline#extensions#tmuxline#enabled = 1 " Enable Tmuxline
let g:airline_powerline_fonts = 1 " Enable powerline fonts
let g:airline_theme = 'tomorrow' " Set Airline theme
let g:airline_exclude_preview = 1 " Additional support for CtrlSpace
let g:airline#extensions#tabline#fnamemod = ':t' " Display only file name
let g:airline#extensions#tabline#show_close_button = 0 " No show close button


" ==> indentLine
let g:indentLine_char = '¦'


" ==> delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
autocmd vimrc FileType vim,html,xml let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
autocmd vimrc FileType c let b:delimitMate_eol_marker = ";"
autocmd vimrc FileType python let b:delimitMate_expand_inside_quotes = 1
autocmd vimrc FileType python let b:delimitMate_nesting_quotes = ['"']


" ==> EasyAlign
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)


" ==> Over
noremap <Leader>s :OverCommandLine<CR>


" ==> Obvious Resize
noremap <silent> <M-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <M-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <M-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <M-Right> :<C-U>ObviousResizeRight<CR>


" ==> CtrlSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
imap     <C-F>t <Esc>:CtrlSFToggle<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
nnoremap <C-F>o :CtrlSFOpen<CR>

let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }


" ==> highlighturl
let g:highlighturl_ctermfg=109


" ==> Sideways
let g:fieldtrip_start_map ='<Leader>sw'
let g:submode_always_show_submode = 1
let g:submode_timeout = 5000
let g:submode_timeoutlen = 5000


" ==> SplitJoin
let g:splitjoin_align = 1

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

nmap <Leader>k :SplitjoinJoin<cr>
nmap <Leader>j :SplitjoinSplit<cr>


" ==> Inline edit
nnoremap <Leader>e :InlineEdit<cr>
xnoremap <Leader>e :InlineEdit<cr>
" inoremap <C-E> <esc>:InlineEdit<cr>a

let g:inline_edit_autowrite  = 1
let g:inline_edit_proxy_type = 'tempfile'
let g:inline_edit_patterns   = [
      \   {
      \     'main_filetype':     '*html',
      \     'sub_filetype':      'handlebars',
      \     'indent_adjustment': 1,
      \     'start':             '<script\>[^>]*type="text/template"[^>]*>',
      \     'end':               '</script>',
      \   }
      \ ]


" ==> Autoformat
noremap <F5> :Autoformat<CR><CR>


" ==> after-object
autocmd VimEnter * call after_object#enable('=', '-', ':', '#', '|', ' ')


" ==> Sneak
let g:sneak#s_next = 1 " use clever-s repeat behavior
let g:sneak#streak = 1 " Use streak mode
let g:sneak#use_ic_scs = 1 " Case sensitivity is determined by 'ignorecase' and 'smartcase'

hi SneakPluginTarget ctermfg=red ctermbg=NONE cterm=bold,underline
hi SneakStreakTarget ctermfg=red ctermbg=NONE cterm=bold,underline
hi SneakStreakMask ctermfg=white ctermbg=NONE cterm=NONE

nmap <CR>   <Plug>SneakNext
xmap <CR>   <Plug>SneakNext
nmap <BS>   <Plug>SneakPrevious
xmap <BS>   <Plug>SneakPrevious

" replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" omap f <Plug>Sneak_f
" omap F <Plug>Sneak_F

" replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" omap t <Plug>Sneak_t
" omap T <Plug>Sneak_T


" ==> Tmux-complete
let g:tmuxcomplete#trigger = 'omnifunc'


" ==> Tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W', '#F'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : ['#(tmux-mem-cpu-load -g 0)'],
      \'y'    : '#(date)',
      \'z'    : '#H',
      \'options'    : {'status-justify' : 'left'}
      \}


" ==> FZF
" Choose color scheme
nnoremap <silent> <Leader>c :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'right':    30
\ })<CR>

" MRU search
nnoremap <silent> <Leader>m : FZFMru<cr>

" Jump to tags
nnoremap <silent> <Leader>t : FZFTag<cr>

" Search lines in all open vim buffers
nnoremap <silent> <Leader>f : FZFLines<cr>

" ==> Quickrun
let g:quickrun_config = {}
let g:quickrun_config.perl = {
        \ 'runner': 'shell'
        \ }

" Autoformat
let g:formatdef_perl = '"perltidy -q"'
let g:formatters_perl = ['perl']

"}}}

" File type settings {{{
augroup filetype_settings
  autocmd!

  " Perl
  autocmd FileType perl
        \   setl softtabstop=4
        \ | setl shiftwidth=4
        \ | setl smarttab

augroup END

"}}}


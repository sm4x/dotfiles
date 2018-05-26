" ~/.vimrc

set nocompatible             " no vi compatibility 
set encoding=utf-8           " Set the default file encoding to UTF-8:
scriptencoding utf-8 
set noautochdir              " Stay in current Directory while editing

" The ":syntax enable" command will keep your current color settings.  This allows using ":highlight" commands to set your preferred colors before or after using this command.  If you want Vim to overrule your settings with the defaults, use: ":syntax on"
syntax enable
set number                   " Line Numbering
set mouse=a                  " mouse operation w/o copying line numbers

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS:
colorscheme desert           " nice one 

" Statusline:
set laststatus=2             " 2 always show status bar, 1 default, 0 off 
set statusline=%F%m%r%h%w%=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ENC=%{&fileencoding?&fileencoding:&encoding}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] " %.20F%m%r%h%w limit path lenth to 20
hi StatusLine ctermbg=None ctermfg=Cyan cterm=bold 

" Cursorline:
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white  " very prominent
hi CursorLine term=bold cterm=bold

"Tab Bar:
hi TabLineFill ctermfg=None cterm=bold ctermbg=None " Bar Color
hi TabLine ctermfg=Blue ctermbg=None                " Inactive fields
hi TabLineSel ctermfg=Cyan ctermbg=None             " Active Field

set showcmd              " show input in lower right corner
set title                " Set xterm-titlebar
set splitbelow           " new windows below
set splitright           " new windows right

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FINDING FILES:
filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
" use https://github.com/universal-ctags/ctags

command! MakeTags !ctags -R .

" consider the repo tags first, then
" walk directory tree upto $HOME looking for tags
" note `;` sets the stop folder. :h file-search
set tags=tags,./tags;$HOME/tags

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=1        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SNIPPETS AND COMMANDS:

" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.html5-template.html<CR>4jf>a

" Alternatively, define a command:
command Thtml :-1read $HOME/.vim/.html5-template.html 
command Ttidy :%!tidy -q -i --show-errors 0

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
"set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
"
" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Mode
" https://github.com/python-mode/python-mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<F5>"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"
let g:pymode_python = 'python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/gmarik/vimfiles/blob/master/vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=256                " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer' pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set autowrite                  " Writes on make/shell commands
set autoread                   " Re-read on external changes 

set nobackup                   " Do not backup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile                 " disable swapfiles

set hidden                     " The current buffer can be put to the background without writing to disk

" Searching
set hlsearch                   " highlight all search results
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
"let mapleader = ','           " off for now
"let maplocalleader = ' '      " Tab as a local leader
" "}}}

" FORMATTING: 
set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)

set wrap                       " Softwrap
set textwidth=0                " Wrap lines by default

set tabstop=2                  " tab size eql 2 spaces
set softtabstop=2
set shiftwidth=2               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   "

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

" noremap % v%                  " remap for selecting text between two brackets  *somewhat buggy*
set showmatch                   " show matching bracket
set matchtime=3                 " Time to show matching bracket

" ABBREVIATIONS:
"ab teh the                             

" SPELL CHECKING
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
set nospell                     " Activate for Spell checking
set spelllang=de_de,en_us,en_gb

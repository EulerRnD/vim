" =========================================================================== "
"                                   Mapping                                   "
" =========================================================================== "
nmap ; :
vmap ; :
imap ii <Esc>
vmap ii <Esc>
nmap k gk
nmap j gj
nmap - :Explore<CR>
nmap <C-j> :bprevious<CR>
nmap <C-k> :bnext<CR>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-c> <C-w>c
nmap \| :nohl<CR>
vnoremap < <gv
vnoremap > >gv

" =========================================================================== "
"                                  Settings                                   "
" =========================================================================== "
set nocompatible        " Disable vi legacy settings
set confirm             " Ask to save changes instead of just aborting
set nomodeline          " Fix security issue
set hidden              " Allow modified buffers to be hidden
set autochdir           " Change cwd to current file directory
set cursorline          " Highlight current line
set showcmd             " Show (partial) command in status line
set showmatch           " Show matching brackets
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set scrolloff=5         " keep at least 5 lines above/below
set linebreak           " Line breaks after full word instead of last char
set noerrorbells        " No error bells please
set ssop-=options       " Do not store global and local values in a session
set ssop-=folds         " Do not store folds
set lazyredraw          " Don't redraw while executing macros
set encoding=utf-8      " Set character encoding

" =========================================================================== "
"                               Tabs / Indents                                "
" =========================================================================== "
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set wrap

" =========================================================================== "
"                               Files / Buffers                               "
" =========================================================================== "
set nobackup
set nowritebackup
set noswapfile

" =========================================================================== "
"                                    Look                                     "
" =========================================================================== "
color desert
set laststatus=2                  " Ensure the statusline is always on
set statusline=
set statusline+=%<%F%*            " Full path
set statusline+=%m%*              " Modified flag
set statusline+=%r%*              " Readonly flag
set statusline+=%=                " Left/right alignment mark
set statusline+=\ \               " Space
set statusline+=%l%*              " Current line
set statusline+=\ \               " Space
set statusline+=%P%*              " File percentage
set statusline+=\ \               " Space
set statusline+=%{BufCount()}%*   " Total buffer count

" =========================================================================== "
"                                 Highlights                                  "
" =========================================================================== "
highlight TabsAndTrailingWhitespace ctermbg=red guibg=red
function SpecialHighlights()
    if &ft == 'python'
        " Trailing spaces AND any tabs.
        match TabsAndTrailingWhitespace /\s\+$\|\t/
    else
        " Trailing spaces only.
        match TabsAndTrailingWhitespace /\s\+$/
    endif
endfunction
autocmd BufEnter * call SpecialHighlights()

" Change the statusline color in insert mode
autocmd InsertEnter * hi statusline ctermbg=gray ctermfg=black guibg=black guifg=gray
autocmd InsertChange * hi statusline ctermbg=gray ctermfg=black guibg=black guifg=gray
autocmd InsertLeave * hi statusline ctermbg=black ctermfg=gray guibg=gray guifg=black

" =========================================================================== "
"                                GVIM Specific                                "
" =========================================================================== "
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=t
    set guioptions-=r
    set guioptions-=L
endif

" =========================================================================== "
"                                  Functions                                  "
" =========================================================================== "
function! BufCount()
" Get the total number of buffers
    let i = bufnr('$')
    let j = 0
    while i >= 1
        if buflisted(i)
            let j+=1
        endif
        let i-=1
    endwhile
    return j
endfunction



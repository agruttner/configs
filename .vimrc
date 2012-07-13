" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
"set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
"set textwidth=120
"set wrapmargin=2

" turn syntax highlighting on
set t_Co=256
syntax on
"colorscheme pablo
set background=dark

" turn line numbers on
"set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Enable mouse interaction
set mouse=a

" C-tags generate the tag file of the current directory
nmap ,t :!(cd %:p:h;ctags *.[ch])&

" setup cscope
cs add $CSCOPE_DB

nmap <M-Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <M-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <M-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <M-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <M-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <M-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <M-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <M-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
" recreate tags file with F5
map <F5> :!ctags -R ?~@~Sc++-kinds=+p ?~@~Sfields=+iaS ?~@~Sextra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
    "spell settings

    function! SwitchSpellLangToEnglish()
    map <F8> :setlocal spell spelllang=en_ca<CR>:call SwitchSpellLangOff()<CR>
    endfunction

    function! SwitchSpellLangOff()
        map <F8> :set nospell<CR>:call SwitchSpellLangToEnglish()<CR>
    endfunction

    call SwitchSpellLangToEnglish()

  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

" Code to remember previous cursor positions--------------------
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END
"---------------------------------------------------------------

set vb t_vb=
set incsearch hlsearch
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2
set statusline=
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%= " right align remainder
set statusline+=0x%-8B " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position

""""""""""""""""""""""""""""""
" => find
""""""""""""""""""""""""""""""
function! Find(name)
  let l:list=system("find . -name '*".a:name."*' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

filetype plugin indent on


" ===Vundle=== Beg
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe' " complete but not snips
" Plugin 'SirVer/ultisnips' " Track the engine. 
" Plugin 'honza/vim-snippets' " the snippet content
Plugin 'prabirshrestha/vim-lsp'
Plugin 'lervag/vimtex'
Plugin 'preservim/nerdtree'
call vundle#end()
"文件识别
filetype plugin indent on    " required
"语法高亮
syntax on
" ====Vundle==== End



"" Python
" make filetype py == python
" au BufNewFile,BufRead *.py set filetype=python
autocmd FileType py set filetype=python
" autocmd FileType py syntax on
" autocmd FileType python syntax on
autocmd FileType python setlocal colorcolumn=80 | highlight ColorColumn ctermbg=red
" 设置 tag 转跳
autocmd FileType python set tag=/Users/chengdaoyang/Documents/Programs/python/tags


" == YouCompleteMe 设置 ==
"默认配置文件路径"
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
"let g:ycm_confirm_extra_conf=0
"set completeopt=longest,menu
"python解释器路径
" let g:ycm_path_to_python_interpreter='/usr/local/bin/python3'
" let g:ycm_path_to_python_interpreter='/opt/local/bin/python3usr/local/bin/python3'
" let g:ycm_path_to_python_interpreter='/opt/local/bin/python3'
" let g:ycm_path_to_python_interpreter='/opt/local/bin/python3usr/local/bin/python3'
   "是否开启语义补全"
"   let g:ycm_seed_identifiers_with_syntax=1
   "是否在注释中也开启补全"
"   let g:ycm_complete_in_comments=1
"   let g:ycm_collect_identifiers_from_comments_and_strings = 0
   "开始补全的字符数"
"   let g:ycm_min_num_of_chars_for_completion=2
   "补全后自动关机预览窗口"
"   let g:ycm_autoclose_preview_window_after_completion=1
   " 禁止缓存匹配项,每次都重新生成匹配项"
"   let g:ycm_cache_omnifunc=0
   "字符串中也开启补全"
"   let g:ycm_complete_in_strings = 1
   "离开插入模式后自动关闭预览窗口"
"   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
   " 补全窗口 颜色
"   highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
"   highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
   " ctrl+空格 自动补全
"   let g:ycm_key_invoke_completion = '<c-space>'
   "回车即选中当前项"
   " inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'     



" ==VIM LSP===
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> K <plug>(lsp-hover)
    "nmap <buffer> gs <plug>(lsp-document-symbol-search)
    "nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    "nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    "nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    "nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END




" == 配置for latex(vimtex) auto ==
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme




let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_complete_in_strings=1
" let g:ycm_key_invoke_completion = '<c-space>'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
set completeopt=menu,menuone




" ====snippet 设置 ====
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir='~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]




" == vimtex 配置 ==
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_fold_enable=0 " Need to use fastFold with this option or... really slow.
let g:vimtex_fold_manual=1 " autofold is slow in vim, use FastFold instead of this option!.


" " start vimtex-clientserver
" if empty(v:servername) && exists('*remote_startserver')
"     call remote_startserver('VIM')
" endif





"  ==== Folding 设置 Start ====
"  保存/读取 view
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"背景灰色高光
highlight Folded ctermbg=green
" hi Folded ctermbg=grey  
"
" fold 信息
function! MyCleanFoldText()
	" v:foldstart是数字， getline（v:foldstart)是line
    highlight Folded ctermbg=green
    " let second_comment = substitute(getline(v:foldstart),"^ *","",1)

	let line_beg_info = "  |Start:" . v:foldstart . "| "  "现实第一行num
	let line_end_info =   "|End:" . v:foldend . "|"
 	let line_nums = v:foldend - v:foldstart + 1  "计算line num
	let line_length_info =  "|Length:" . line_nums . "| "

	let fold_leve_info = "+" . repeat("-", v:foldlevel*2) . v:foldlevel ."|  "

    let line = getline(v:foldstart)
    let first_line = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
	let first_line = first_line[0,56] "control length of string to 66 char

    " let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    " let expansionString = repeat(".", w - 2 -  strwidth(line_beg_info.line_length_info.first_line.'"'))
    let expansionString = repeat(".", 88 - 1 -  strwidth(line_nums.line_beg_info.line_length_info.line_end_info.first_line.'"'))

    let txt =  fold_leve_info . "L:" . line_nums .	'  "' . first_line . expansionString . line_beg_info . line_length_info .line_end_info
    return txt
endfunction
set foldtext=MyCleanFoldText()

" ==== Folding 设置 End ====





" == NERDTree 设置 ==
autocmd vimenter * NERDTree
" 宽度
let g:NERDTreeWinSize=22
" auto close NERDTree at end
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" 打开nerdtree auto | find tree find |   cursor on edit text
autocmd VimEnter * NERDTree | wincmd w | NERDTreeFind | wincmd p  

" Nerdtree in new tab
autocmd BufWinEnter * NERDTreeFind  "Mirror | wincmd w | NERDTreeFind | wincmd p  

let NERDTreeIgnore = ['\.pyc$', '__pycache__']  " ignore






noremap <c-space> <NOP>
" Jedi 设置\
" let g:jedi#auto_initialization = 0 "停止 自动inti

" 80 行提醒
" set colorcolumn=80  " set cc=80



" 配色
:color desert
set background=dark
highlight Normal ctermfg=lightgrey ctermbg=black


" 加强delete
set backspace=indent,eol,start


"自动对齐
set autoindent


"tab缩进
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab


"no <down> <Nop> 表示 在normal mode 中 把 down remap 到 Nop
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>


nnoremap <F6> :
inoremap <F6> <Esc>
cnoremap <F6> <Esc>


"map 左 下 to ctl+n == 代码补全
inoremap <down> <C-n>
inoremap<left> <C-n>


"nnoremap <C-@> i
"inoremap <C-@> <Esc>

"no <down> <Nop> 表示 在insert mode 中 把 down remap 到 Nop 
"ino <down> <Nop>
ino <up> <Nop>
"ino <left> <Nop>
ino <right> <Nop>


"显示行数
set nu

"显示相对行数
set relativenumber

"显示输入的命令
set showcmd

"浅色显示当前行
autocmd InsertLeave * se nocul


" ==== tab bar ====
hi TabLineFill ctermfg=Lightgray 
hi TabLineSel ctermfg=lightgray ctermbg=lightgreen
hi TabLine ctermfg=lightgreen ctermbg=lightgray " ctermbg=lightgray
hi Title ctermfg=Black ctermbg=None


" ====split window bar ====
highlight VertSplit ctermfg=Lightgray ctermbg=lightgreen
highlight StatusLineNC ctermfg=Lightgray ctermbg=lightgreen


 

" ==== statusline ====
set laststatus=2
set statusline=%t%m%r%h%w%=\ [%Y]\ [%{''.(&fenc!=''?&fenc:&enc).''}]\ [%{&ff}]\ [%04v,%04l]\ [%p%%]\ [%L]
" set statusline=
" set statusline+=%1*\ %<%t\                                "path
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
" set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
"hi StatusLine ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=yellow ctermbg=black



" Map F11 to run script
    map <F11> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
" elseif &filetype == 'py'
"             exec "!time python3 %"

elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'sh'
        "   :!time bash %
            :! bash %
elseif &filetype == 'html'
            exec "!open -a 'Google Chrome' % &"
" Expert tex to pdf
elseif &filetype == 'tex'
            exec "!pdflatex %"
elseif &filetype == 'sql'
            exec "!psql -d chengdaoyang -f %"

elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"

endif
    endfunc

" DoxygenToolKit 配置
let g:DoxygenToolkit_briefTag_pre="@Brief  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Return   " 
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="沈煜, shenyu@shenyu.me" 

" 折叠方式
"set fdm=indent

" 设置Backspace模式
set backspace=indent,eol,start

"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go compiler go


"+-------------------------------------+
"|vim配置文件                          |
"|主机: ShenYu@Mac OS X                |
"|时间：2013.10.03                     |
"+-------------------------------------+

" WinManager插件：(感觉比较累赘）
"nmap <C-y> :FirstExplorerWindow<CR>
"nmap <C-]> :BottomExplorerWindow<CR>

" TagList插件
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Auto_Open=0 " 启动vim 自动打开TagList
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select=0
let Tlist_Compact_Format=1  " 压缩方式
let Tlist_Ctags_Cmd="/usr/local/bin/ctags" 	"指定ctags路径
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column=0 " 不要显示折叠树
let Tlist_Exit_OnlyWindow=1 " 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_File_Fold_Auto_Close=1 "不要关闭其他文件的tags，1让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Max_Submenu_Items=25
let Tlist_Max_Tag_length=20
let Tlist_Process_File_Always=1
let Tlist_Show_Menu=0
let Tlist_Show_One_File=1 " only show tags for current window
let Tlist_Sort_Type="name" " 按名称默认排序
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window = 0
let Tlist_Use_SingleClick=0
let Tlist_WinHeight=10
let Tlist_WinWidth=25  " taglist窗口宽度
nmap tt :TlistToggle<CR>



"一键生成索引文件以及TagList更新
fun! BuildIndex()
exec "w"
exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
exec "TlistUpdate"
endfunc

"map <C-h> :call BuildIndex()<CR>
"imap <C-h> <ESC>:call BuildIndex()<CR>
"vmap <C-h> <ESC>:call BuildIndex()<CR>


"SuperTab配置:
"let g:SuperTabLongestHighlight=2 		"选中首选的关键字
let g:SuperTabRetainCompletionType=2 	"记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-N><C-P>" 	"默认的执行操作
"let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabContextDefaultCompletionType="<C-N><C-P>"  "对于context的默认的执行操作
let g:SuperTabNoCompleteAfter=['/', '\', ',', '\s', ':', ';', ')', '}', '{', '(', ')', '<', '>']	"在这些字符之后不补全

let g:SuperTabCompletionContexts=['s:ContextText']


"+-------------------------------------+
"|vim配置文件                          |
"|主机:Rainman                         |
"|时间：2012.1.12                      |
"+-------------------------------------+

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

"帮助显示中文
set helplang=cn

"utf-8编码
set encoding=utf-8

"显示行号
set number


" ctags 索引文件 (根据已经生成的索引文件添加)
set tags+=~/.vim/tags/cpp " 增加对C++ STL关键字智能补全的支持
set tags+=~/.vim/tags/boost "增加对Boost库关键字补全的支持，但是太大，不建议配置

set autochdir " 自动切换工作路径


" OmniCppComplete配置:
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " 自动关闭补全窗口
set completeopt=menuone,menu
"set completeopt=longest,menu

let OmniCpp_NamespaceSearch=2
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1         " 总是显示所有成员
let OmniCpp_ShowScopeInAbbr=0
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " 显示函数参数列表
let OmniCpp_MayCompleteDot=1      " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow=1    " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope=1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD", "__gnu_cxx"]
let OmniCpp_SelectFirstItem=0     " 选中第一个选项但是，不替换
let OmniCpp_LocalSearchDecl=1

"检测文件的类型
filetype on

filetype plugin on
filetype indent on 

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


if has("autocmd") && exists("+omnifunc")
     autocmd Filetype *
    \ if &omnifunc == "" |
    \    setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif
let g:rubycomplete_buffer_loading = 1


"记录历史的行数
set history=1000

"语法高亮度显示
syntax enable
"syntax on

"背景使用黑色（使用背景黑色后，很多主题颜色会随之改变，不建议设置）
set background=dark

"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_menu=0
"let g:solarized_degrade=1

"call togglebg#map("<F5>")

colorscheme solarized

"下面两行在进行编写代码时，在格式对起上很有用；
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编
"写上很有用
set autoindent
set smartindent

"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"去除vim的GUI版本中的toolbar
set guioptions=T

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=

"在编辑过程中，在右下角显示光标位置的状态行
set ruler

"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示
"set nohls

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch

"查询结果高亮
set hlsearch

"修改一个文件后，自动进行备份，备份的文件名为原文件名加"~"后缀
"if has("vms")     注意双引号要用半角的引号
"set nobackup
"else
"set backup
"endif

"括号智能匹配
"{{{
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
"inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=CloseBracket()<CR>
"inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
		"Escaping out of the string
		return "\<Right>"
	else
		"Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf
"}}}
"括号智能匹配 

"一键编译
func! CompileGcc()
exec "w"
let compilecmd="!clang "
let compileflag="-o %<.out 2> .%<.err"
exec compilecmd." % ".compileflag
exec "cfile .%<.err"
endfunc

func! CompileGpp()
exec "w"
let compilecmd="!clang++ -std=c++11"
let compileflag="-o %<.out 2> .%<.err"
exec compilecmd." % ".compileflag
exec "cfile .%<.err"
endfunc

func! RunPython()
exec "w"
exec "!python %"
endfunc

func! RunPython2()
exec "w"
exec "!python2 %"
endfunc

func! CompileJava()
exec "w"
exec "!javac %"
endfunc

func! CompileTex()
exec "w"
exec "!pdflatex %"
endfunc

func! CompileCode()
exec "w"
if &filetype == "cpp"
exec "call CompileGpp()"
elseif &filetype == "cc"
exec "call CompileGpp()"
elseif &filetype == "c"
exec "call CompileGcc()"
elseif &filetype == "python"
exec "call RunPython()"
elseif &filetype == "java"
exec "call CompileJava()"
elseif &filetype == "tex"
exec "call CompileTex()"
elseif &filetype == "go"
exec "call RunGo()"
endif
endfunc

"运行Go
func! RunGo()
exec "w"
let compilecmd="!go run "
exec compilecmd." %"
endfunc


func! RunResult()
exec "w"
if &filetype == "cpp"
exec "! ./%<.out"
elseif &filetype == "cc"
exec "! ./%<.out"
elseif &filetype == "c"
exec "! ./%<.out"
elseif &filetype == "python"
exec "call RunPython()"
elseif &filetype == "java"
exec "!java %<"
elseif &filetype == "tex"
exec "!evince %<.pdf"
endif
endfunc

func! RunResultWithTest()
exec "w"
if &filetype == "cpp"
exec "! ./%<.out < %<.test"
elseif &filetype == "cc"
exec "! ./%<.out < %<.test"
elseif &filetype == "c"
exec "! ./%<.out < %<.test"
elseif &filetype == "python"
exec "call RunPython()"
elseif &filetype == "java"
exec "!java %< < %<.test"
endif
endfunc

map <C-j> :call CompileCode()<CR>
map <C-n> :cnext<CR>  
map <C-p> :cprevious<CR>
imap <C-j> <ESC>:call CompileCode()<CR>
vmap <C-j> <ESC>:call CompileCode()<CR>
map <C-k> :call RunResult()<CR>
map <C-l> :call RunResultWithTest()<CR>

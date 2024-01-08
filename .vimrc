" взято из https://github.com/timlar/vim/blob/master/.vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("~/.vim/bundle/Vundle.vim/README.md"))
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-session'
    " Plugin 'Valloric/YouCompleteMe'
    " Plugin 'rdnetto/YCM-Generator'
    Plugin 'moll/vim-bbye'
    Plugin 'jlanzarotta/bufexplorer'
    Plugin 'junegunn/vim-easy-align'
    Plugin 'scrooloose/nerdtree'
    Plugin 'fatih/vim-go'
    Plugin 'rust-lang/rust.vim'
    Plugin 'prabirshrestha/async.vim'
    Plugin 'prabirshrestha/vim-lsp'
    Plugin 'prabirshrestha/asyncomplete.vim'
    Plugin 'prabirshrestha/asyncomplete-lsp.vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
    "=====================================================================================
endif

" Если запущен gvim
if has("gui_running")
    if has('gui_macvim')
        :set guifont=DejaVu\ Sans\ Mono:h14
    else
        set guifont=Monospace\ 10
    endif

    colorscheme desert

    " Отключаем панель инструментов
    set guioptions-=T
    " Отключаем левый скролл
    set guioptions-=L
    " Отключаем меню
    set guioptions-=m
    " Отключение копирования при выделении
    " set guioptions-=a

    "Антиалиасинг для шрифтов
    set antialias

    " Опции сессии
    set sessionoptions=curdir,buffers,tabpages ",resize,winpos,winsize

    " Сохранение сессии
    autocmd VimLeavePre * silent mksession! $HOME/.vim/session.vim
    "autocmd VimEnter * silent execute 'source $HOME/.vim/session.vim'
    set lines=999 columns=999
else    
    colorscheme desert
endif

" Использование цветов для темного фона
set background=dark

" Включение подсветки синтаксиса
syntax on

" Отображение спецсимволов
" set list
" set listchars=tab:▶\ ,trail:·,nbsp:·
set list!
if has('gui_running')
    set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
else
    set listchars=tab:>.,trail:.,extends:\#,nbsp:.
endif

" Включение дополнительных цветов
set t_Co=256

" Языковые установки
set keymap=russian-jcukenwin
set helplang=ru
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Последовательность выбора кодировок при открытии файлов
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Порядок применения кодировок и формата файлов
set ffs=unix,mac,dos
set fileencodings=utf8,cp1251

" Формат файла по умолчанию
set fileformat=unix

" Кодировка терминала
set termencoding=utf-8

" Работа с русскими словами (чтобы w, b, * понимали русские слова)
set iskeyword=@,48-57,_,192-255

" Проверка орфографии
set spelllang=ru_yo,en_us

" Заставляем BackSpace работать как x, т.е. удалять предыдущий символ
set backspace=indent,eol,start

" Отключение перехода курсора на след. строку при достижении конца строки
" set whichwrap+=<,>,[,]
set whichwrap=b,s

" Включение нумерации строк
set number

" Отключение переноса длинных строк
set nowrap

" Фолдинг
set foldenable
"set foldmethod=indent
"set foldmethod=marker
"set foldmarker={,}

" Сохранение и восстановление фолдинга
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

" Включение поддержки мыши
set mouse=a
set mousemodel=popup

" Прятать курсор при наборе текста
set mousehide

" Разрешить визуальное выделение мышью
set mouse=nvir

" Отключение перерисовки экрана во время выполнения макроса
set lazyredraw

" Быстрая отрисовка на медленных терминалах
set ttyfast

" Игнорирование регистра при поиске
set ignorecase

" Подсветка результатов поиска
set hlsearch

" Использование инкрементного поиска
set incsearch

" Всегда отображать командную строку
set laststatus=2

" Включение X clipboard
" set clipboard=unnamedplus

" Включение MacOS clipboard
set clipboard=unnamed

" Количество строк прокрутки при достижении границы
set scrolljump=0

" Количество строк, при достижении которых страница будет прокручиваться
set scrolloff=0

" Разбивать окно горизонтально снизу
set splitbelow

" Разбивать окно вертикально слева
set nosplitright

" Не изменять размеры окон при открытии/закрытии новго окна
set noequalalways

" Всегда отображать табы
set showtabline=0

" Хранить больше истории команд ...
set history=128

" ... и правок
set undolevels=2048

" Сохранение undo после закрытия файла
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo/
endif

" Запретить создание бэкапов
set nobackup

" Запретить создание swap файлов
set noswapfile

" Выключить виртуальный звонок
if has('gui_macvim')
    set visualbell
else
    set novisualbell
endif
set t_vb=

" Всегда показывать положение курсора
set ruler

" Показывать режим работы
set showmode

" Показывать команды
set showcmd

" И нет детей Уганды
set shortmess+=I

" По умолчанию латинская раскладка
set iminsert=0

" По умолчанию латинская раскладка при поиске
set imsearch=0

" Настройки табуляции
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
"set noexpandtab
set expandtab
set shiftround

" Автоотступы для новых строк
set autoindent
set nosmartindent

" Отслеживать изменения файлов
set autoread

" Настройки автозавершение
set completeopt=menu,menuone,longest,preview

set complete=""
set complete+=.
set complete+=t
set complete+=k
set complete+=b

" Включение меню
set wildmenu
set wildmode=list:longest,full
set wcm=<tab>

set hidden

" Не переносить комментарий при нажатии o/O
"set formatoptions-=o

" Включает флаг g в командах замены
"set gdefault

" При подсвечивании не переходить к следующему результату
nnoremap * *N

" Цвет ~
"highlight NonText ctermfg=bg guifg=bg

" Формат строки состояния
"set statusline=
"set statusline+=%(\ %m%) " флаг 'файл изменен'
"set statusline+=\ %y " тип
"set statusline+=\ %{&ff} " формат
"set statusline+=\ %{&fileencoding} " кодировка
"set statusline+=\ %F " полный путь
"set statusline+=\ %{FileSize()} " размер
"set statusline+=\ %r " флаг 'только для чтения'
"set statusline+=%= " разделитель лево/право
"set statusline+=%l/%L " текущая строка / всего строк
"set statusline+=\ %c " текущая колонка
"set statusline+=\ %p%% " позиция в файле
"set statusline+=\ " пробел вконце

" Отключение подсветки парных скобок
let loaded_matchparen = 1

"set noautochdir
"let NERDTreeChDirMode=2
"let NERDTreeDirArrows=1

if has("gui_running")
" Подсвечивать текущую строку в GUI режиме
    set cursorline

" Подсветка длины строки в 80 символов
"    set colorcolumn=81

" Автоматическое открытие NERDTree
"    if has('gui_macvim')
"        au VimEnter * NERDTree /Users/www/
"    else
"        au VimEnter * NERDTree /home/www/
"    endif

" Подсветка файла под курсором
"    let NERDTreeHighlightCursorline=1
else
" Не подсвечивать текущую строку в консоли
    set nocursorline

" Отключение подсветки файла под курсором
"    let NERDTreeHighlightCursorline=0
endif


let g:session_autosave = 'yes'
let g:session_autosave_periodic = 15
let g:session_default_to_last = 1
let g:session_autoload = 'yes'

"let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '/home/kadim/.vim/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

nnoremap <F7>  :YcmForceCompileAndDiagnostics<CR>		" Диагностическая компиляция
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>	" Переход к определени символа
nnoremap <F5> :!make clean && make<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\  '\': { 'pattern': '\\', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 }
\ }

let g:go_bin_path = "${HOME}/go/bin"

"Подключение других vimrc"
set exrc
set secure

"auto start nerdtree
"autocmd vimenter * NERDTree

map <C-n> :NERDTreeFocus<CR>

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

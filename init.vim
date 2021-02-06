" Autocompletado

set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)
" Tamaño por defecto del terminal
"set termwinsize=10x0

set relativenumber "Numero de saltos
set cursorline  " Resalta la línea actual
syntax on
"set cursorline  " Resalta la línea actual


" Indentación a 5 espacios
set tabstop=5
set shiftwidth=5
set softtabstop=5
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s
set hidden  " Permitir cambiar de buffers sin tener que guardarlos
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
set termguicolors  " Activa true colors en la terminal
set splitbelow
set splitright
" Required:
call plug#begin('~/.config/nvim/plugged')
"
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'scrooloose/nerdtree' "

Plug 'dracula/vim' " Nesesario para el theme dracula
Plug 'tpope/vim-surround'  " Es buena idea agregar una descripción del plugin

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado

Plug 'ervandew/supertab'

Plug 'Shougo/echodoc.vim' " Muestra la firma de la función.

Plug 'w0rp/ale' " Analizador estático de codigo

Plug 'sheerun/vim-polyglot' " Resaltado de sintaxix polyglot

Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } "lenguaje css

Plug 'othree/html5.vim', { 'for': 'html' } " html

Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " javascript

Plug 'ryanoasis/vim-devicons' " Mostrar icons

Plug 'yggdroot/indentline' "ident line



"Functionality
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()

"tecla maestra o lider
let mapleader= ','
"
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual

" Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#enabled = 1 
" Mostrar sólo el nombre del archivo
let g:airline#extensions#tabline#fnamemod = ':t' 
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
" No mostrar el modo actual (ya lo muestra la barra de estado)
set noshowmode  

" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" Abrir/cerrar NERDTree con t
let g:NERDTreeChDirMode = 2 " Cambiar el directorio actual al padre del nodo actual
map <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction



" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'

" No mostrar el modo actual (echodoc hace uso de este espacio)
set noshowmode
" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1


" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


" Ignorar archivos en .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Guardar con <líder> + s
nnoremap <leader>w :w<CR> 
" Guardar Y Salir
nnoremap <leader>1w :wq<CR>
" Salir sin guardar
nnoremap <leader>2w :exit!<CR> 

" Abrir el archivo init.vim con <líder> + e
nnoremap <leader>e :e $MYVIMRC<CR>



" Moverse al buffer siguiente con <líder> + l
nnoremap <leader>ne :bnext<CR>
" Moverse al buffer anterior con <líder> + j
nnoremap <leader>pr :bprevious<CR>
" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete!<CR>

"------------------------------------------------------------"

"-------------------------VIM DEVICONS-----------------------"
" Vim devicons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
"configuring the highlight devicons
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
set encoding=UTF-8
let g:webdevicons_enable_nerdtree = 1


"----------------------EASY MOTION---------------------------"
"easymotion
nmap <leader>f <Plug>(easymotion-s2)
noremap <up> <nop>
noremap <down> <nop>

let g:EasyMotion_smartcase = 1

"---------------------------FZF------------------------------"
"Configuration of FZF cotrl + p
let g:fzf_preview_window = 'right:40%'
nnoremap <c-p> :Files<CR> 
nnoremap <c-g> :GitFiles<CR>
" use current git repo/file director with ctrl p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0


"------------------------AIRLINE-----------------------------"
let g:airline#extensions#tabline#enabled = 1  " show open buffers (like tabs)
let g:airline#extensions#tabline#fnamemod = ':t'  " Show only filename
let g:airline_powerline_fonts = 1 " Change separetors to be triangles
let g:airline_theme='tomorrow'

"----------------------INDENT LINE---------------------------"
"indentline
let g:indentLine_char_list = ['│', '┊']

"------------------------------------------------------------"

"------------------------SIGNIFY-----------------------------"
"signify
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" If you like colors instead
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" Abrir terminal
map <F2> :split <CR>:ter<CR>:resize 15<CR>
"Controlar el Modo lectura con ESC en la terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

"Hailitar teclas de navegacion
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"Redimencionado de las ventanas aviertas
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>

"quitar la navgacion / (precionar / + esc)
nnoremap / /a<DEL>

" Turn-on dracula color scheme
syntax on
color dracula


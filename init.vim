" Neovim settings
:set mouse=a
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set clipboard=unnamedplus

" Plugins
call plug#begin()

" Airline settings
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" File explorer
Plug 'https://github.com/preservim/nerdtree'

" Autocompleteon
Plug 'neoclide/coc.nvim'

" Themes pack and transparent mode
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'tribela/vim-transparent'

call plug#end()

" Function to create a new file and enter a window to edit it
function! Create_and_edit_file()
    let file_name = input("Enter a filename: ")
    if !empty(file_name)
        execute "edit " . file_name
    else
        echo "No filename provided."
    endif
endfunction

" Function to find smth in the file
function! Find_In_Code()
	let search_query = input("Enter the search query: ")
	if len(search_query) > 0
		cgetexpr system("grep -rnH " . shellescape(search_query) . " " . shellescape(expand("%:p")))
		copen
	else
		echo "No search query provided."
	endif
endfunction

" Keybinds
nnoremap <C-f> :NERDTree<CR>
nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <C-z> u<CR>
nnoremap <C-w> :w<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-N> :call Create_and_edit_file()<CR>
nnoremap <C-t> :botright terminal<CR>
nnoremap <C-s> :call Find_In_Code()<CR>

" Autocompletion settings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Theme settings
:colorscheme nord
let t:is_transparent = 1
let g:airline_theme='base16'

" let $NVIM_PYTHON_LOG_FILE = '/home/x0/.config/nvim/log.log'

" Neovim settings
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

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
        execute 'edit ' . file_name
    else
        echo "No filename provided."
    endif
endfunction

" Keybinds
nnoremap <C-f> :NERDTree<CR>
nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <C-z> u<CR>
nnoremap <C-w> :w<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-N> :call Create_and_edit_file()<CR>

" Autocompletion settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Theme settings
:colorscheme 256_noir
let t:is_transparent = 1
let g:airline_theme='minimalist'

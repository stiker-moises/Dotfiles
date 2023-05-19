"<c-q> for escaping insert and visual modes
inoremap <c-q> <esc>
vnoremap <c-q> <esc>

"backspace for deleting selection
"vnoremap <BS> d

"uhhh you can read
nnoremap ; :

"sourcing your .vimrc
nnoremap <leader>s :so %<cr>

"<c-a> to select all
nnoremap <C-a> ggVG

"Q to reformat paragraphs
vmap Q gq
nmap Q gqap

"<c-v> for pasting text from the clipboard in insert mode
inoremap <C-v> <C-r>+

"to recover undo states in insert mode
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"secondary clipboard eh you know it
noremap <c-v> "+p
noremap <c-x> "+d
noremap <c-c> "+ygv

"moving around with htns in normal and visual modes
nnoremap s l
nnoremap t k
nnoremap n j
vnoremap n j
vnoremap s l
vnoremap t k

"A for visual line mode ie. selecting per line
nnoremap A V
"v for pasting
nnoremap v p
"<c-r> for replace mode
nnoremap <c-r> R
"r/R for undo/redo
nnoremap U <c-r>
"V to go to the end of the line
nnoremap V A
"r/R for lowercasing and uppercasing in visual mode
vnoremap r u
vnoremap R U

nnoremap I E

"i to go to the end of a word
nnoremap i e
"a to enter visual mode
nnoremap a v
"e to enter insert/edit mode
nnoremap e i
"<bs> to delete a character in normal mode
"nnoremap <bs> x

"writing changes with sudo
cmap w!! w !sudo tee > /dev/null %

"opening your init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

"nonhighlighting search results
nnoremap <leader>x :nohlsearch<CR>

"putting words in quotes in normal mode
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"splits
nnoremap <C-i> :vsplit<cr>
nnoremap <C-k> :split<cr>
"moving between splits
nnoremap <C-w> <C-w><C-w>

"navigating between tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"<c-d> or <c-e> to exit without saving
nnoremap <C-d> :q!<cr>
nnoremap <c-e> :q!<cr>
"<c-s> to save and exit
nnoremap <c-s> :wq<cr>

nnoremap k *
nnoremap j #

nnoremap J gg
nnoremap K G

"onoremap p i{
"onoremap ib( :<c-u>normal! f(vi(<cr>
"onoremap il( :<c-u>normal! F)vi(<cr>

"I can't remap buffers.

"This can be expanded.
"
cnoremap <C-j> <C-g>
"compressing empty lines
cnoremap <C-x> v/./.,/./-1join<cr> 

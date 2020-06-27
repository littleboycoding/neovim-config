           "_                        
 "_ __ ___ (_)_ __  _ __   __ _  ___ 
"| '_ ` _ \| | '_ \| '_ \ / _` |/ __|
"| | | | | | | | | | |_) | (_| | (__ 
"|_| |_| |_|_|_| |_| .__/ \__,_|\___|
                  "|_|               

packadd minpac

if !exists('*minpac#init')
"Install minpac if doesn't exist !
echo "Minpac did not installed, installing..."
!git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
source ~/.config/nvim/init.vim
call minpac#update('', {'do': 'call minpac#status()'})
else
call minpac#init()

"call minpac#add('yuttie/comfortable-motion.vim', {'type': 'opt'})
call minpac#add('itchyny/lightline.vim', {'type': 'opt'})
call minpac#add('TaDaa/vimade', {'type': 'opt'})
call minpac#add('dracula/vim', {'type': 'opt', 'name': 'dracula'})
call minpac#add('pangloss/vim-javascript', {'type': 'opt'})
call minpac#add('HerringtonDarkholme/yats.vim', {'type': 'opt'})
call minpac#add('ryanoasis/vim-devicons', {'type': 'opt'})
call minpac#add('posva/vim-vue', {'type': 'opt'})
call minpac#add('MaxMEllon/vim-jsx-pretty', {'type': 'opt'})
call minpac#add('prettier/vim-prettier', {'type': 'opt', 'do': '!npm install'})
call minpac#add('jparise/vim-graphql', {'type': 'opt'})
call minpac#add('iamcco/markdown-preview.nvim', {'type': 'opt', 'do': '!cd app & npm install'})
call minpac#add('prettier/vim-prettier', {'type': 'opt'})
call minpac#add('neovim/nvim-lsp', {'type': 'opt'})
call minpac#add('haorenW1025/completion-nvim', {'type': 'opt'})
"call minpac#add('dense-analysis/ale', {'type': 'opt'})
"call minpac#add('Shougo/deoplete.nvim', {'type': 'opt', 'do': 'UpdateRemotePlugins'})
"call minpac#add('JamshedVesuna/vim-markdown-preview', {'type': 'opt'})
"call minpac#add('vimlab/split-term.vim', {'type': 'opt'})
"call minpac#add('liuchengxu/vista.vim', {'type': 'opt'})


packadd vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1

autocmd BufWrite *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

packadd vim-graphql

packadd markdown-preview.nvim
nmap <C-p> <Plug>MarkdownPreviewToggle

"let g:ale_fix_on_save = 1
"let g:ale_fixers = {
"\ 'html': ['tidy', 'prettier'],
"\ 'css': ['prettier'],
"\ 'json': ['prettier'],
"\ 'gql': ['prettier'],
"\ 'markdown': ['prettier'],
"\ 'yaml': ['prettier'],
"\ 'javascript': ['prettier'],
"\ 'javascriptreact': ['prettier'],
"\ 'javascript.jsx': ['prettier'],
"\ 'typescript': ['prettier'],
"\ 'typescriptreact': ['prettier'],
"\ 'typescript.jsx': ['prettier']
"\ }
"let g:ale_completion_tsserver_autoimport = 1
"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠'
"packadd ale
"set omnifunc=ale#completion#OmniFunc
"
"let g:deoplete#enable_at_startup = 1
"packadd deoplete.nvim
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\ })
"
"noremap <silent> <F8> :ALENextWrap<CR>
"noremap <silent> <F20> :ALEPreviousWrap<CR>
"noremap <silent> <C-k> :ALEHover<CR>

let g:vim_jsx_pretty_colorful_config = 1
packadd vim-jsx-pretty
packadd vim-vue
"packadd comfortable-motion.vim

autocmd TermOpen * setlocal nonumber nocursorline
autocmd TermOpen * setlocal norelativenumber nocursorline

packadd vimade
packadd dracula
colorscheme dracula

packadd lightline.vim

"Devicon lightline integration
packadd vim-devicons

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
	  \ 'colorscheme': 'dracula',
	  \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \             [ 'readonly', 'filename', 'modified' ] ]
	  \ },
	  \ 'component_function': {
	  \   'filetype': 'MyFiletype',
	  \   'fileformat': 'MyFileformat',
	  \ },
	  \ }


packadd vim-javascript
packadd yats.vim

""Vista
"packadd vista.vim
"let g:vista_default_executive = "ctags"
"let g:vista_executive_for = {
"\ 'javascript': 'nvim_lsp',
"\ 'javascriptreact': 'nvim_lsp',
"\ 'javascript.jsx': 'nvim_lsp',
"\ 'typescript': 'nvim_lsp',
"\ 'typescriptreact': 'nvim_lsp',
"\ 'typescript.tsx': 'nvim_lsp',
"\ }
"noremap <silent> <F4> :Vista!!<CR>


packadd nvim-lsp
packadd completion-nvim

lua << EOF
require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}
require'nvim_lsp'.html.setup{on_attach=require'completion'.on_attach}
require'nvim_lsp'.cssls.setup{on_attach=require'completion'.on_attach}
EOF

noremap <silent> <C-k> :lua vim.lsp.buf.hover()<CR>

autocmd FileType typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType typescript.tsx setlocal omnifunc=v:lua.vim.lsp.omnifunc

autocmd FileType javascript setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType javascriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType javascript.tsx setlocal omnifunc=v:lua.vim.lsp.omnifunc

autocmd FileType html setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType css setlocal omnifunc=v:lua.vim.lsp.omnifunc
endif

command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()

  "___ ___  _ __ ___  _ __ ___   ___  _ __  
 "/ __/ _ \| '_ ` _ \| '_ ` _ \ / _ \| '_ \ 
"| (_| (_) | | | | | | | | | | | (_) | | | |
 "\___\___/|_| |_| |_|_| |_| |_|\___/|_| |_|
                                           "
          "_   _   _                 
 "___  ___| |_| |_(_)_ __   __ _ ___ 
"/ __|/ _ \ __| __| | '_ \ / _` / __|
"\__ \  __/ |_| |_| | | | | (_| \__ \
"|___/\___|\__|\__|_|_| |_|\__, |___/
                          "|___/     

set rtp+=~/.fzf
noremap <silent> <F3> :FZF<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

set termguicolors

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

set list lcs=tab:\|\ 

set tabstop=4
set softtabstop=4
set shiftwidth=0

set backupcopy=yes

set number
set relativenumber
set cursorline

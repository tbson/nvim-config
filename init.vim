call plug#begin('~/.config/nvim/plugged')
    " Autocomplete
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'

    " Navigating
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    Plug 'dyng/ctrlsf.vim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'mkitt/tabline.vim'
    Plug 'brooth/far.vim'
    Plug 'pechorin/any-jump.vim'
    Plug 'andymass/vim-matchup'

    " Copilot
    Plug 'github/copilot.vim'

    " Syntax support
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tanvirtin/monokai.nvim'
    " Plug 'psf/black'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
    Plug 'nvimdev/indentmini.nvim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'lewis6991/gitsigns.nvim'

    " Markdown
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
call plug#end()

let mapleader = ","

" ============================================================================
" CRITICAL PERFORMANCE SETTINGS
" ============================================================================

" Disable expensive features
set nocursorline        " Major performance boost
set nocursorcolumn      " Major performance boost
set norelativenumber    " Faster than relative
set nonumber           
set signcolumn=yes      " Better than 'number' - prevents shifting
set nolazyredraw        " Don't use - causes input delay!
set synmaxcol=180       " Limit syntax highlighting
set regexpengine=1      " Old regex engine (faster)

" Disable slow plugins
let g:loaded_matchparen = 1     " Disable matchparen (causes lag)
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0  
let g:loaded_node_provider = 0

augroup vimrc_autocmd
    autocmd!

    " Highlight symbol under cursor on CursorHold
    " autocmd CursorHold * silent call CocActionAsync('highlight')

    autocmd VimEnter * nmap <Leader>w <C-w>w

    noremap <silent> <F1> :let @+=expand("%")<CR> 

    autocmd VimEnter * nmap <F2> :tabnew<CR>
    autocmd VimEnter * imap <F2> <Esc>:tabnew<CR>

    autocmd VimEnter * nmap <F3> :NvimTreeToggle<CR>
    autocmd VimEnter * imap <F3> <Esc>:NvimTreeToggle<CR>

    autocmd VimEnter * nmap <F4> :w<CR>
    autocmd VimEnter * imap <F4> <Esc>:w<CR>

    autocmd VimEnter * nmap <F5> :wa<CR>
    autocmd VimEnter * imap <F5> <Esc>:wa<CR>

    autocmd VimEnter * nmap <F6> :tabonly<CR>
    autocmd VimEnter * imap <F6> <Esc>:tabonly<CR>

    autocmd VimEnter * nmap <F9> :q!<CR>
    autocmd VimEnter * imap <F9> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F10> :q!<CR>
    autocmd VimEnter * imap <F10> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F11> :q!<CR>
    autocmd VimEnter * imap <F11> <Esc>:q!<CR>

    autocmd VimEnter * nmap <Leader>r :noh<CR>:edit<CR>

    " autocmd VimEnter * nmap <Leader>b :Black<CR>

    autocmd VimEnter * nmap <S-U> <C-R>

    " autocmd VimEnter * nmap f <Plug>(easymotion-sn)

    autocmd VimEnter *  nmap <C-F> <Plug>CtrlSFPrompt

    autocmd FileType fugitive nmap <buffer> T O
    autocmd FileType python set sw=4
    autocmd FileType python set ts=4
    autocmd FileType python set sts=4

    " autocmd FileType php let b:prettier_ft_default_args = {
    "    \ 'parser': 'php',
    "    \ }

    " autocmd BufWritePre *.py execute ':Black'
    " autocmd BufWritePre *.js* execute ':Prettier'
    " autocmd BufWritePre *.ts* execute ':Prettier'
    autocmd BufWritePre *.php execute ':Prettier'
    autocmd BufWritePre *.vue execute ':Prettier'
    autocmd BufWritePre *.css execute ':Prettier'
    autocmd BufWritePre *.rs lua vim.lsp.buf.format()
    " autocmd BufEnter * lua require'completion'.on_attach()
augroup END

" Always use 0 register to paste, not shit from deleting
xnoremap p "_dP

" Go to tab by number
noremap <leader>1 1gt
noremap <D-1> 1gt

noremap <leader>2 2gt
noremap <D-2> 2gt

noremap <leader>3 3gt
noremap <D-3> 3gt

noremap <leader>4 4gt
noremap <D-4> 4gt

noremap <leader>5 5gt
noremap <D-5> 5gt

noremap <leader>6 6gt
noremap <D-6> 6gt

noremap <leader>7 7gt
noremap <D-7> 7gt

noremap <leader>8 8gt
noremap <D-8> 8gt

noremap <leader>9 :tablast<cr>
noremap <D-9> :tablast<cr>

" nnoremap <leader>cl :CocDiagnostics<cr>
" nmap <leader>cf  <Plug>(coc-fix-current)

tnoremap <Esc> <C-\><C-n>

nnoremap <C-g> :Commits<CR>
nnoremap <C-j> :AnyJump<CR>
nnoremap <C-k> :Tags <C-R><C-W><CR>
nnoremap <C-l> :Buffers<CR>
" nnoremap <C-p> :FZF<CR>
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
" nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
" nnoremap <C-p> :GFiles --others --exclude-standard<CR>
nnoremap <C-s> :w<CR>

" nnoremap <buffer> k gk
" nnoremap <buffer> j gj

nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>h <cmd>lua vim.lsp.buf.hover()<CR>

nnoremap * *``

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

syntax sync minlines=256

set guifont=JetBrains\ Mono:h10
" set termguicolors
" packadd! dracula_pro
" let g:dracula_colorterm = 0
" colorscheme dracula_pro

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" set synmaxcol=166
set lazyredraw
set scrolljump=2
set colorcolumn=90
set diffopt+=vertical

set mouse=a
set clipboard=unnamed
" set clipboard=unnamedplus
set smartcase
set smarttab
set ignorecase
set incsearch
set hlsearch
set showmatch
set magic

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set completeopt-=preview
set autoindent
set cindent

set encoding=utf-8

" prettier
let g:prettier#config#print_width = 88
let g:prettier#config#tab_width = 4
let g:prettier#exec_cmd_async = 1
let g:prettier#config#trailing_comma = 'none'

" Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_winsize = '100'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_search_mode = 'async'

let g:any_jump_disable_default_keybindings = 1
let g:any_jump_window_width_ratio = 1
let g:any_jump_window_height_ratio = 1
let g:any_jump_window_top_offset   = 0
let g:any_jump_grouping_enabled = 1
let g:any_jump_references_enabled = 1
let g:any_jump_max_search_results = 20
" let g:any_jump_search_prefered_engine = 'ag'

" let g:far#source = 'rg'
let g:mix_format_on_save = 1

" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" let g:fzf_preview_window = []

let g:javascript_plugin_jsdoc = 1
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.12/bin/python3'

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %=Column:\ %c\ \ Line:\ %l
" set statusline+=%F
set statusline=
set statusline+=%f  " File name
set statusline+=%=  " Split the statusline
set statusline+=%l  " Current line number
set statusline+=\:  " Separator
set statusline+=%c  " Column number
set statusline+=\ 
set statusline+=%p%%  " Percentage through file

" Performance settings
set ttyfast
set redrawtime=10000

" Better folding
set foldmethod=indent
set foldlevel=19
" set foldexpr=nvim_treesitter#foldexpr()
" autocmd BufReadPost,FileReadPost * normal zR

" Go-specific settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

" Copilot configuration
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_workspace_folders = ["~/Code/web/dbkit", "~/Code/web/2030"]

lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require'nvim-web-devicons'.setup {
 color_icons = true;
 default = true;
}

require("nvim-tree").setup {
    filters = { 
        custom = { "^.git$", "^.vscode$", "^.elixir_ls$", "^_build$", "^.DS_Store$", "^__pycache__$", "^.cache$", ".pyc$", ".coverage$", ".class$", "^out$", "^node_modules$", "^build$", "^dist$", "^yarn.lock$", "^.mypy_cache$", "^.swm$", "^tmp$"} 
    },
    git = {
        enable = false,
    },
    view = {
        side = "right",
        width = 48,
    },
    renderer = {
        root_folder_label = false,
    }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
        "python", "rust", "go", "typescript", "javascript", 
        "lua", "vim", "html", "css", "json", "yaml"
    },
    ignore_install = {"phpdoc"},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        indent = { enable = false },
    },
}

require('monokai').setup {
    palette = {
        base2 = '#000000',
    }
}

require('fzf-lua').setup{
  winopts = {
    preview = { hidden = "hidden" },
    height=1,
    width=1
  },
  files = {
    git_icons = false
  }
}

require('gitsigns').setup {
    -- change gitsigns signs to looks like gitgutter
    -- signs = {
    --    add          = { text = '┃' },
    --    change       = { text = '┃' },
    --    delete       = { text = '_' },
    --    topdelete    = { text = '‾' },
    --    changedelete = { text = '~' },
    -- },
    signs = {
       add          = { text = '+' },
       change       = { text = '~' },
       delete       = { text = '_' },
       topdelete    = { text = '‾' },
       changedelete = { text = '~' },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    current_line_blame = false,
    attach_to_untracked = false,
    sign_priority = 100,  -- Higher than diagnostics to show git signs
    update_debounce = 200,  -- Increased for performance
    max_file_length = 40000,
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}


require("indentmini").setup {
    char = '╎',
    minlevel = 2,
}
vim.cmd.highlight('IndentLine guifg=#3c3c3c')
vim.cmd.highlight('IndentLineCurrent guifg=#3c3c3c')
-- require("elixir").setup()



-- ==============================================================================
-- Part 1: nvim-lspconfig setup
-- ==============================================================================
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, bufopts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.positionEncoding = "utf-8"

vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                enable = true,
                command = "clippy",
            },
            -- Add these for better diagnostics refresh
            cargo = {
                buildScripts = {
                    enable = true,
                },
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                refreshSupport = true,  -- Add this
            },
            inlayHints = {
                enable = true,
            },
        },
    },
})

vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = {'vim'} },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable('gopls')
vim.lsp.config('gopls', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
                nilness = true,
                unusedwrite = true,
                useany = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

vim.lsp.enable('pyright')
vim.lsp.config('pyright', {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        active = true,
        priority = 10,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        source = "always",
        border = "rounded",
    },
})


-- ==============================================================================
-- Part 2: nvim-cmp setup (This part remains the same as your minimal preference)
-- ==============================================================================
local cmp = require('cmp')

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' , max_item_count = 5},
    }),
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
    },
    formatting = {
        fields = { "abbr" },
        format = function(entry, vim_item)
            return vim_item
        end,
    },
    window = {
        completion = cmp.config.window.bordered({}),
        documentation = cmp.config.window.bordered({}),
    },
})
EOF

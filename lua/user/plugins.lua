-- plugins

vim.cmd [[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(
    function()
        -- completion + lsp
        use {'onsails/lspkind-nvim'}
        use {"hrsh7th/nvim-cmp", config = [[require('user.completion')]]}
        use { 'hrsh7th/cmp-buffer', after = "nvim-cmp" }
        use { 'hrsh7th/cmp-path', after = "nvim-cmp" }
        use { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" }
        use { 'hrsh7th/cmp-omni', after = "nvim-cmp" }
        use {"quangnguyen30192/cmp-nvim-ultisnips", after = {'nvim-cmp', 'ultisnips'}}
        use { 'neovim/nvim-lspconfig', after = "cmp-nvim-lsp" }
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-nvim-lua'
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'

        -- other
        use 'LnL7/vim-nix'
        use 'MunifTanjim/nui.nvim'
        use 'airblade/vim-gitgutter'
        use 'azadkuh/vim-cmus'
        use 'digitaltoad/vim-pug'
        use 'editorconfig/editorconfig-vim'
        use 'fatih/vim-go'
        use 'jiangmiao/auto-pairs'
        use 'lepture/vim-jinja'
        use 'luochen1990/rainbow'
        use 'mattn/emmet-vim'
        use 'mbbill/undotree'
        use 'nathanaelkane/vim-indent-guides'
        use 'nvim-lua/plenary.nvim'
        use 'othree/html5.vim'
        use 'pangloss/vim-javascript'
        use 'preservim/nerdcommenter'
        use 'radenling/vim-dispatch-neovim'
        use 'rhysd/vim-grammarous'
        use 'ryanoasis/vim-devicons'
        use 'sheerun/vim-polyglot'
        use 'stephenway/postcss.vim'
        use 'tpope/vim-dispatch'
        use 'tpope/vim-surround'
        use 'vim-airline/vim-airline'
        use 'vim-utils/vim-man'
        use 'wbthomason/packer.nvim'
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icons
            },
            config = function()
                require'user.nvim-tree-config'
            end,
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
        use {'dracula/vim', name = 'vim-dracula', rev = 'bfbc3cadbd142e74d3b92e63f1de8711261015a4', frozen = 1}
        use {'evanleck/vim-svelte', branch = 'main'}
        use {'neoclide/coc.nvim', branch = 'release'}
        use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use {
            'goolord/alpha-nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function ()
                require'user.alpha_nvim_config'.setup()
            end
        }
        if packer_bootstrap then
            require('packer').sync()
        end
    end
    )

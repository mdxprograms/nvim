-- plugins

vim.cmd [[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
    function()
        use "LnL7/vim-nix"
        use "SirVer/ultisnips"
        use "airblade/vim-gitgutter"
        use "alaviss/nim.nvim"
        use "azadkuh/vim-cmus"
        use "fatih/vim-go"
        use "honza/vim-snippets"
        use "jiangmiao/auto-pairs"
        use "luochen1990/rainbow"
        use "mattn/emmet-vim"
        use "mbbill/undotree"
        use "nathanaelkane/vim-indent-guides"
        use "nvim-lua/plenary.nvim"
        use "othree/html5.vim"
        use "pangloss/vim-javascript"
        use "preservim/nerdcommenter"
        use "radenling/vim-dispatch-neovim"
        use "rhysd/vim-grammarous"
        use "ryanoasis/vim-devicons"
        use "sheerun/vim-polyglot"
        use "stephenway/postcss.vim"
        use "tpope/vim-dispatch"
        use "tpope/vim-surround"
        use "vim-airline/vim-airline"
        use "vim-utils/vim-man"
        use "wbthomason/packer.nvim"
        use 'MunifTanjim/nui.nvim'
        use 'editorconfig/editorconfig-vim'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/nvim-cmp'
        use 'neovim/nvim-lspconfig'
        use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
        use {"dracula/vim", name = "vim-dracula", rev = "bfbc3cadbd142e74d3b92e63f1de8711261015a4", frozen = 1}
        use {"evanleck/vim-svelte", branch = "main"}
        use {"neoclide/coc.nvim", branch = "release"}
        use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {
            'goolord/alpha-nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function ()
                require'alpha_nvim_config'.setup()
            end
        }
        if packer_bootstrap then
            require("packer").sync()
        end
    end
    )

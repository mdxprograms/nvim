local cmp = require'cmp'

cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = "ultisnips" },
            { name = 'path' }, -- for path completion
            { name = 'buffer', keyword_length = 4 }, -- for buffer word completion
            { name = 'omni' },
            -- more sources
        },
        -- recommended configuration for <Tab> people:
        mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                ['<S-Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Esc>'] = cmp.mapping.close(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
            }),
        completion = {
            keyword_length = 1,
            completeopt = "menu,noselect"
        },
    })

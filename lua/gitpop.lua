local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local helpers = require("helpers")

local api = vim.api

local GitPop = {}
local buf_title = 'GitPop'

local mappings = {
    ['<cr>'] = 'open_file()',
    ['q'] = 'close_popup()'
}

for k,v in pairs(mappings) do
    helpers.nmap(k, ':lua require"gitpop".'..v..'<cr>')
end

GitPop.popup = Popup({
        enter = true,
        focusable = true,
        border = {
            text = {
                top = buf_title,
                top_align = 'center'
            },
            style = "rounded",
        },
        position = {
            row = "40%",
            col = "50%"
        },
        size = {
            width = "80%",
            height = "60%",
        },
        buf_options = {
            modifiable = true,
            readonly = true,
        },
        win_options = {
            winblend = 10,
            winhighlight = "Normal:Normal,FloatBorder:SpecialChar",
        }
    })


GitPop.open_popup = function()
    GitPop.popup:mount()
    local result = vim.fn.systemlist('git show --pretty="" --name-only HEAD')

    api.nvim_buf_set_lines(GitPop.popup, 0, -1, false, result)

    GitPop.popup:on(event.BufLeave, function()
        GitPop.popup:unmount()
    end)
end

GitPop.close_popup = function()
    api.nvim_buf_delete(0, {})
end

GitPop.open_file = function ()
    local f_path = api.nvim_get_current_line()
    GitPop.popup:unmount()
    api.nvim_command('edit '..f_path)
end

return GitPop

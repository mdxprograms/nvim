local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local HOME = os.getenv("HOME")

local Sup = {}
local scratch_file_path = HOME .. '/.config/nvim/tmp/scratchpad.md'

Sup.popup = Popup({
        enter = true,
        focusable = true,
        border = {
            text = {
                top = 'Scratchup',
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
            readonly = false,
        },
        win_options = {
            winblend = 10,
            winhighlight = "Normal:Normal,FloatBorder:SpecialChar",
        }
    })


Sup.open_popup = function()
    Sup.popup:mount()

    Sup.popup:on(event.BufLeave, function()
        vim.cmd('silent w ' .. scratch_file_path)
    end)

    vim.cmd('silent edit' .. scratch_file_path)
    vim.bo.filetype = 'markdown'
end

Sup.close_popup = function()
    vim.cmd('silent w ' .. scratch_file_path)
    Sup.popup:unmount()
end

return Sup

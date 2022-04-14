local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local open = io.open
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
        position = "50%",
        size = {
            width = "80%",
            height = "60%",
        },
        buf_options = {
            modifiable = true,
            readonly = false,
        },
    })

local function open_file()
    local file = open(scratch_file_path, 'rb')
    if not file then return nil end

    local lines = {}

    for line in io.lines(scratch_file_path) do
        table.insert(lines, line)
    end

    file:close()
    return lines
end

function Sup.open_popup()
    -- mount/open the component
    Sup.popup:mount()
    local content = open_file()

    -- unmount component when cursor leaves buffer
    Sup.popup:on(event.BufLeave, function()
        vim.cmd('w ' .. scratch_file_path)
        Sup.popup:unmount()
    end)

    -- set content
    vim.api.nvim_buf_set_lines(Sup.popup.bufnr, 0, 1, false, content)
    vim.bo.filetype = 'markdown'
end

function Sup.close_popup()
    vim.cmd('q')
end

return Sup

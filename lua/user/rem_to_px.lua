local notify = require("notify")

local RemToPixel = {}

function RemToPixel:to_px(v)
    local result = 0
    result = 16 * v
    notify("pixels: " .. result,
        vim.log.levels.INFO,
        {
            title = "RemToPixel",
            render = "simple",
            timeout = 500,
            stages = "slide"
        })
end

vim.api.nvim_create_user_command("RemToPixel", function(input)
    RemToPixel:to_px(input.args)
end, { nargs = '*' })

return RemToPixel

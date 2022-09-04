local input = require("nui.input")

local bookmark_input = function(label, on_submit)
    return input({
        position = "50%",
        size = {
            width = 20,
        },
        border = {
            style = "single",
            text = {
                top = label,
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    }, {
        prompt = "> ",
        default_value = "",
        on_close = function()
            print("closed")
        end,
        on_submit = function(value)
            on_submit(value)
        end,
    })
end

return bookmark_input

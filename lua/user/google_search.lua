local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local GoogleSearch = {}

GoogleSearch.input = Input({
        position = "50%",
        size = {
            width = 20,
        },
        border = {
            style = "single",
            text = {
                top = "Google Search",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    }, {
        prompt = "> ",
        default_value = "How to",
        on_close = function()
            print("closed")
        end,
        on_submit = function(value)
            os.execute('open https://google.com/search?q="'.. value ..'"')
        end,
    })

GoogleSearch.open = function()
    GoogleSearch.input:mount()
end

GoogleSearch.input:on(event.BufLeave, function()
    GoogleSearch.input:unmount()
end)

return GoogleSearch

local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event
local is_macos = require("user.helpers").is_macos
local HOME = os.getenv("HOME")

local bookmarks_file = HOME .. "/.config/nvim/data/bookmarks.txt"

local read_file = function()
    local lines = {}
    local file = io.open(bookmarks_file)
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()
    return lines
end

local line_save_format = function(item)
    return item.text .. " " .. item.link
end

local split_string = function(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

local get_bookmarks_list = function()
    local b = {}

    table.insert(b, Menu.item("Add Bookmark+", { link = "new" }))
    table.insert(b, Menu.separator("", {
            char = "-",
            text_align = "center"
        }))

    for _,l in pairs(read_file()) do
        local sp = split_string(l, " ")
        table.insert(b, Menu.item(sp[1], { link = sp[2] }))
    end

    return b
end

local menu = Menu({
        position = "50%",
        size = {
            width = 50,
            height = 25,
        },
        border = {
            style = "single",
            text = {
                top = "Bookmarks",
                top_align = "left",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    }, {
        lines = get_bookmarks_list(),
        keymap = {
            focus_next = { "j", "<Down>" },
            focus_prev = { "k", "<Up>" },
            close = { "<Esc>", "q" },
            submit = { "<CR>" }
        },
        on_close = function()
            print("Closed bookmarks")
        end,
        on_submit = function(item)
            if item.link == "new" then
                return print("create new bookmark!")
            end

            -- mac open
            if is_macos() then
                os.execute('open "'.. item.link ..'"')
            else
                vim.cmd('exec "!xdg-open \'' .. item.link .. '\'"')
            end
        end,
    })

menu:mount()

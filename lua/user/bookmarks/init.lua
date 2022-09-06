local Menu = require("nui.menu")
local is_macos = require("user.helpers").is_macos
local HOME = os.getenv("HOME")
local bookmark_input = require("user.bookmarks.fields")
local utils = require("user.bookmarks.utils")

local bookmarks_file = HOME .. "/.config/nvim/data/bookmarks.txt"

local bookmarks_menu = {}

New_bookmark = {
    text = "",
    link = ""
}

local new_bookmark_link_input = bookmark_input("Link", function(value)
    New_bookmark.link = value

    local file = io.open(bookmarks_file, "a+")

    io.output(file)
    io.write(utils.line_save_format(New_bookmark), "\n")
    file:close()
end)

local new_bookmark_label_input = bookmark_input("Label", function(value)
   New_bookmark.text = value
   new_bookmark_link_input:mount()
end)

bookmarks_menu = Menu({
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
        lines = utils.get_bookmarks_list(bookmarks_file),
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
                return new_bookmark_label_input:mount()
            end

            -- mac open
            if is_macos() then
                os.execute('open "'.. item.link ..'"')
            else
                vim.cmd('silent! exec "!xdg-open \'' .. item.link .. '\'"')
            end
        end,
    })

return bookmarks_menu

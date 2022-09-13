local Menu = require("nui.menu")

M = {}

M.read_file = function(file_path)
    local lines = {}
    local file = io.open(file_path)
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()
    return lines
end

M.delete_bookmark = function(file_path, match)
    local updated_lines = {}

    for _,l in pairs(M.read_file(file_path)) do
        if (not string.find(l, match)) then
            table.insert(updated_lines, l)
        end
    end

    local file = io.open(file_path, "w")

    for _,l in ipairs(updated_lines) do
        file:write(l, "\n")
    end

    file:close()
end

M.split_string = function(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

M.get_bookmarks_list = function(file_path)
    local b = {}

    table.insert(b, Menu.item("Add Bookmark+", { link = "new" }))
    table.insert(b, Menu.separator("", {
            char = "-",
            text_align = "center"
        }))

    for _,l in pairs(M.read_file(file_path)) do
        if string.len(l) > 0 then
            local sp = M.split_string(l, " ")
            table.insert(b, Menu.item(sp[1], { link = sp[2] }))
        end
    end

    return b
end

M.line_save_format = function(item)
    return item.text .. " " .. item.link
end

return M

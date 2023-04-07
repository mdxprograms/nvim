local wk = require("which-key")

wk.setup({
    key_labels = {
        ["<space>"] = "SPC",
        ["<tab>"] = "Tab"
    }
})

wk.register({
    ["<space>"] = "Edit config",
    s = "Search in buffer",
    t = {
        name = "Toggle",
        n = "New Tab",
        t = "New Terminal",
        nt = "New Terminal Tab",
    },
    f = {
        name = "Files",
        f = "Fuzzy find",
        s = "Save file",
        g = "Global search",
        b = "File Browser"
    },
}, { prefix = "<leader>", nowait = true })

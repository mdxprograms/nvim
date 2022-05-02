local M = {}

function M.setup()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
        return
    end

    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡴⢦⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡴⠷⠞⢤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣀⣠⣤⠤⠴⠷⠶⠶⠾⠦⠤⣤⣤⣀⣀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣀⣤⠶⠛⠉⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠛⠶⣦⣄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣀⡀⠄⠄⠄⢀⣠⡶⠟⠉⠄⠄⠄⠄⠄⣀⣀⣠⣤⣤⣤⣤⣤⣤⣄⣀⣀⠄⠄⠄⠄⠄⠉⠛⢷⣦⣀⠄⠄⠄⢀⣀⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⣀⣹⠋⢃⣴⠟⠉⠄⠄⠄⠄⣀⡴⠾⠛⠋⠉⠉⠄⡇⠄⠄⣼⠄⠉⠉⠙⠛⠷⢦⣀⠄⠄⠄⠄⠈⠛⢷⣌⠉⣯⣀⡟⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠏⢈⣿⠟⠁⠄⠄⣀⣠⠶⠛⠉⠄⠄⠄⠄⠄⠄⠄⣿⠄⠄⣇⠄⠄⠄⠄⠄⠄⠄⠉⠻⠶⣄⣀⠄⠄⠄⠹⢿⣀⠸⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣴⠟⠁⠄⠄⣠⡾⢻⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣇⡴⢦⣻⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠟⢷⣄⠄⠄⠄⠹⣷⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣾⠋⠄⠄⢠⣾⡋⠑⢄⠙⢦⡀⠄⠄⠄⠄⠄⠄⠄⢿⡉⠳⠞⠉⣵⠄⠄⠄⠄⠄⠄⠄⢀⡴⠋⣠⠞⢙⣷⡄⠄⠄⠈⢿⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⢠⡿⠁⠄⠄⢀⡎⠄⠙⠲⣄⠑⢄⣬⡶⢦⡀⠄⠄⠄⠄⠄⢳⡀⠄⡞⠁⠄⠄⠄⠄⠄⡴⢾⣭⣤⠞⣡⠖⠋⠄⢱⡄⠄⠄⠄⢻⣆⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⢠⡿⠁⠄⠄⢠⡟⠄⠄⠄⠄⠘⢦⣿⣤⣣⠸⡇⠄⠄⠄⠄⠄⢸⡇⠄⡇⠄⠄⠄⠄⠄⢠⠇⣼⡤⢼⣴⠋⠄⠄⠄⠄⠻⣄⠄⠄⠄⢻⡆⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⢀⣿⠁⠄⠄⢰⡏⠄⠄⠄⠄⠄⠄⠈⠳⠶⢦⡑⢌⠳⣤⡴⠞⠛⠉⠉⠉⠉⠙⠻⢶⣤⢞⣥⢞⠤⠶⠞⠃⠄⠄⠄⠄⠄⠄⠘⣆⠄⠄⠄⢻⡆⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⣼⠇⠄⠄⢀⡿⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⣦⡟⠉⠄⢀⣠⠤⠶⠲⠦⢤⣀⠄⠈⠻⣵⠋⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢹⡄⠄⠄⠘⣷⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⣿⠄⠄⠄⣸⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣰⠏⠄⢀⣴⠏⠄⠄⠄⠄⣀⣀⣈⠳⡄⠄⠘⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⣧⠄⠄⠄⢻⡄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⡤⢼⡏⠄⠄⠄⣿⣤⣤⣀⣠⣤⣴⡚⠳⢤⣀⠄⣀⡏⠄⠄⡞⢺⠄⠄⠄⠄⠏⠁⠄⠈⠉⢿⡄⠄⢸⣀⣀⣀⣠⠞⠛⡦⣤⣄⣀⣠⣤⣿⠄⠄⠄⢸⣧⣤⠄⠄⠄⠄]],
        [[⠄⠄⣏⣹⠇⢸⡇⠄⠄⠄⣿⠤⠤⠤⠤⢴⡏⡱⠦⠤⠬⢭⣭⡇⠄⢸⡇⠈⠳⢤⣤⡤⠠⣄⠄⠄⠄⠈⡇⠄⠄⡯⠭⠥⠤⠤⢾⣉⡦⠤⠤⠤⠤⣿⠄⠄⠄⢸⡧⠴⡋⢹⠄⠄]],
        [[⠄⠄⠄⠈⠳⢺⡇⠄⠄⠄⣿⠖⠒⠒⠒⠒⠻⣇⡤⠚⠉⠉⠉⣇⠄⠄⢧⠄⠄⠄⠄⠄⠄⢸⠄⠄⠄⣰⠃⠄⢰⠉⠉⠉⠛⠦⣤⠿⠒⠚⠛⠓⠒⣿⠄⠄⠄⢸⡷⠔⠉⠁⠄⠄]],
        [[⠄⠄⠄⠄⠄⠈⣿⠄⠄⠄⢻⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢻⡄⠄⠈⠳⣄⠄⠄⠄⣠⠞⠄⢀⡴⠃⠄⢠⡿⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡿⠄⠄⠄⣼⠁⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⢿⡄⠄⠄⠘⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣠⠟⣦⡀⠄⠈⠙⠻⠿⠥⠖⠚⠉⠄⢀⣴⢿⡁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⠇⠄⠄⢀⡟⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠘⣧⠄⠄⠄⢹⡆⠄⠄⠄⠄⠄⠄⠄⡴⠶⠒⣡⢞⡼⠛⠶⣤⣀⡀⠄⠄⢀⣀⣤⡶⠛⢷⡕⢍⠶⠦⢤⡀⠄⠄⠄⠄⠄⠄⢠⡟⠄⠄⠄⣼⠃⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠸⣧⠄⠄⠄⠹⣆⠄⠄⠄⠄⢀⠞⢿⠒⣻⠰⡏⠄⠄⠄⠄⠄⢸⡏⠉⡇⠄⠄⠄⠄⠄⠘⡆⢻⠒⢺⢳⡄⠄⠄⠄⠄⣰⠏⠄⠄⠄⣼⠃⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠹⣧⠄⠄⠄⠙⣇⠄⣀⡴⢋⣴⠟⣒⡿⠞⠁⠄⠄⠄⠄⠄⣸⠁⠄⣇⠄⠄⠄⠄⠄⠄⠳⢼⡒⠚⢄⠙⢦⡀⠄⣰⠏⠄⠄⠄⣴⠏⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⣧⡀⠄⠄⠘⢾⡉⣰⠟⣡⠞⠉⠄⠄⠄⠄⠄⠄⠄⣾⠁⣰⣆⠈⣳⠄⠄⠄⠄⠄⠄⠄⠉⠳⣄⠑⢄⢙⣶⠇⠄⠄⢀⣼⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢷⣄⠄⠄⠄⠛⢧⡴⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⡟⢧⡼⢻⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢷⣴⠟⠁⠄⠄⣠⡞⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡂⢙⣷⣆⠄⠄⠄⠉⠓⢦⣄⡀⠄⠄⠄⠄⠄⠄⠄⢹⠄⠄⣿⠄⠄⠄⠄⠄⠄⠄⢀⣠⡴⠞⠉⠁⠄⠄⣰⣾⠉⣲⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣼⠉⣻⣀⡘⢷⣄⡀⠄⠄⠄⠈⠙⠶⣤⣄⣀⠄⠄⠄⡟⠄⠄⢻⠄⠄⢀⣀⣠⣤⠶⠛⠁⠄⠄⠄⢀⣠⠾⢋⣨⡟⠙⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠁⠄⠄⠄⠈⠛⢶⣄⡀⠄⠄⠄⠄⠈⠉⠙⠛⠛⠻⠿⠿⠟⠛⠛⠛⠉⠁⠄⠄⠄⠄⣀⣤⠶⠛⠁⠄⠄⠄⠉⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠙⠻⢶⣤⣀⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣀⣤⠶⠟⠋⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠙⠛⠻⠶⠶⡶⠶⠶⢶⠶⠶⠛⠛⠋⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠳⡶⢦⠞⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
        [[⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠳⠞⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
    }
    dashboard.section.buttons.val = {
        dashboard.button("t", "📝 Scratchup", ":lua require'scratchup'.open_popup()<CR>"),
        dashboard.button("c", "💾 Configuration", ":e $MYVIMRC<CR>"),
        dashboard.button("q", "❌ Quit Neovim", ":qa<CR>"),
    }

    local handle = io.popen('fortune')
    local fortune = handle:read("*a")
    handle:close()
    dashboard.section.footer.val = fortune
    dashboard.config.opts.noautocmd = true
    vim.cmd[[autocmd User AlphaReady echo 'ready']]
    alpha.setup(dashboard.config)
end

return M
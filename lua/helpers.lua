local M = {}

M.map = function(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, {noremap = true, silent = true})
end

M.nmap = function(shortcut, command)
  M.map('n', shortcut, command)
end

M.imap = function(shortcut, command)
  M.map('i', shortcut, command)
end

M.set_keymap = function(mode, from, to, opts)
  vim.api.nvim_set_keymap(mode, from, to, opts)
end

M.set_options = function(options)
  for key, val in pairs(options) do
    if val == true then
      vim.api.nvim_command("set " .. key)
    elseif val == false then
      vim.api.nvim_command("set no" .. key)
    else
      vim.api.nvim_command("set " .. key .. "=" .. val)
    end
  end
end

M.is_macos = function()
    return vim.loop.os_uname().sysname == "Darwin"
end

return M

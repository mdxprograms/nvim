function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, {noremap = true, silent = true})
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function set_keymap(mode, from, to, opts)
  vim.api.nvim_set_keymap(mode, from, to, opts)
end

function set_options(options)
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

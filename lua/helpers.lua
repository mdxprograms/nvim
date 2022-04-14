local H = {}

function H.map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, {noremap = true, silent = true})
end

function H.nmap(shortcut, command)
  H.map('n', shortcut, command)
end

function H.imap(shortcut, command)
  H.map('i', shortcut, command)
end

function H.set_keymap(mode, from, to, opts)
  vim.api.nvim_set_keymap(mode, from, to, opts)
end

function H.set_options(options)
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

return H

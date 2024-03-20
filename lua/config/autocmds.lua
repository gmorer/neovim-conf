-- Indentation
local space_2 = {
    expandtab = "",
    tabstop = "2",
    shiftwidth = "2",
}

local space_4 = {
    expandtab = "",
    tabstop = "4",
    shiftwidth = "4",
}

local tab_4 = {
    noexpandtab = "",
    tabstop = "4",
    shiftwidth = "4",
}

local langs = {
    javascript = space_2,
    typescript = space_2,
    typescriptreact = space_2,
    go = tab_4,
    rust = space_4,
    c = tab_4,
    cpp = tab_4,
    lua = space_2,
    cs = space_4,
    proto = space_2,
}

for lang, options in pairs(langs) do
    local command = "autocmd FileType " .. lang .. " setlocal"
    for opt, val in pairs(options) do
        if string.len(val) < 1 then
            command = command .. " " .. opt
        else
            command = command .. " " .. opt .. "=" .. val
        end
    end
    vim.cmd(command)
end


-- Fix terminal behavior
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function ()
    vim.cmd('setlocal listchars= nonumber norelativenumber nocursorline nolist')
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = '',
  command = 'startinsert'
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  command = 'startinsert'
})

-- Nice try at binary edit
local group = vim.api.nvim_create_augroup("Hexedit", {clear = true})

vim.api.nvim_create_user_command("BinEdit", function ()
  vim.bo.bin = true
  vim.cmd("silent :e")
  vim.cmd("silent %!xxd")
  vim.bo.filetype = "xxd"

  local clients = vim.lsp.get_active_clients({bufnr = 0})
  for client_id, _ in pairs(clients) do
    vim.lsp.buf_detach_client(bufnr, client_id)
  end

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    callback = function ()
      if vim.bo.filetype == "xxd" then
        vim.cmd("silent %!xxd -r")
        vim.cmd("silent w")
        vim.cmd("silent %!xxd")
      end
    end,
  })

end, {})

vim.api.nvim_create_user_command("BinExit", function ()
  vim.bo.bin = false
  vim.cmd("silent :e!")
end, {})

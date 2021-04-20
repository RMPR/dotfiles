vim.cmd [[ packadd completion-nvim ]]

local lsp = require('lspconfig')
local completion = require('completion')

-- Create an helper function to bind new mappings
local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

-- Custom attach function called each time a new supported buffer is open
local custom_attach = function()
  completion.on_attach()
  -- Move cursor to the next and previous diagnostic
  mapper('n', '<leader>n', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<leader>p', 'vim.lsp.diagnostic.goto_prev()')
end

lsp.pyls.setup{
  on_attach = custom_attach
}

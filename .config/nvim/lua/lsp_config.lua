local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'
local nvim_lsp = require('lspconfig')
local completion = require 'completion'
require 'rust-lsp'
require 'python-lsp'

-- Create an helper function to bind new mappings
local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

-- Custom attach function called each time a new supported buffer is open
local custom_attach = function()
  completion.on_attach()
  -- local opts = { noremap=true, silent=true }
  -- Move cursor to the next and previous diagnostic
  mapper("n", "<leader>n", "vim.diagnostic.goto_next()")
  mapper("n", "<leader>p", "vim.diagnostic.goto_prev()")
  mapper("n", "gd", "vim.lsp.buf.definition()")
  mapper("n", "<leader>gi", "vim.lsp.buf.implementation()")
  mapper("n", "<leader>sh", "vim.lsp.buf.signature_help()")
  mapper("n", "<leader>rr", "vim.lsp.buf.references()")
  mapper("n", "<leader>rn", "vim.lsp.buf.rename()")
  mapper("n", "<leader>h", "vim.lsp.buf.hover()")
  mapper("n", "<leader>ca", "vim.lsp.buf.code_action()")
  mapper("n", "<leader>sd", "vim.lsp.util.show_line_diagnostic()")
  mapper("n", "gD", "vim.lsp.buf.declaration()")
  mapper("n", "<leader>==", "vim.lsp.buf.formatting()")
end

-- Just add the server name to the list of servers
local servers = {'pylsp', 'rust_analyzer', 'gopls', 'bashls'}
  for _, ls in ipairs(servers) do
   nvim_lsp[ls].setup {
     on_attach = custom_attach,
   }
end

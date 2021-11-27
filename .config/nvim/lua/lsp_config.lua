local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'
local nvim_lsp = require('lspconfig')
local completion = require 'completion'


-- Python Configuration
configs.pyls = {
    default_config = {
        cmd = { 'pyls' },
        filetypes = { 'python' },
        root_dir = function(fname)
            local root_files = {
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'requirements.txt',
                'Pipfile',
            }
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
        end,
    },
    docs = {
        description = [[
        https://github.com/python-lsp/python-lsp-server
        A Python 3.6+ implementation of the Language Server Protocol.
        The language server can be installed via `pipx install 'python-lsp-server[all]'`.
        Further instructions can be found in the [project's README](https://github.com/python-lsp/python-lsp-server).
        Note: This is a community fork of `pyls`.
        ]],
    },
}


-- Create an helper function to bind new mappings
local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

-- Custom attach function called each time a new supported buffer is open
local custom_attach = function()
  completion.on_attach()
  -- local opts = { noremap=true, silent=true }
  -- Move cursor to the next and previous diagnostic
  mapper("n", "<leader>n", "vim.lsp.diagnostic.goto_next()")
  mapper("n", "<leader>p", "vim.lsp.diagnostic.goto_prev()")
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
local servers = {'pyls', 'rust_analyzer', 'gopls'}
  for _, ls in ipairs(servers) do
   nvim_lsp[ls].setup {
     on_attach = custom_attach,
   }
end

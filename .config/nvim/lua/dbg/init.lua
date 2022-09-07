telescope = require 'telescope'
--require 'python'


vim.keymap.set("n", "<leader>dct", ":lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>dsv", ":lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dsi", ":lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>dso", ":lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<leader>dtb", ":lua require'dap'.toggle_breakpoint()<cr>")

vim.keymap.set("n", "<leader>dsc", ":lua require'dap.ui.variables'.scopes()<cr>")
vim.keymap.set("n", "<leader>dhh", ":lua require'dap.ui.variables'.hover()<cr>")
vim.keymap.set("v", "<leader>dhv", ":lua require'dap.ui.variables'.visual_hover()<cr>")

vim.keymap.set("n", "<leader>duh", ":lua require'dap.ui.widgets'.hover()<cr>")
vim.keymap.set("n", "<leader>duf", ":lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<cr>")

vim.keymap.set("n", "<leader>dsbr", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>dsbm", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set("n", "<leader>dro", ":lua require'dap'.repl.open()<cr>")
vim.keymap.set("n", "<leader>drl", ":lua require'dap'.repl.run_last()<cr>")


-- telescope.load_extension('dap')

-- telescope-dap
vim.keymap.set("n", "<leader>dcc", ":lua require'telescope'.extensions.dap.commands{}<cr>")
vim.keymap.set("n", "<leader>dco", ":lua require'telescope'.extensions.dap.configurations{}<cr>")
vim.keymap.set("n", "<leader>dlb", ":lua require'telescope'.extensions.dap.list_breakpoints{}<cr>")
vim.keymap.set("n", "<leader>dv", ":lua require'telescope'.extensions.dap.variables{}<cr>")
vim.keymap.set("n", "<leader>df", ":lua require'telescope'.extensions.dap.frames{}<cr>")


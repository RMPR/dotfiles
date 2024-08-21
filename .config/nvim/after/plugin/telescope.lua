-- Telescope
-- <C-n>/<Down> 	Next item
-- <C-p>/<Up> 	Previous item
-- j/k 	Next/previous (in normal mode)
-- <CR> 	Confirm selection
-- <C-x> 	go to file selection as a split
-- <C-v> 	go to file selection as a vsplit
-- <C-t> 	go to a file in a new tab
-- <C-u> 	scroll up in preview window
-- <C-d> 	scroll down in preview window
-- <C-c> 	close telescope
-- <Esc> 	close telescope (in normal mode)
require('telescope').setup{}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>af', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fgw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tr', builtin.resume, {})
vim.keymap.set('n', '<leader>tk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep For > ")})
end)
-- " Delete entry from the picker https://github.com/nvim-telescope/telescope.nvim/pull/828
require("telescope").setup {
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-x><c-c>"] = "delete_buffer",
        }
      }
    }
  }
}

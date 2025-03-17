vim.opt.clipboard="unnamedplus"
vim.opt.relativenumber=true
vim.opt.number=true

require("keymap")
require("config.lazy")
require("colorizer").setup()
-- require('noirbuddy').setup {
--   preset = 'kiwi',
-- }
require("lspconfig").dockerls.setup({})

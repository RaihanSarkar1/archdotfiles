vim.opt.clipboard="unnamedplus"
vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.splitright=true

require("keymap")
require("config.lazy")
require("config.witch_conf")
require("config.neoscroll_conf")
require("colorizer").setup()
-- require('noirbuddy').setup {
--   preset = 'kiwi',
-- }
require("lspconfig").dockerls.setup({})

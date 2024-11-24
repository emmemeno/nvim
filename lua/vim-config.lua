vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set numberwidth=1")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_set_keymap("!", "<F5>", '<Cmd>:wa<CR><Cmd>:TermExec cmd="cargo run" dir="./" open=0<CR>', { noremap = true})






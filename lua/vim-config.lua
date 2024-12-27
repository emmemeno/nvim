vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set numberwidth=1")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set({"n","i"}, "<F5>", '<Cmd>:wa<CR><Cmd>:TermExec cmd="cargo run" dir="./" direction="float"<CR>', { noremap = true})
vim.keymap.set({"n","i"}, "<F6>", '<Cmd>:wa<CR><Cmd>:TermExec cmd="cargo test -- --nocapture" dir="./" direction="float"<CR>', { noremap = true})

local vim = vim

--Set Mapleader
vim.g.mapleader = " "

-- Exit with 'q' , if using macro recording change to <C-q> → Ctrl + q
vim.cmd([[ map <C-q> :q<CR> ]])
-- Select all with 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- guardar
vim.cmd([[ map <C-s> :w<CR> ]])

-- Copiar visual-normal
vim.cmd([[ map vnoremap <leader>y "+y ]])
vim.cmd([[ map nnoremap <leader>y "+y ]])

vim.api.nvim_set_keymap("n", "<leader>k", [[<Cmd>lua require'telescope.builtin'.keymaps({results_title='Key Maps Results'})<CR>]], { noremap = true, silent = true })

-- Find files in config dirs
vim.api.nvim_set_keymap("n", "<leader>f", [[<Cmd>lua require'telescope.builtin'.find_files()<CR>]], { noremap = true, silent = true }
)

-- go to next buffer
vim.api.nvim_set_keymap("n", "<Leader><right>", ":bn<CR>", { noremap = true, silent = true })
-- go to prev buffer
vim.api.nvim_set_keymap("n", "<Leader><left>", ":bp<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "Leader>n", "NvimTreeOpen<CR>", { noremap = true, silent = true})
-- save some strokes (best mapping ever)
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

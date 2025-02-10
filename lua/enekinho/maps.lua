vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Explore<CR>")

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")


-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Telescope
map("n", "<leader>pf", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
map("n", "<C-p>pf", "<CMD>Telescope git_files<CR>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>ps", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Fuzzy find opened files" })
map("n", "<leader>fs", "<CMD>Telescope git_status<CR>", { desc = "Show git file diffs" })
map("n", "<leader>fc", "<CMD>Telescope git_commits<CR>", { desc = "Browse git commits" })

-- Copy maps
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Diagnostics
map('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
map("n", "gd", function() vim.lsp.buf.definition() end)
map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
map("n", "gl", function() vim.diagnostic.open_float() end, { noremap = true, silent = true })
map("n", "<leader>[d", function() vim.diagnostic.goto_next() end)
map("n", "<leader>]d", function() vim.diagnostic.goto_prev() end)
map("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
map("n", "<leader>vrr", function() vim.lsp.buf.references() end)
map("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
map("n", "<C-h>", function() vim.lsp.buf.signature_help() end)
map("n", "<leader>f", vim.lsp.buf.format)

vim.diagnostic.config({
  virtual_text = true
})

-- Remap escape and disable Q
map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")

-- Navigation with centering
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Search and keep cursosr centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Prevent overriting paste in visual mode
map("x", "<leader>p", [["_dP]])


-- Moving selected lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Join next line to current one
map("n", "J", "mzJ`z")

map("n", "<leader><leader>", function() vim.cmd("so") end)

-- Copy path
map("n", "<leader>cpp", [[:let @+ = expand("%")<RR>]])

map("n", "<leader>gb", ":Git blame<CR>")

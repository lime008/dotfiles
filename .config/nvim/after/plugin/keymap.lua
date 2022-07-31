function m(mode, key, action, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, action, options)
end

-- disable default space mapping in normal mode for leader to work
m("n", "<SPACE>", "<Nop>")

m("n", "<F8>", ":TagbarToggle<cr>")

-- map the hjkl keys to navigate between splits
m("n", "<c-h>", ":wincmd h<cr>", { silent = true })
m("n", "<c-j>", ":wincmd j<cr>", { silent = true })
m("n", "<c-k>", ":wincmd k<cr>", { silent = true })
m("n", "<c-l>", ":wincmd l<cr>", { silent = true })

-- create splits
m("n", "<leader>h", ":<C-u>split<cr>")
m("n", "<leader>v", ":<C-u>vsplit<cr>")

-- toggle list characters
m("n", "gl", ":set list!<cr>")

-- map the jk keys to move lines ------------------ m("n", "<^]-j>", ":m .+1<cr>==")
m("n", "<^]-k>", ":m .-2<cr>==")
m("i", "<^]-j>", "<Esc>:m .+1<cr>==gi")
m("i", "<^]-k>", "<Esc>:m .-2<cr>==gi")
m("v", "<^]-j>", ":m '>+1<cr>gv=gv")
m("v", "<^]-k>", ":m '<-2<cr>gv=gv")
-- " ------------------------------------------------

-- telescope
m("n", "<C-p>", function()
	require("telescope.builtin").git_files()
end)
m("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end)
m("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end)
m("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end)
m("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end)
m("n", "<leader>bm", function()
	require("telescope").extensions.vim_bookmarks.all()
end)

-- nvim lsp
m("n", "gd", function()
	vim.lsp.buf.definition()
end)
m("n", "gr", function()
	vim.lsp.buf.references()
end)
m("n", "gD", function()
	vim.lsp.buf.declarations()
end)
m("n", "gD", function()
	vim.lsp.buf.declarations()
end)
m("n", "K", function()
	vim.lsp.buf.hover()
end)
m("n", "<leader>e", function()
	vim.diagnostic.open_float()
end)
m("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end)
m("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end)
m("n", "<leader>lsr", ":LspRestart<cr>")

-- browse git files
m("n", "<leader>o", ":.GBrowse<cr>")

-- nvim tree mappings
m("", "<C-n>", ":NvimTreeToggle<cr>")

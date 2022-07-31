vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "limetty"

vim.api.nvim_set_var("airline#extensions#branch#enabled", 1)
vim.api.nvim_set_var("airline#extensions#ale#enabled", 1)
vim.api.nvim_set_var("airline#extensions#tabline#enabled", 1)
vim.api.nvim_set_var("airline#extensions#tagbar#enabled", 1)

vim.g.airline_skip_empty_sections = 1

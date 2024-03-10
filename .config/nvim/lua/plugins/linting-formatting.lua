return {
	{
		"elentok/format-on-save.nvim",
		config = function()
			local format_on_save = require("format-on-save")
			local formatters = require("format-on-save.formatters")

			format_on_save.setup({
				exclude_path_patterns = {
					"/node_modules/",
					".local/share/nvim/lazy",
				},
				formatter_by_ft = {
					css = formatters.lsp,
					html = formatters.lsp,
					java = formatters.lsp,
					-- javascript = formatters.lsp,
					json = formatters.lsp,
					lua = formatters.lsp,
					markdown = formatters.prettierd,
					openscad = formatters.lsp,
					-- python = formatters.black,
					rust = formatters.lsp,
					scad = formatters.lsp,
					scss = formatters.lsp,
					sh = formatters.shfmt,
					terraform = formatters.lsp,
					typescript = formatters.prettierd,
					typescriptreact = formatters.prettierd,
					yaml = formatters.lsp,
					-- solidity = formatters.lsp,

					-- Concatenate formatters
					python = {
						formatters.remove_trailing_whitespace,
						-- formatters.shell({ cmd = "tidy-imports" }),
						formatters.black,
						formatters.ruff,
					},

					-- Use a tempfile instead of stdin
					go = {
						-- formatters.shell({
						-- 	cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
						-- 	tempfile = function()
						-- 		return vim.fn.expand("%") .. '.formatter-temp'
						-- 	end
						-- }),
						formatters.shell({ cmd = { "gofmt" } }),
					},

					-- Add conditional formatter that only runs if a certain file exists
					-- in one of the parent directories.
					javascript = {
						formatters.if_file_exists({
							pattern = ".eslintrc.*",
							formatter = formatters.eslint_d_fix
						}),
						formatters.if_file_exists({
							pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
							formatter = formatters.prettierd,
						}),
					},

					solidity = {
						formatters.if_file_exists({
							pattern = ".eslintrc.*",
							formatter = formatters.eslint_d_fix
						}),
						formatters.if_file_exists({
							pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
							formatter = formatters.prettierd,
						}),
						formatters.lsp,
					},
				},

				-- Optional: fallback formatter to use when no formatters match the current filetype
				fallback_formatter = {
					formatters.remove_trailing_whitespace,
					formatters.remove_trailing_newlines,
					-- formatters.prettierd,
				},

				-- By default, all shell commands are prefixed with "sh -c" (see PR #3)
				-- To prevent that set `run_with_sh` to `false`.
				run_with_sh = false,
			})
		end
	},
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	config = function()
	-- 		local null_ls = require("null-ls")
	-- 		null_ls.setup({
	-- 			sources = {
	-- 				null_ls.builtins.formatting.stylua,
	-- 				null_ls.builtins.formatting.prettier,
	-- 				null_ls.builtins.diagnostics.eslint_d,
	-- 				null_ls.builtins.formatting.golines,
	-- 				null_ls.builtins.formatting.gofumpt,
	-- 				null_ls.builtins.formatting.goimports,
	-- 				-- null_ls.builtins.diagnostics.eslint,
	-- 				-- null_ls.builtins.completion.spell,
	-- 			},
	-- 		})
	-- 		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
	-- 	end,
	-- },
}

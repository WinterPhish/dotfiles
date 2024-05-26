return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					command = "/home/mmed/.nix-profile/bin/stylua",
				}),
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.zsh
			},
		})
		vim.keymap.set("n", "<leader>s", vim.lsp.buf.format, {})
	end,
}

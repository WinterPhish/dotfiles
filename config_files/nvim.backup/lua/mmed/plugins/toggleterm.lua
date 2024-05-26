return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup {
        start_in_insert = true,
        on_open = function()
          vim.cmd("startinsert")
        end,
      }
      vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", {});
      vim.keymap.set("t", "<C-Space>", [[<C-\><C-n>:ToggleTerm<CR>]], {});
      vim.keymap.set("t", "<C-n>", [[<C-\><C-n>]], {});
    end,
  },
}

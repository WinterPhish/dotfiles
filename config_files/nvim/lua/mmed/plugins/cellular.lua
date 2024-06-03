return {
  "Eandrju/cellular-automaton.nvim",
  config = function ()
    vim.keymap.set("n", "<leader>d", "<cmd>CellularAutomaton make_it_rain<CR>")
  end
}

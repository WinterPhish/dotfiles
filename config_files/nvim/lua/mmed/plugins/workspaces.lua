return {
  'natecraddock/workspaces.nvim',
  cmd = { 'WorkspacesAdd', 'WorkspacesOpen' },
  init = function()
    local workspaces = require("workspaces")
    vim.keymap.set('n', '<Leader>ww', function()
      return require('telescope').extensions.workspaces.workspaces()
    end)
    vim.keymap.set('n', '<leader>wa', function() workspaces.add() end, {})
    vim.keymap.set('n', '<leader>wr', function() workspaces.remove() end, {})
  end,
  config = function()
    require('workspaces').setup({
      path = vim.fs.normalize('~/.config/workspaces'),
      hooks = {
        open = function()
          vim.notify((' Switched to project: %s '):format(vim.fn.getcwd()))
          local local_nvimrc = vim.fn.getcwd() .. '/.nvimrc'
          if vim.secure.read(local_nvimrc) then
            vim.cmd.source(local_nvimrc)
          end
        end,
      },
    })
  end,
}

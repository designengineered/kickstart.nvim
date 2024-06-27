return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = { -- Example mapping to toggle outline
    { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
  },
  opts = {
    symbol_folding = {
      -- unfold entire tree by default with false, otherwise use integer to specify starting level starting with 1
      autofold_depth = false,
      -- autofold_depth = 1,
    },
  },
}

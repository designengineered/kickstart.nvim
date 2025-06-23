return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  -- Go Errors
  vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { noremap = true, desc = 'Go [E][E]rrors' }),
  {
    'wuelnerdotexe/vim-astro',
    astro_typescript = 'enable',
    astro_stylus = 'enable',
  },
  {
    'virchau13/tree-sitter-astro',
  },
  {
    'tversteeg/registers.nvim',
    cmd = 'Registers',
    config = true,
    keys = {
      { '"', mode = { 'n', 'v' } },
      { '<C-R>', mode = 'i' },
    },
    name = 'registers',
    vim.keymap.set('n', '<leader>rg', ':Registers', { noremap = true, desc = '[R]e[G]isters' }),
  },
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },
}

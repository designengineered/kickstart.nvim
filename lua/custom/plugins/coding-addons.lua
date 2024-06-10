return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'wuelnerdotexe/vim-astro',
    astro_typescript = 'enable',
    astro_stylus = 'enable',
  },
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-k>',
          clear_suggestion = '<C-x>',
          accept_word = '<C-j>',
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = '#ffffff',
          cterm = 244,
        },
        disable_inline_completion = false,
        disable_keymaps = false, -- disables built in keymaps for more manual control
      }
    end,
  },
}

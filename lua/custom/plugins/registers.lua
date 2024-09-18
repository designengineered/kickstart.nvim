return {
  {
    'nvim-lua/plenary.nvim',
    config = function()
      local function clear_registers()
        local registers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
        for register in registers:gmatch '.' do
          vim.fn.setreg(register, {})
        end
        print 'Registers Cleared'
      end

      -- command
      vim.keymap.set('n', '<leader>re', clear_registers, { noremap = true, silent = true })
    end,
  },
}

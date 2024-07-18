return {
  -- -- Set conceallevel for Markdown files

  -- Obsidian configuration
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'main',
          path = '~/Documents/cello-main/',
        },
      },
      new_notes_location = 'current_dir',
      templates = {
        folder = '~/Documents/cello-main/Templates/',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
        substitutions = {
          today = function()
            return os.date '%Y-%m-%d'
          end,
          tomorrow = function()
            return os.date('%Y-%m-%d', os.time() + 86400)
          end,
          yesterday = function()
            return os.date('%Y-%m-%d', os.time() - 86400)
          end,
          now = function()
            return os.date '%Y-%m-%d-%H:%M'
          end,
          time = function()
            return os.date '%H:%M'
          end,
          hour = function()
            return os.date('%H:%M', os.time() + 3600)
          end,
          half = function()
            return os.date('%H:%M', os.time() + 1800)
          end,
          block = function()
            return os.date('%H:%M', os.time() + (3600 * 1.5))
          end,
          hour_start = function()
            return os.date '%H:00'
          end,
          hour_end = function()
            return os.date('%H:00', os.time() + 3600)
          end,
          half_end = function()
            return os.date('%H:30', os.time() + 3600)
          end,
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'Dailies/',
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = '%Y-%m-%d',
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = '~/Documents/cello-main/Dailies/Daily-Template.md',
      },
      -- Where to put new notes. Valid options are
      -- * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.

      mappings = {
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- toggle checkboxes
        ['<leader>ch'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },

      -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log levels defined by "vim.log.levels.*".
      log_level = vim.log.levels.INFO,
      --Function Keymaps
      vim.keymap.set('n', '<leader>zn', vim.cmd.ObsidianSearch, { desc = 'Search or create new note' }),
      vim.keymap.set('v', '<leader>ze', vim.cmd.ObsidianExtractNote, { desc = 'Creates new note & links it to the Selected text' }),
      vim.keymap.set('n', '<leader>zt', vim.cmd.ObsidianTemplate, { desc = 'Apply template to current note' }),
      vim.keymap.set('n', '<leader>zd', vim.cmd.ObsidianToday, { desc = 'Creates new note for today or travel to today' }),
      vim.keymap.set('n', '<leader>zy', vim.cmd.ObsidianYesterday, { desc = 'Creates new note for yesterday or travel to yesterday' }),
      vim.keymap.set('n', '<leader>zm', vim.cmd.ObsidianTomorrow, { desc = 'Creates new note for tomorrow or travel to tomorrow' }),
      vim.keymap.set('v', '<leader>zl', vim.cmd.ObsidianLink, { desc = 'Links Selected text to a note' }),
      vim.keymap.set('n', '<leader>zb', vim.cmd.ObsidianBacklinks, { desc = 'Show backlinks for current note' }),
      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },
    },
  },
}

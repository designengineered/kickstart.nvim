return {
  -- -- Set conceallevel for Markdown files
  -- {
  --   vim.api.nvim_create_autocmd('FileType', {
  --     pattern = 'markdown',
  --     callback = function()
  --       vim.opt.conceallevel = 2
  --     end,
  --   }),
  -- },

  -- Obsidian configuration
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
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

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'main',
          path = '~/Documents/cello-main/',
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'Dailies',
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = '%m-%d-%Y',
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = 'Dailies/Daily-Template.md',
      },
      -- Where to put new notes. Valid options are
      -- * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = 'current_dir',

      -- -- Optional, customize how note file names are generated given the ID, target directory, and title.
      -- ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      -- ---@return string|obsidian.Path The full path to the new note.
      -- note_path_func = function(spec)
      --   -- This is equivalent to the default behavior.
      --   local path = spec.dir / tostring(spec.id)
      --   return path:with_suffix '.md'
      -- end,

      -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log levels defined by "vim.log.levels.*".
      log_level = vim.log.levels.INFO,
      --Function Keymaps
      vim.keymap.set('v', '<leader>n', vim.cmd.ObsidianExtractNote, { desc = 'Creates new note & links it to the Selected text' }),
      vim.keymap.set('v', '<leader>l', vim.cmd.ObsidianLink, { desc = 'Links Selected text to a note' }),
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

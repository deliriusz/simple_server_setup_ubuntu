-- file browser mappings: https://github.com/nvim-telescope/telescope-file-browser.nvim#mappings
local telescope = require("telescope")
local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.load_extension('live_grep_args')
telescope.load_extension('neoclip')
telescope.load_extension('possession')

telescope.setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
         ["<C-j>"] = actions.move_selection_next,
         ["<C-k>"] = actions.move_selection_previous,
         ["<C-Down>"] = actions.cycle_history_next,
         ["<C-Up>"] = actions.cycle_history_prev,
         ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob '*" }),
         ["<C-I>"] = lga_actions.quote_prompt({ postfix = " --iglob '!*" }),
         ["<C-o>"] = lga_actions.quote_prompt({ postfix = " -t" }), -- file type, not all languages are supported, you can add them in https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
         ["<C-O>"] = lga_actions.quote_prompt({ postfix = " -T" }), -- like type, but excludes
         ['<C-g>'] = function(prompt_bufnr)
           -- Use nvim-window-picker to choose the window by dynamically attaching a function
           local action_set = require('telescope.actions.set')
           local action_state = require('telescope.actions.state')

           local picker = action_state.get_current_picker(prompt_bufnr)
           picker.get_selection_window = function(picker, entry)
             local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
             -- Unbind after using so next instance of the picker acts normally
             picker.get_selection_window = nil
             return picked_window_id
           end

           return action_set.edit(prompt_bufnr, 'edit')
         end,
       }
     },
    wrap_results = true,
    sorting_strategy = 'ascending',
    -- dynamically set layout based on screen width
    layout_strategy = vim.o.columns > 120 and "horizontal" or "vertical",
    layout_config = {
          bottom_pane = {
            height = 25,
            preview_cutoff = 120,
            prompt_position = "top"
          },
          center = {
            height = 0.4,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.5
          },
          cursor = {
            height = 0.9,
            preview_cutoff = 40,
            width = 0.95
          },
          horizontal = {
            height = 0.9,
            preview_cutoff = 120,
            --preview_width = { 0.65, max = 400, min = 120 },
            preview_width = 0.65,
            prompt_position = "top",
            width = 0.95
          },
          vertical = {
            height = 0.95,
            preview_cutoff = 10,
            prompt_position = "bottom",
            width = 0.95
          }
        }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
   live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
    -- file_browser = {
    --   theme = "ivy",
    --   -- disables netrw and use telescope-file-browser in its place
    --   hijack_netrw = true,
    --   mappings = {
    --     ["i"] = {
    --       -- your custom insert mode mappings
    --     },
    --     ["n"] = {
    --       ["<C-j>"] = actions.move_selection_next,
    --       ["<C-k>"] = actions.move_selection_previous,
    --     },
    --   },
    -- },
  }
})

--require('telescope').load_extension('live_grep_args')

--require("telescope").load_extension "file_browser" -- plugin disabled, it breaks nvim-tree, then opening vim with a folder param

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      version = "^1.0.0",
    }
  },
  config = function ()
    local builtin = require('telescope.builtin')
    local live_grep_args = require('telescope').load_extension('live_grep_args')

    local function custom_live_grep_args()
      live_grep_args.live_grep_args({
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case"
        }
      })
    end

    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', custom_live_grep_args, {})
  end
}

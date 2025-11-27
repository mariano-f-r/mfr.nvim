-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'andweeb/presence.nvim' },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
      --
      toggler = {
        ---Line-comment toggle keymap
        line = '<leader>/l',
        ---Block-comment toggle keymap
        block = '<leader>/b',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<leader>/l',
        ---Block-comment keymap
        block = '<leader>/b',
      },
    },
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      vim.keymap.set('n', '<leader>bh', '<cmd>BufferPrevious<CR>', { desc = '[B]uffer Left [h]' })
      vim.keymap.set('n', '<leader>bl', '<cmd>BufferNext<CR>', { desc = '[B]uffer Right [l]' })
      vim.keymap.set('n', '<leader>bH', '<cmd>BufferMovePrevious<CR>', { desc = '[B]uffer Move Left [H]' })
      vim.keymap.set('n', '<leader>bn', '<cmd>BufferMoveNext<CR>', { desc = '[B]uffer Move Right [L]' })
      vim.keymap.set('n', '<leader>bp', '<cmd>BufferPin<CR>', { desc = '[B]uffer [P]in' })
      vim.keymap.set('n', '<leader>bc', '<cmd>BufferClose<CR>', { desc = '[B]uffer [C]lose' })
      vim.keymap.set('n', '<leader>bs', '<Cmd>BufferPick<CR>', { desc = '[B]uffer [S]elect' })
      vim.keymap.set('n', '<leader>bd', '<Cmd>BufferPickDelete<CR>', { desc = '[B]uffer Pick to [D]elete' })
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
      animation = false,
      auto_hide = 1,
      focus_on_close = 'previous',

      no_name_title = 'Untitled',
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'auto',
      extensions = { 'nvim-tree' },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'lsp_status', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  -- TODO: finish configuring this
  {
    'nvim-tree/nvim-tree.lua',
    opts = {

      hijack_cursor = true,
      view = {
        side = 'right',
      },
    },

    config = function(_, opts)
      vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = '[T]oggle [T]ree' })

      require('nvim-tree').setup(opts)
    end,
  },

  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {

        [[                             .+**=.                                                                 ]],
        [[                            -##%@@@*                                                                 ]],
        [[                            +@@@@%*=                                                                 ]],
        [[                            =#.-  -:                                                                 ]],
        [[                         =:--=.- =.                                                                 ]],
        [[                       *@@@+  +*.                                                                    ]],
        [[                      *@*. -:-.-*                                                                    ]],
        [[                    =@#+   = :.#*#*-:.                                                               ]],
        [[                  .#@%- =-=.   =:-#-+=-.-                                   .=--:..-:.::=.          ]],
        [[                  #@# -::- :. =-.-@***++.=.                              .+%%%#%%+.  #@#:.*         ]],
        [[                  :@*.+  + :-:=-*%@*  :#%*-.                   .--:  :=*+-           .%%#. +        ]],
        [[                  .@+ -  -*  ..-+%@@ #*#%%#:.                 :-+=  ..                :+*- -=       ]],
        [[                  .@=.=   :@@@@@@# :@+%+== .-               -%#.##                          +-      ]],
        [[                  .*+-:   -#@@+@@-:%-%*+:.  -=.      .=*#+=++=*%+-                          .%.     ]],
        [[                  ::..:  -:@@@@@@:%=#*=-    .:::        .-%#@%=.                             #:     ]],
        [[                  :++    + @@@@@@@++%+-      :.-         .#*@=-%                             #.     ]],
        [[                        .* +@@@@@@:%#-.      - =        .%-=                                -=      ]],
        [[                     =@@  =:=@*@@@@#@%---.  -- :=      :-@-                                .:       ]],
        [[                  .#@@@-    =@@@@@*=-+-   .:-.  *      -#%%:        .::.                    :.      ]],
        [[                 .@@@@* .  =*#@#@@*# -:     :@@+=.      +@@@%-=*=.     :%                   -.      ]],
        [[               :#@@@@+   .#+:%@@@@#@%-       .%@:-                      %=           .      -.      ]],
        [[             =@@@@@+  - :@- +#@=@@-.          .- -                     .%#    *=    =%#-    -.      ]],
        [[          .+@%@@@@+=.+ *@*+ .+@*%%.             ==                     =@%.  -..+%+#***@@=  ==      ]],
        [[         *=#@@@@@@   -@@@.   =%#%@-                                    .@# -.:   :.: .*@@@#. ==     ]],
        [[       =-==*-#@@@-  :@@*     --:*.-                                    :@=:-%-       :@@@#.-= -+    ]],
        [[   :. .:.#==@@@@+ .@#          =  ..                                  :%#= .-         :@@*    #..*. ]],
        [[ .:. . ::-=#@@@+: *-           :: :.                                  :*:+  =          %@@:   .=:**.]],
        [[      .:++***=*-.=.::          @+ .#                                 :-++%: #--.       #@@@     ..  ]],
        [[              :@*:-.           .:.:--+=                                 :*-.-          :%%**        ]],
        [[               .=*+.            ::.....:                                %*=:#            :::        ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button('SPC n', '[N]ew Buffer'),
        dashboard.button('SPC f f', '[F]ind [F]ile'),
        dashboard.button('SPC f g', '[F]ind with [G]rep'),
        dashboard.button('SPC s l', '[S]ession [L]oad'),
        dashboard.button('q', 'Quit NeoVim', ':q<CR>'),
      }

      dashboard.section.footer.val = function()
        local stats = require('lazy').stats()
        return 'Lazy Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. stats.startuptime .. ' ms'
      end

      dashboard.config.opts.noautocmd = true

      alpha.setup(dashboard.config)
    end,
  },

  {
    'stevearc/resession.nvim',
    opts = {},
    config = function()
      local resession = require("resession")
      resession.setup({})
      -- broken
      vim.keymap.set('n', '<leader>ss', resession.save, { desc = '[S]ession [S]ave' })

      -- working
      vim.keymap.set('n', '<leader>sl', resession.load, { desc = '[S]ession [L]oad' })
      vim.keymap.set('n', '<leader>sd', resession.delete, { desc = '[S]ession [D]elete' })

      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          -- Always save a special session named "last"
          resession.save("last")
        end,
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

local leet_arg = "lc"
-- local utils = require "astronvim.utils"

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "    ██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗     ",
        "    ██║  ██║██╔══██╗████╗  ██║██║ ██╔╝     ",
        "    ███████║███████║██╔██╗ ██║█████╔╝      ",
        "    ██╔══██║██╔══██║██║╚██╗██║██╔═██╗      ",
        "    ██║  ██║██║  ██║██║ ╚████║██║  ██╗     ",
        "    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝     ",
        "                                           ",
        "██╗  ██╗ ██████╗  ██████╗  █████╗ ███╗   ██╗",
        "██║  ██║██╔═══██╗██╔════╝ ██╔══██╗████╗  ██║",
        "███████║██║   ██║██║  ███╗███████║██╔██╗ ██║",
        "██╔══██║██║   ██║██║   ██║██╔══██║██║╚██╗██║",
        "██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║ ╚████║",
        "╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      insert_at_start = false,
      -- …etc.
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    event = "BufReadPost",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- local colors = require("catppuccin.palettes").get_palette "mocha"
      -- colors.none = "NONE"
      require("catppuccin").setup {
        transparent_background = false,
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = { "bold" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          flash = true,
          noice = true,
          neotree = true,
          treesitter = true,
          notify = true,
          mason = true,
          which_key = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
          dropbar = {
            enabled = true,
            color_mode = false,
          },
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          dap = true,
          barbar = true,
          aerial = true,
          headlines = true,
        },
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true, -- TODO: copilot-cmp
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true, -- TODO: copilot-cmp
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-;>",
            accept_word = false,
            accept_line = "<M-'>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        -- filetypes = {
        --   yaml = true,
        --   markdown = true,
        --   help = false,
        --   gitcommit = true,
        --   gitrebase = false,
        --   hgcommit = false,
        --   svn = false,
        --   cvs = false,
        --   ["."] = false,
        -- },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      }
    end,
  },
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    ft = {
      "cpp",
      "c",
      "rust",
    },
    event = "VeryLazy",
    config = function()
      require("competitest").setup {
        runner_ui = {
          interface = "split",
        },
        compile_command = {
          cpp = { exec = "clang++", args = { "-std=c++2b", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
        run_command = {
          cpp = { exec = "./$(FNOEXT)" },
        },
      }
    end,
  },
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- ft = {
    --   "swift",
    --   -- "objcpp",
    --   -- "objc",
    -- },
    event = "BufEnter *.swift",
    config = function()
      require("astronvim.utils.lsp").setup "sourcekit"
      require("xcodebuild").setup()
      vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
      vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
      vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
      vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
      vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
      vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
      vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
      vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = leet_arg ~= vim.fn.argv()[1],
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      arg = "lc",
      lang = "rust",
      logging = true,
      cn = {
        enabled = true,
        translate = true,
        translate_problems = true,
      },
    },
  },
}

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

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
  { "rcarriga/nvim-notify", enabled = false },
  { "luc-tielen/telescope_hoogle" },

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
          lsp_saga = true,
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
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
      "stevearc/oil.nvim", -- (optional) to manage project files
      "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
    },
    -- ft = {
    --   "swift",
    --   -- "objcpp",
    --   -- "objc",
    -- },
    event = "BufEnter *.swift",
    config = function()
      local uv = vim.loop
      -- Function to check if a directory exists
      local function directory_exists(path)
        local stat = uv.fs_stat(path)
        return stat and stat.type == "directory"
      end

      -- Function to check for .xcodeproj or .xcworkspace directories in the current working directory
      local function has_xcode_files()
        local current_dir = uv.cwd()
        local dir = uv.fs_opendir(current_dir, nil, 100)
        if dir then
          while true do
            local entries = uv.fs_readdir(dir)
            if not entries then break end
            for _, entry in ipairs(entries) do
              if
                (entry.name:match "%.xcodeproj$" or entry.name:match "%.xcworkspace$") and entry.type == "directory"
              then
                uv.fs_closedir(dir)
                return true
              end
            end
          end
          uv.fs_closedir(dir)
        end
        return false
      end

      if not has_xcode_files() then return end
      require("xcodebuild").setup()
      vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
      vim.keymap.set("n", "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })

      vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
      vim.keymap.set("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
      vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })

      vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
      vim.keymap.set("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
      vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class" })
      vim.keymap.set("n", "<leader>x.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run" })

      vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
      vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
      vim.keymap.set(
        "n",
        "<leader>xC",
        "<cmd>XcodebuildShowCodeCoverageReport<cr>",
        { desc = "Show Code Coverage Report" }
      )
      vim.keymap.set("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
      vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })

      vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
      vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

      vim.keymap.set("n", "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
      vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })
    end,
  },
}

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

-- set vim options here (vim.<first_key>.<second_key> = value)
local neovide_transparency = 0.75
local neovide_transparency_point = 0.75
local alpha = function() return string.format("%x", math.floor((255 * neovide_transparency_point) or 0.8)) end
local neovide_background_color = "#1E1E2D" .. alpha()

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        termguicolors = true,
        scrolloff = 5,
        sidescrolloff = 5,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapLeader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file

        -- neovide
        neovide_input_macos_option_key_is_meta = "both",
        neovide_cursor_vfx_mode = "pixiedust",
        neovide_refresh_rate = 120,
        neovide_refresh_rate_idle = 120,
        neovide_floating_shadow = true,
        neovide_floating_z_height = 10,
        neovide_light_angle_degrees = 45,
        neovide_light_radius = 5,

        neovide_transparency = neovide_transparency,
        neovide_transparency_point = neovide_transparency_point,
        neovide_background_color = neovide_background_color,
        neovide_window_blurred = true,

        winblend = 50,
        pumblend = 50,

        neovide_floating_blur_amount_x = 2.0,
        neovide_floating_blur_amount_y = 2.0,
      },
      o = {
        guifont = "Recursive:h16",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },
        ["<Leader>a"] = { name = " Copilot" },
        ["<Leader>ae"] = { ":Copilot enable<CR>" },
        ["<Leader>ad"] = { ":Copilot disable<CR>" },
        ["<Leader>ap"] = { ":Copilot panel<CR>" },
        ["<Leader>as"] = { ":Copilot suggestion<CR>" },
        ["<Leader>ac"] = { ":ChatGPT<CR>" },
        ["<Leader>art"] = { ":ChatGPTRun add_tests<CR>" },
        ["<Leader>aro"] = { ":ChatGPTRun optimize_code<CR>" },
        ["<Leader>ars"] = { ":ChatGPTRun summarize<CR>" },
        ["<Leader>are"] = { ":ChatGPTRun explain_code<CR>" },
        ["<Leader>arf"] = { ":ChatGPTRun fix_bugs<CR>" },
        ["<Leader>ard"] = { ":ChatGPTRun docstring<CR>" },
        -- CompetiTest bindings
        ["<Leader>r"] = { name = " CompetiTest" },
        ["<Leader>rr"] = { ":CompetiTest run<CR>" },
        ["<Leader>rR"] = { ":CompetiTest run_no_compile<CR>" },
        ["<Leader>ra"] = { ":CompetiTest add_testcase<CR>" },
        ["<Leader>re"] = { ":CompetiTest edit_testcase<CR>" },
        -- barbar
        ["]b"] = { "<Cmd>BufferNext<CR>" },
        ["[b"] = { "<Cmd>BufferPrevious<CR>" },
        ["<Leader>c"] = { "<Cmd>BufferClose<CR>" },
        ["<Leader>bp"] = { "<Cmd>BufferPick<CR>" },
        -- luasnip
        ["<M-j>"] = { ":lua require('luasnip').jump(1)<CR>" },
        ["<M-k>"] = { ":lua require('luasnip').jump(-1)<CR>" },
        -- my quirks
        ["J"] = { "5j" },
        -- ["K"] = { "5k" },
        ["H"] = { "5h" },
        ["L"] = { "5l" },
        [";"] = { ":" },
        -- zen_mode
        ["<Leader>uz"] = { "<Cmd>ZenMode<CR>" },
        -- neovide settings
        ["<C-N>"] = { ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>" },
        -- open dashboard when no more buffers

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<Leader>ts"] = {
          function() require("haskell-tools").repl.toggle() end,
          desc = "Run ghci",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      v = {
        ["J"] = { "5j" },
        ["K"] = { "5k" },
        ["H"] = { "5h" },
        ["L"] = { "5l" },
      },
    },
  },
}

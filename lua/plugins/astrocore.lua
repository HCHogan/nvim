-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

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
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapLeader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
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
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        -- CompetiTest bindings
        ["<Leader>r"] = { name = " CompetiTest" },
        ["<Leader>rr"] = { ":CompetiTest run<CR>" },
        ["<Leader>rR"] = { ":CompetiTest run_no_compile<CR>" },
        ["<Leader>ra"] = { ":CompetiTest add_testcase<CR>" },
        ["<Leader>re"] = { ":CompetiTest edit_testcase<CR>" },
        -- java
        -- ["gd"] = { ":lua vim.lsp.buf.definition()<CR>"},
        -- ["gD"] = { ":lua vim.lsp.buf.declaration()<CR>"},
        -- ["gi"] = {":lua vim.lsp.buf.implementation()<CR>"},
        -- ["gr"] = {":lua vim.lsp.buf.references()<CR>"},
        -- barbar
        ["]b"] = { ":BufferNext<CR>" },
        ["[b"] = { ":BufferPrevious<CR>" },
        ["<Leader>bp"] = { ":BufferPick<CR>" },
        -- luasnip
        ["<M-j>"] = { ":lua require('luasnip').jump(1)<CR>" },
        ["<M-k>"] = { ":lua require('luasnip').jump(-1)<CR>" },
        -- my quirks
        ["J"] = { "5j" },
        -- ["K"] = { "5k" },
        ["H"] = { "5h" },
        ["L"] = { "5l" },
        [";"] = { ":" },
        -- ["<F5>"] = { ":let b:caret=winsaveview() <CR> | :%SnipRun <CR>| :call winrestview(b:caret) <CR>" },
        -- zen_mode
        ["<Leader>uz"] = { "<cmd>ZenMode<CR>" },
        -- inlay_hints
        -- ["<Leader>i"] = { name = "󱠁 Inlay Hints" },
        -- ["<Leader>ie"] = { "<cmd>lua vim.lsp.inlay_hint(0, true)<CR>" },
        -- ["<Leader>id"] = { "<cmd>lua vim.lsp.inlay_hint(0, false)<CR>" },
        -- neovide settings
        ["<C-N>"] = { ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>" },
        -- open dashboard when no more buffers
        -- ["<Leader>c"] = {
        --   function()
        --     local bufs = vim.fn.getbufinfo { buflisted = true }
        --     require("astronvim.utils.buffer").close(0)
        --     if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
        --   end,
        --   desc = "Close buffer",
        -- },

        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
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

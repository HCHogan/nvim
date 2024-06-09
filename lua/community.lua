-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  -- { import = "astrocommunity.pack.typescript-all-in-one" },
  -- { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.kotlin" },
  -- { import = "astrocommunity.pack.swift" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  -- { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  -- { import = "astrocommunity.register.nvim-neoclip-lua" },
  -- { import = "astrocommunity.media.drop-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  -- { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.markmap-nvim" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  -- { import = "astrocommunity.workflow.bad-practices-nvim"},
  -- { import = "astrocommunity.code-runner.sniprun" },
  -- { import = "astrocommunity.code-runner.overseer-nvim"},
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}

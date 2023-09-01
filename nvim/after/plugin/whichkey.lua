local wk = require("which-key")

wk.register({
  -- undo
  ["<leader>u"] = {"<cmd>UndotreeToggle<cr>", "Undo Tree"},

  -- project
  ["<leader>p"] = { name = "+project" },
  ["<leader>pv"] = {"<cmd>Ex<cr>", "Project View"},
  ["<leader>pf"] = {"<cmd>Telescope find_files<cr>", "Find File"},
  ["<leader>ps"] = {"<cmd>Telescope grep_string<cr>", "Search Files"},

  -- git
  ["<leader>g"] = { name = "+git" },
  ["<leader>gs"] = {"<cmd>Telescope git_status<cr>", "Status"},

  -- lsp (diagnostics)
  ["<leader>e"] = { name = "+lsp" },
  ["<leader>ef"] = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Quick fix"},
  ["<leader>el"] = {"<cmd>lua vim.diagnostic.open_float()<cr>", "List"},
  ["<leader>ep"] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous"},
  ["<leader>en"] = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "Next"},

  -- lsp (definitions)
  ["<leader>g"] = { name = "+goto"},
  ["<leader>gd"] = {"<cmd>lua vim.lsp.buf.definition()<cr>", "definition"},
  ["<leader>gD"] = {"<cmd>lua vim.lsp.buf.declaraion()<cr>", "declaration"},
  ["<leader>gi"] = {"<cmd>lua vim.lsp.buf.implementaion()<cr>", "implementation"},
  ["<leader>gt"] = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "type_definition"},
  ["<leader>gr"] = {"<cmd>lua vim.lsp.buf.references()<cr>", "references"},

})


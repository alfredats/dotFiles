local wk = require("which-key")

wk.add(
  {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "" },

    { "<leader>g",  group = "goto" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "git status" },
    { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "declaration" },
    { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>",   desc = "definition" },
    { "<leader>gi", "<cmd>lua vim.lsp.buf.implementaion()<cr>",   desc = "implementation" },
    { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>",   desc = "references" },
    { "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "type def" },

    { "<leader>l",  group = "lsp" },
    { "<leader>lel", "<cmd>lua vim.diagnostic.open_float()<cr>",  desc = "list errors" },
    { "<leader>lef", "<cmd>lua vim.lsp.buf.code_action()<cr>",  desc = "quick-fix" },
    { "<leader>len", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "next error" },
    { "<leader>lep", "<cmd>lua vim.diagnostic.goto_prev()<cr>",  desc = "prev error" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000})<cr>", desc = "format buffer" },

    { "<leader>p", group = "project" },
    { "<leader>ps", "<cmd>Telescope grep_string<cr>",   desc = "search" },
    { "<leader>pv", "<cmd>Ex<cr>",   desc = "view" },
    { "<leader>pf", "<cmd>Telescope find_files<cr>",   desc = "find file" },
  }
)


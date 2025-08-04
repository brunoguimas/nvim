return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          markdown = true,
          help = true,
          rust = true,
          lua = true,
          ["*"] = true,
        },
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      show_help = "yes",
      prompts = {
        Explain = "Explain this code",
        Fix = "Fix this code",
        Tests = "Write tests for this code",
        Docs = "Add documentation to this code",
      },
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<CR>", desc = "Open Copilot Chat" },
      { "<leader>ce", ":CopilotChatExplain<CR>", desc = "Explain code" },
      { "<leader>cf", ":CopilotChatFix<CR>", desc = "Fix code" },
      { "<leader>ct", ":CopilotChatTests<CR>", desc = "Generate tests" },
      { "<leader>cd", ":CopilotChatDocs<CR>", desc = "Create documentation" },
    },
  },
}


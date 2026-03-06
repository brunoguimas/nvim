return {
    "mason-org/mason-lspconfig.nvim",

    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            "rust-analyzer",
            "tsserver",
            "stylua",
            "codelldb",
            "clangd",
            "bashls",
            "pylsp",
            "docker",
            "gopls",
            "postgres_lsp",
        },
    },

    config = function()
        require("mason-lspconfig").setup({
            automatic_enable = {
                "rust-analyzer",
                "tsserver",
                "stylua",
                "codelldb",
                "clandg",
                "bashls",
                "pylsp",
                "docker",
                "gopls",
                "postgres_lsp",
            },
        })
    end,
}

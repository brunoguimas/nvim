return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()
    end,
}

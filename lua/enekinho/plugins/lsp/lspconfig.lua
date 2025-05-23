return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local protocol = require("vim.lsp.protocol")

    local disable_formatting_for = {
      tsserver = true,
      eslint = true,
      jsonls = true,
      html = true,
      cssls = true,
      tailwindcss = true,
    }

    local on_attach = function(client, bufnr)
      -- print("LSP started." .. client.name)
      -- format on save
      if disable_formatting_for[client.name] then
        -- print("Disabling formatting for " .. client.name)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            -- print("Being formatted by " .. client.name)
            vim.lsp.buf.format()
          end,
        })
      end
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mason_lspconfig.setup_handlers({
      function(server)
        nvim_lsp[server].setup({
          capabilities = capabilities,
        })
      end,
      ["ts_ls"] = function()
        nvim_lsp["ts_ls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["cssls"] = function()
        nvim_lsp["cssls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["tailwindcss"] = function()
        nvim_lsp["tailwindcss"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["html"] = function()
        nvim_lsp["html"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["jsonls"] = function()
        nvim_lsp["jsonls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      --	["eslint"] = function()
      --		nvim_lsp["eslint"].setup({
      --			on_attach = on_attach,
      --			capabilities = capabilities,
      --		})
      --	end,
      ["pyright"] = function()
        nvim_lsp["pyright"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["gopls"] = function()
        nvim_lsp["gopls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["golangci_lint_ls"] = function()
        nvim_lsp["golangci_lint_ls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["eslint"] = function()
        nvim_lsp["eslint"].setup({
          on_attach = function(client)
            -- if client.resolved_capabilities then
              client.server_capabilities.documentFormattingProvider = true
              -- client.resolved_capabilities.document_formatting = true
            -- end
          end,
          capabilities = capabilities
        })
      end
    })
  end,
}

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  "andweeb/presence.nvim",
  'wakatime/vim-wakatime',
  {
    "scalameta/nvim-metals",
    dependencies = "nvim-lua/plenary.nvim",
    init = function()
      vim.env.PATH = vim.env.PATH
        .. ":"
        .. vim.fn.expand("$HOME/.cache/nvim/nvim-metals")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(
            require("astronvim.utils.lsp").config("metals")
          )
        end,
        group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
      })
    end,
  },

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}

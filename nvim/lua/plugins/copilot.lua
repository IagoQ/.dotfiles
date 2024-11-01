return {
  --   {
  --     "zbirenbaum/copilot.lua",
  --     dependencies = {
  --       "hrsh7th/nvim-cmp",
  --     },
  --     cmd = "Copilot",
  --     build = ":Copilot auth",
  --     event = "InsertEnter",
  --     config = function()
  --       require("copilot").setup({
  --         panel = {
  --           enabled = true,
  --           auto_refresh = false,
  --           keymap = {
  --             jump_prev = "<C-p>",
  --             jump_next = "<C-n>",
  --             accept = "<C-k>",
  --             refresh = "gr",
  --             -- open = false
  --           },
  --           layout = {
  --             position = "bottom", -- | top | left | right
  --             ratio = 0.4
  --           },
  --         },
  --         suggestion = {
  --           enabled = true,
  --           auto_trigger = false,
  --           debounce = 50,
  --           keymap = {
  --             accept = "<C-k>",
  --             accept_word = false,
  --             accept_line = false,
  --             next = "<C-n>",
  --             prev = "<C-p>",
  --             dismiss = "<C-e>",
  --           },
  --         },
  --       })
  --
  --       function open_panel()
  --         require("copilot.panel").open({ "bottom", 0.4 })
  --       end
  --
  --       vim.keymap.set("n", "<leader>cp", open_panel)
  --
  --       -- hide copilot suggestions when cmp menu is open
  --       -- to prevent odd behavior/garbled up suggestions
  --       -- local cmp_status_ok, cmp = pcall(require, "cmp")
  --       -- if cmp_status_ok then
  --       --   cmp.event:on("menu_opened", function()
  --       --     vim.b.copilot_suggestion_hidden = true
  --       --   end)
  --       --
  --       --   cmp.event:on("menu_closed", function()
  --       --     vim.b.copilot_suggestion_hidden = false
  --       --   end)
  --       -- end
  --     end,
  --   },
  --   {
  --     "zbirenbaum/copilot-cmp",
  --     config = function()
  --       require("copilot_cmp").setup()
  --     end,
  --   },
  --
  --
  --
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",              -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "anthropic",
          },
          inline = {
            adapter = "anthropic",
          },
          agent = {
            adapter = "anthropic",
          },
        },
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              schema = {
                model = {
                  default = "gemini-1.5-pro",
                  -- default = "gemini-1.5-flash",
                },
              },
            })
          end,
        },
      })

      vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>ac", "<cmd>CodeCompanionChat<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<leader>ac", "<cmd>CodeCompanionChat<cr>", { noremap = true, silent = true })

      -- Expand 'cc' into 'CodeCompanion' in the command line
      vim.cmd([[cab cc CodeCompanion]])
    end
  }
}

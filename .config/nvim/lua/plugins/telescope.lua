return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    -- change a keymap
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fw",
      "<cmd>Telescope live_grep<cr>",
      desc = "Live grep",
    },
    {
      "<leader>fs",
      --"<cmd>Telescope lsp_document_symbols<cr>",
      "<cmd>Telescope treesitter<cr>",
      desc = "Find Doc Symbols",
    },
  },
}

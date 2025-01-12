return {
  "ibhagwan/fzf-lua",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    -- change a keymap
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fw",
      "<cmd>FzfLua live_grep<cr>",
      desc = "Live grep",
    },
    {
      "<leader>fs",
      --"<cmd>Telescope lsp_document_symbols<cr>",
      "<cmd>FzfLua lsp_document_symbols<cr>",
      desc = "Find Doc Symbols",
    },
  },
}

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    init = function()
      -- load clangd extensions when clangd attaches
      local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        desc = "Load clangd_extensions with clangd",
        callback = function(args)
          if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
            require "clangd_extensions"
            -- add more `clangd` setup here as needed such as loading autocmds
            vim.api.nvim_del_augroup_by_id(augroup) -- delete auto command since it only needs to happen once
          end
        end,
      })
    end,
  },
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.terminal-integration.flatten-nvim" },
    { import = "astrocommunity.motion.flash-nvim" },
    { import = "astrocommunity.motion.marks-nvim" },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)      -- override the options using lazy.nvim
      opts.section.header.val = { -- change the header section value
        " ██████  ██     ██ ███████ ███    ██ ███████     ███    ██ ███████  ██████  ██    ██ ██ ███    ███      ██████  ██████  ███    ██ ███████ ██  ██████  ",
        "██    ██ ██     ██ ██      ████   ██ ██          ████   ██ ██      ██    ██ ██    ██ ██ ████  ████     ██      ██    ██ ████   ██ ██      ██ ██       ",
        "██    ██ ██  █  ██ █████   ██ ██  ██ ███████     ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██     ██      ██    ██ ██ ██  ██ █████   ██ ██   ███ ",
        "██    ██ ██ ███ ██ ██      ██  ██ ██      ██     ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██     ██      ██    ██ ██  ██ ██ ██      ██ ██    ██ ",
        " ██████   ███ ███  ███████ ██   ████ ███████     ██   ████ ███████  ██████    ████   ██ ██      ██      ██████  ██████  ██   ████ ██      ██  ██████  ",
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        cppdbg = function(source_name)
          local dap = require "dap"

          dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = vim.fn.exepath "OpenDebugAD7",
          }
          dap.configurations.cpp = {
            {
              type = "cppdbg",
              request = "launch",
              name = "Launch Firmware",
              MIMode = "gdb",
              miDebuggerServerAddress = "localhost:61234",
              miDebuggerPath = "/usr/bin/gdb-multiarch",
              cwd = "${workspaceFolder}",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/f_build/", "file")
              end,
            },
            {
              name = "Attach to gdbserver :1234",
              type = "cppdbg",
              request = "launch",
              MIMode = "gdb",
              miDebuggerServerAddress = function() return vim.fn.input "Address" .. ":1234" end,
              miDebuggerPath = "/usr/bin/gdb-multiarch",
              cwd = "${workspaceFolder}",
              program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
            },
          }
        end,
      },
    },
  },
}

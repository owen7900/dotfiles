local config = {
  options = {
    opt = {
      tabstop = 3,
      shiftwidth = 3,
    },
  },

  plugins = {
    init = {
      ["Darazaki/indent-o-matic"] = nil,
      {
        "mfussenegger/nvim-dap",
        module = "dap",
        config = require "user.plugins.nvim-dap",
      },
      {
        "rcarriga/nvim-dap-ui",
        after = "nvim-dap",
        config = require "user.plugins.nvim-dapui",
      }
    }
    ["which-key"] = {
      register_mappings = {
        n = {
          ["<leader>"] = {
            f = {
              d = {
                name = "Dap",
                c = {
                  function()
                    require("telescope").extensions.dap.commands {}
                  end,
                  "Commands",
                },
                C = {
                  function()
                    require("telescope").extensions.dap.configurations {}
                  end,
                "Configurations",
                },
              b = {
                function()
                  require("telescope").extensions.dap.list_breakpoints {}
                end,
                "Breakpoints",
              },
              v = {
                function()
                  require("telescope").extensions.dap.variables {}
                end,
                "Variables",
              },
              f = {
                function()
                  require("telescope").extensions.dap.frames {}
                end,
                "Frames",
              },
            }
          },
          x = {
            name = "Debugger",
            b = {
              function()
                require("dap").toggle_breakpoint()
              end,
              "Toggle Breakpoint",
            },
            B = {
              function()
                require("dap").clear_breakpoints()
              end,
              "Clear Breakpoints",
            },
            c = {
              function()
                require("dap").continue()
              end,
              "Continue",
            },
            i = {
              function()
                require("dap").step_into()
              end,
              "Step Into",
            },
            o = {
              function()
                require("dap").step_over()
              end,
              "Step Over",
            },
            q = {
              function()
                require("dap").close()
              end,
              "Close Session",
            },
            Q = {
              function()
                require("dap").terminate()
              end,
             "Terminate",
            },
            r = {
              function()
                require("dap").repl.toggle()
              end,
              "REPL",
            },
            s = {
             function()
                require("dapui").float_element "scopes"
              end,
              "Scopes",
            },
            t = {
              function()
                require("dapui").float_element "stacks"
              end,
              "Threads",
            },
            u = {
              function()
                require("dapui").toggle()
              end,
              "Toggle Debugger UI",
            },
            w = {
              function()
                require("dapui").float_element "watches"
              end,
              "Watches",
            },
            x = {
              function()
                require("dap.ui.widgets").hover()
              end,
              "Inspect",
            },
            v = { ":DapVirtualTextToggle<cr>", "Virtual Text" },
          },
        }
      }
    }
  },

  polish = function()
    local set = vim.opt

    set.tabstop = 3
    set.shiftwidth = 3
    set.expandtab = true
    set.smarttab = true
  end,
}

return config

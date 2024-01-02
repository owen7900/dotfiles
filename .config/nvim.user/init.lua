return {
	plugins = {
		{
			"AstroNvim/astrocommunity",
			{ import = "astrocommunity.debugging.nvim-dap-virtual-text" },
			{ import = "astrocommunity.lsp.lsp-signature-nvim" },
			{ import = "astrocommunity.terminal-integration.flatten-nvim" },
		},
		{
			"goolord/alpha-nvim",
			opts = function(_, opts) -- override the options using lazy.nvim
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
						local dap = require("dap")

						dap.adapters.cppdbg = {
							id = "cppdbg",
							type = "executable",
							command = vim.fn.exepath("OpenDebugAD7"),
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
									return vim.fn.input(
										"Path to executable: ",
										vim.fn.getcwd() .. "/build/f_build/",
										"file"
									)
								end,
							},
							{
								name = "Attach to gdbserver :1234",
								type = "cppdbg",
								request = "launch",
								MIMode = "gdb",
								miDebuggerServerAddress = function()
									return vim.fn.input("Address") .. ":1234"
								end,
								miDebuggerPath = "/usr/bin/gdb-multiarch",
								cwd = "${workspaceFolder}",
								program = function()
									return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
								end,
							},
						}
					end,
				},
			},
		},
	},
	-- icons = {
	-- 	MacroRecording = "",
	-- 	ActiveLSP = "",
	-- 	ActiveTS = "綠",
	-- 	BufferClose = "",
	-- 	NeovimClose = "",
	-- 	DefaultFile = "",
	-- 	Diagnostic = "裂",
	-- 	DiagnosticError = "",
	-- 	DiagnosticHint = "",
	-- 	DiagnosticInfo = "",
	-- 	DiagnosticWarn = "",
	-- 	Ellipsis = "…",
	-- 	FileModified = "",
	-- 	FileReadOnly = "",
	-- 	FolderClosed = "",
	-- 	FolderEmpty = "",
	-- 	FolderOpen = "",
	-- 	Git = "",
	-- 	GitAdd = "",
	-- 	GitBranch = "",
	-- 	GitChange = "",
	-- 	GitConflict = "",
	-- 	GitDelete = "",
	-- 	GitIgnored = "◌",
	-- 	GitRenamed = "➜",
	-- 	GitStaged = "✓",
	-- 	GitUnstaged = "✗",
	-- 	GitUntracked = "★",
	-- 	LSPLoaded = "",
	-- 	LSPLoading1 = "",
	-- 	LSPLoading2 = "",
	-- 	LSPLoading3 = "",
	-- },
}

--[[
                  _ _       _     _
  ___ ___  _ __  (_) | ___ | |_  | |_   _  __ _
 / __/ _ \| '_ \ | | |/ _ \| __| | | | | |/ _` |
| (_| (_) | |_) || | | (_) | |_ _| | |_| | (_| |
 \___\___/| .__/ |_|_|\___/ \__(_)_|\__,_|\__,_|
          |_|
--]]

return {
	{ 'github/copilot.vim' },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
		},
	},
}

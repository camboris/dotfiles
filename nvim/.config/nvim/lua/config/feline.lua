local palette = require("nightfox.palette").load("duskfox")
local gps = require("nvim-gps")
local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")
local feline = require("feline")

-- "┃", "█", "", "", "", "", "", "", "●"

local separators = {
	right = {
		arrow = "",
		slant = "",
    straight = "┃",
	},
}

local force_inactive = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}

local colors = {
	bg = palette.bg1.base,
	black = palette.black.base,
	yellow = palette.yellow.base,
	cyan = palette.cyan.base,
	oceanblue = palette.blue.base,
	green = palette.green.base,
	orange = palette.orange.base,
	violet = "#d3869b",
	magenta = palette.magenta.base,
	white = palette.white.base,
	fg = palette.white.base,
	skyblue = palette.blue.dim,
	red = palette.red.base,
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "red",
	CONFIRM = "red",
	VISUAL = "skyblue",
	LINES = "skyblue",
	BLOCK = "skyblue",
	REPLACE = "violet",
	["V-REPLACE"] = "violet",
	ENTER = "cyan",
	MORE = "cyan",
	SELECT = "orange",
	COMMAND = "green",
	SHELL = "green",
	TERM = "green",
	NONE = "yellow",
}

local buffer_not_empty = function()
	if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
		return true
	end
	return false
end

local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end

force_inactive.filetypes = {
	"NvimTree",
	"dbui",
	"packer",
	"startify",
	"fugitive",
	"fugitiveblame",
}

force_inactive.buftypes = {
	"terminal",
}

vi_mode = {
	provider = function()
		return " " .. vi_mode_utils.get_vim_mode() .. " "
	end,
	hl = function()
		local val = {
			name = vi_mode_utils.get_mode_highlight_name(),
			bg = vi_mode_utils.get_mode_color(),
			fg = colors.black,
		}
		return val
	end,
	right_sep = separators.right.slant,
}

filename = {
	provider = "file_info",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	left_sep = {
		str = " ",
		hl = {
			fg = "white",
			bg = "bg",
			style = "bold",
		},
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "white",
			bg = "bg",
			style = "bold",
		},
	},
}

-- MID

-- gitBranch
git_branch = {
	provider = "git_branch",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
}

git_diff_added = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		bg = "bg",
		style = "bold",
	},
}

git_diff_changed = {
	provider = "git_diff_changed",
	hl = {
		fg = "orange",
		bg = "bg",
		style = "bold",
	},
}

git_diff_removed = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		bg = "bg",
		style = "bold",
	},
}

-- diagnosticErrors
diags_errors = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
	end,
	hl = {
		fg = "red",
		style = "bold",
	},
}

-- diagnosticWarn
diags_warns = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
	end,
	hl = {
		fg = "yellow",
		style = "bold",
	},
}
-- diagnosticHint
diags_hints = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
	end,
	hl = {
		fg = "cyan",
		style = "bold",
	},
}
-- diagnosticInfo
diags_info = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
	end,
	hl = {
		fg = "skyblue",
		style = "bold",
	},
}

-- RIGHT

-- LspName
lsp_client_names = {
	provider = "lsp_client_names",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

-- fileIcon
file_icon = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon
	end,
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- fileType
file_type = {
	provider = "file_type",
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- fileSize
file_size = {
	provider = "file_size",
	enabled = function()
		return vim.fn.getfsize(vim.fn.expand("%:t")) > 0
	end,
	hl = {
		fg = "skyblue",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- fileFormat
file_format = {
	provider = function()
		return "" .. vim.bo.fileformat:upper() .. ""
	end,
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- fileEncode
file_enc = {
	provider = "file_encoding",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

position = {
	provider = "position",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- linePercent
line_perc = {
	provider = "line_percentage",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- scrollBar
scrollbar = {
	provider = "scroll_bar",
	hl = {
		fg = "yellow",
		bg = "bg",
	},
}

-- INACTIVE

-- fileType
inactive_file_type = {
	provider = "file_type",
	hl = {
		fg = "black",
		bg = "cyan",
		style = "bold",
	},
	left_sep = {
		str = " ",
		hl = {
			fg = "NONE",
			bg = "cyan",
		},
	},
	right_sep = {
		{
			str = " ",
			hl = {
				fg = "NONE",
				bg = "cyan",
			},
		},
		" ",
	},
}

local active_left = {
	vi_mode,
	filename,
}

local active_middle = {
	git_branch,
	git_diff_added,
	git_diff_changed,
	git_diff_removed,

	diags_errors,
	diags_warns,
	diags_hints,
	diags_info,
}

local active_right = {
	-- lsp_client_names,
	file_icon,
	file_type,
	file_size,
	file_format,
	file_enc,
	position,
	line_perc,
	scrollbar,
}

local components = {
	active = { active_left, active_middle, active_right },
	inactive = { {inactive_file_type}, {}, {} },
}

feline.setup({
	theme = colors,
	default_bg = colors.bg,
	default_fg = colors.fg,
	vi_mode_colors = vi_mode_colors,
	components = components,
	force_inactive = force_inactive,
})

feline.winbar.setup({
	components = {
		active = {
			{},
			{
				{ provider = "file_info", hl = {
					fg = "yellow",
					bg = "bg",
				} },
			},
		},
		inactive = {
			{},
			{
				{
					provider = "file_info",
					hl = {
						fg = "fg",
						bg = "bg",
					},
				},
			},
		},
	},
})

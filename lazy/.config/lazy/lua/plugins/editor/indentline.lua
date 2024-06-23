return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "⁞",
			-- char = "⋮",
			-- char = "┊",
			highlight = {
				"GruvboxGreen",
				"GruvboxYellow",
				"GruvboxBlue",
				"GruvboxPurple",
				"GruvboxAqua",
				"GruvboxOrange",
			},
		},
	},
}

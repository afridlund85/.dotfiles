require("blink.cmp").setup({
	keymap = {
		preset = 'default',
		['<Tab>'] = { 'accept', 'fallback' },
	},
	completion = { documentation = { auto_show = false } },
	signature = { enabled = true, window = { show_documentation = true } },
})

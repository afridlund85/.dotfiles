local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
    return
end

gitsigns.setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'blame line' })
        map('n', '<leader>ht', gs.toggle_current_line_blame, { desc = 'blame line toggle' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diffthis' })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'git diffthis ~' })
    end
}

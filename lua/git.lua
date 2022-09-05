require("neogit").setup({
    integrations = {
        diffview = true,
    },
    use_magit_keybindings = true,
})

require("diffview").setup({
    use_icons = true,
})

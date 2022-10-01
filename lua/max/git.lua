require("neogit").setup({
    integrations = {
        diffview = true,
    },
    use_magit_keybindings = true,
    disable_commit_confirmation = true,
})

require("diffview").setup({
    use_icons = true,
})

require("gitsigns").setup()

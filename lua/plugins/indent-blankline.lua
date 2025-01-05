local highlight = {
        "CursorColumn",
        "Whitespace",
}

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    commit = "29be0919b91fb59eca9e90690d76014233392bef",
    opts = {
        enabled = true,
        indent = { highlight = "Whitespace", char = "¦" },
        whitespace = {
            remove_blankline_trail = false,
        },
        scope = { enabled = false },
    },
}

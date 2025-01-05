-- return {
--     {
--     'hrsh7th/cmp-nvim-lsp'
--     },
--
--     {
--     'L3MON4D3/LuaSnip',
--     dependencies = {
--         'saadparwaiz1/cmp_luasnip',
--         'rafamadriz/friendly-snippets',
--         }
--     },
--     {
--     'hrsh7th/nvim-cmp',
--     config = function()
--         local cmp = require("cmp")
--         require('luasnip.loaders.from_vscode').lazy_load()
--         cmp.setup({
--             snippet = {
--                 expand = function(args)
--                 require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--                 end,
--             },
--             window = {
--                 completion = cmp.config.window.bordered(),
--                 documentation = cmp.config.window.bordered(),
--             },
--     mapping = cmp.mapping.preset.insert({
--       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.abort(),
--       ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--       ['<TAB>'] = cmp.mapping.select_next_item(),
--       ['<S-TAB>'] = cmp.mapping.select_prev_item(),
--     }),
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       -- { name = 'vsnip' }, -- For vsnip users.
--       { name = 'luasnip' }, -- For luasnip users.
--       -- { name = 'ultisnips' }, -- For ultisnips users.
--       -- { name = 'snippy' }, -- For snippy users.
--       { name = 'path' },
--     }, {
--       { name = 'buffer' },
--     })
--     })
--     end
--     }
--
-- }
return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'default' },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = false,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }
}

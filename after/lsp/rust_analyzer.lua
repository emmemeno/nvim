return {
  on_attach = function(client, buf_id)
    -- Reduce very long list of triggers for better 'mini.completion' experience
    client.server_capabilities.completionProvider.triggerCharacters =
      { '.', ':', '#', '(' }

    -- Use this function to define buffer-local mappings and behavior that depend
  end,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = true,
      inlayHints = {
        bindingModeHints = { enable = true },
        closureReturnTypeHints = { enable = true },
        lifetimeElisionHints = { enable = true },
        parameterHints = { enable = true },
        typeHints = { enable = true },
      },
      diagnostics = {
        enable = true,
        experimental = { enable = true },
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

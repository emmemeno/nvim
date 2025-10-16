return {
  on_attach = function(client, buf_id)
    -- Reduce very long list of triggers for better 'mini.completion' experience
    client.server_capabilities.completionProvider.triggerCharacters =
      { '.', ':', '#', '(' }

    -- Use this function to define buffer-local mappings and behavior that depend
  end,
  settings = {
    ['rust_analyzer'] = {
      completion = {
        callable = {
          snippets = false
        }
      }
    }
  },
}

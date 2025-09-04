return {
    'iofq/dart.nvim',
    opts = {
        tabline = {
            icons = false,
            order = function(config)
              local order = {}
              for i, key in ipairs(vim.list_extend(vim.deepcopy(config.marklist), config.buflist)) do
                order[key] = i
              end
              return order
            end,
        }
    }
}

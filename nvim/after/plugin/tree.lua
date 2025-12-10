local function on_attach(bufnr)
    local api = require "nvim-tree.api"
    api.config.mappings.default_on_attach(bufnr)
    api.tree.toggle_gitignore_filter()
end

require("nvim-tree").setup {
    on_attach = on_attach
}

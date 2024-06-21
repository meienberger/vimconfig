local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        eslint = {
          root_dir = get_root_dir,
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
        tsserver = {
          root_dir = get_root_dir,
        },
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
      },
    },
  },
}

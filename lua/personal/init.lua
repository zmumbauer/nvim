require("personal.keymaps")

vim.api.nvim_create_user_command("ToggleBufExplorer", "Telescope buffers", {})

local persisted_colorscheme = require("config.utils.colors").current_colorscheme(true)
if not persisted_colorscheme then
  pcall(vim.cmd.colorscheme, "oxocarbon")
end

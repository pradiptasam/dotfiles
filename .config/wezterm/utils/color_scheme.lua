local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

-- local function get_color_scheme()
--   local color_schemes = {}
--   local color_schemes_glob = os.getenv("HOME") .. "/repos/iTerm2-Color-Schemes/wezterm/**"
--   for _, v in ipairs(wezterm.glob(color_schemes_glob)) do
--     local fileName = string.match(v, ".+/([^/]+)%.%w+$")
--     table.insert(color_schemes, fileName)
--   end
--   local color_scheme = h.get_random_entry(color_schemes)
--   return color_scheme
-- end

M.get_color_scheme = function()
  -- return get_color_scheme()
  -- return h.is_dark() and "Catppuccin Mocha" or "Catppuccin Latte"
  return "Catppuccin Mocha"
end

return M

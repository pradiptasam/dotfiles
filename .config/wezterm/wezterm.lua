--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

-- Pull in the wezterm API
local wezterm = require("wezterm")

local dark_opacity = 0.85
local light_opacity = 0.7

local wallpapers_glob = os.getenv("HOME")
	.. "/repos/awesome-terminal-backgrounds/backgrounds/**"

local cs = require("utils/color_scheme")
local b = require("utils/background")
local w = require("utils/wallpaper")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
-- if wezterm.config_builder then
--   config = wezterm.config_builder()
-- end

-- For example, changing the color scheme:
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = cs.get_color_scheme()
-- config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font = wezterm.font 'MesloLGS Nerd Font'
config.line_height = 1.0
config.window_background_opacity = 0.95
config.window_close_confirmation = 'NeverPrompt'
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true
config.foreground_text_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 0.9,  -- default is 1.0
}
config.freetype_load_flags = "FORCE_AUTOHINT|NO_AUTOHINT"
config.freetype_load_target = "Normal"
-- config.freetype_load_target = "HorizontalLcd"
config.freetype_render_target = "HorizontalLcd"

-- config.background = {
-- 		w.get_wallpaper(wallpapers_glob),
-- 		b.get_background(dark_opacity, light_opacity),
-- 	}
--
config.window_padding = {
	left = 5,
	right = 2,
	top = 5,
	bottom = 4,
}

config.adjust_window_size_when_changing_font_size = false
config.debug_key_events = false
config.enable_tab_bar = false
config.native_macos_fullscreen_mode = false
config.window_decorations = "RESIZE"

-- local config = {
--   font_size = 18,
-- }

return config

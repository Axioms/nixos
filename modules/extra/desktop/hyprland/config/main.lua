-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")
require("config/autostart")
require("config/displays")
require("config/env")
require("config/input")
require("config/keybinds")
require("config/lookAndFeel")
require("config/windowRules")
require("config/permissions")
require("config/hyprCursor")
----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper  = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo    = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true,
        vrr                      = 1,
    },
})
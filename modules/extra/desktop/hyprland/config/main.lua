-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")
require("autostart")
require("env")
require("input")
require("keyboard")
require("lookAndFeel")
require("windowRules")
require("permissions")
require("hyprCurors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper  = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo    = false, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = false,
        vrr                      = 0,
    },
})
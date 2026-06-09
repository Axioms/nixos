--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    name = "steam game no full screen",
    match = {
        class = "^steam_app_\\d+$"
    },
    maximize = true
})

hl.window_rule({
    name = "transparency for Thorium",
    match = {
        class = "^(Thorium-browser)$"
    },
    opacity = "0.90 0.90"
})

hl.window_rule({
    name = "transparency for Thorium",
    match = {
        class = "^(Thorium-browser)$"
    },
    opacity = "0.90 0.90"
})

hl.window_rule({
    name = "transparency for Code",
    match = {
        class = "^(Code)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for Arduino IDE",
    match = {
        class = "^(Arduino IDE)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for Warp",
    match = {
        class = "^(dev.warp.Warp)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for obsidian",
    match = {
        class = "^(obsidian)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for code-url-handler",
    match = {
        class = "^(code-url-handler)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for code-insiders-url-handler",
    match = {
        class = "^(code-insiders-url-handler)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for kitty",
    match = {
        class = "^(kitty)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for Nautilus",
    match = {
        class = "^(org.gnome.Nautilus)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for ark",
    match = {
        class = "^(org.kde.ark)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for nwg-look",
    match = {
        class = "^(nwg-look)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for qt5ct",
    match = {
        class = "^(qt5ct)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for qt6ct",
    match = {
        class = "^(qt6ct)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for kvantummanager",
    match = {
        class = "^(kvantummanager)$"
    },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "transparency for pavucontrol",
    match = {
        class = "^(pavucontrol)$"
    },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "transparency for blueman-manager",
    match = {
        class = "^(blueman-manager)$"
    },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "transparency for nm-applet",
    match = {
        class = "^(nm-applet)$"
    },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "transparency for nm-connection-editor",
    match = {
        class = "^(nm-connection-editor)$"
    },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "transparency for polkit",
    match = {
        class = ".*polkit.*"
    },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "transparency for portal",
    match = {
        class = ".*portal.*"
    },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "transparency for protonvpn",
    match = {
        class = ".*proton.vpn.app.gtk.*"
    },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "transparency for drawy",
    match = {
        title = ".*Drawy.*"
    },
    opacity = "0.80 0.70"
})

local windowsToFloat = { "kvantummanager", "qt5ct", "qt6ct", "nwg-look", "org.kde.ark", "pavucontrol", "blueman-manager",
    "nm-applet", "nm-connection-editor", "polkit", "proton.vpn.app.gtk" }

for _, v in ipairs(windowsToFloat) do
    hl.window_rule({
        name = v .. " float",
        match = {
            class = v
        },
        float = true,
    })
end

-- thunderbird
hl.window_rule({
    name = "open thunder bird in email workspace",
    match = {
        initial_class = "^(thunderbird)$",
        initial_title = "^(Mozilla Thunderbird)$"
    },
    workspace = "special:email silent",
})

-- FullScreen/Maximize suppression
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-fullscreen-events",
    match          = { class = "^steam_app_\\d+$" },
    suppress_event = "fullscreen",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- layer rules
hl.layer_rule({
    name = "blur waybar",
    match = {
        namespace = "waybar"
    },
    blur = true
})

hl.layer_rule({
    name = "blur dunst",
    match = {
        namespace = "dunst"
    },
    blur = true
})

hl.layer_rule({
    name = "ignore zero rofi",
    match = {
        namespace = "rofi"
    },
    ignore_alpha = 0
})

hl.layer_rule({
    name = "ignore zero dunst",
    match = {
        namespace = "dunst"
    },
    ignore_alpha = 0
})

-- WLOGOUT CONFIG
hl.layer_rule({
    name = "blur logout_dialog",
    match = {
        namespace = "logout_dialog"
    },
    blur = true
})

hl.layer_rule({
    name = "ignore_alpha logout_dialog",
    match = {
        namespace = "logout_dialog"
    },
    ignore_alpha = 0.5
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
---------------------
---- MY PROGRAMS ----
---------------------
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show drun #tofi-drun -c ~/.share/tofi/configA --drun-launch=true"
local browser     = "zen-beta"
local notes       = "obsidian"
local editor      = "code"
local editor_alt  = "zed"
local colorPicker = "hyprpicker"
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(editor_alt))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. "+ CONTROL" .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("rofi -modi games -show games -theme ROFIGAMESTHEMERASI")) -- ${./rofi/games-theme.rasi}")) --#FIXME: update to be substringed out in nix
hl.bind(mainMod .. "+ ALT" .. " + B", hl.dsp.exec_cmd("LIBGETEXEPKGSROFIBLUETOOTH"))                  --"${lib.getExe pkgs.rofi-bluetooth}"))                   --#FIXME: update to be substringed out in nix
hl.bind(mainMod .. "+ ALT" .. " + V",
    hl.dsp.exec_cmd("python ~/Documents/git/streamdeck-pipewire/SwitchSink.py AppToSink"))
hl.bind(mainMod .. "+ ALT" .. "+ SHIFT" .. " + V", hl.dsp.exec_cmd("LIBGETEXEPKGSROFIVPN")) --"${lib.getExe pkgs.rofi-vpn}")) --#FIXME: update to be substringed out in nix
hl.bind(mainMod .. "+ ALT" .. " + W", hl.dsp.exec_cmd("LIBGETEXEPKGSROFINETWORKMANAGER"))   --${lib.getExe pkgs.rofi-network-manager}"))  --#FIXME: update to be substringed out in nix
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("jome -d | wl-copy")) -- #Emojipicker + clipboard copy

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Mute Mic
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"))

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + Z", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + X", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. "+ SHIFT" .. "+ right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }))
hl.bind(mainMod .. "+ SHIFT" .. "+ left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }))
hl.bind(mainMod .. "+ SHIFT" .. "+ up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }))
hl.bind(mainMod .. "+ SHIFT" .. "+ down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }))

-- Clipboard
hl.bind(mainMod .. "+ V", hl.dsp.exec_cmd("cliphist list | tofi -c ~/.share/tofi/configA | cliphist decode | wl-copy"))

-- Colorpicker
hl.bind(mainMod .. "+ P", hl.dsp.exec_cmd(colorPicker .. " | wl-copy"))

-- LockScreen
hl.bind(mainMod .. "+ L", hl.dsp.exec_cmd("hyprlock"))

-- wlogout
hl.bind(mainMod .. "+ ESCAPE", hl.dsp.exec_cmd("wlogout -b 4"))

-- waybar
hl.bind("CONTROL" .. "+  ESCAPE", hl.dsp.exec_cmd("pkill waybar || waybar # toggle waybar"))

-- Screenshot
hl.bind(mainMod .. "+ SHIFT" .. "+ S",
    hl.dsp.exec_cmd(
        "grimblast --notify copysave area \"$HOME/Pictures/Screenshots/Screenshot_$(date +%Y%m%d_%H%M%S).png\"")) --# Select area to take screenshot"

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

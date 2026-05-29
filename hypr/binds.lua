-- binds.lua
-- Keybindings converted from binds.conf

local terminal = "kitty"
local fileManager = "thunar"
local menu = "qs -c noctalia-shell ipc call launcher toggle"

--------------------
---- APP LAUNCH ----
--------------------

hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + N", hl.dsp.exec_cmd("kitty -e nvim"))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd("kitty -e btop"))
hl.bind("SUPER + U", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))
hl.bind("SUPER + F1", hl.dsp.exec_cmd("hyprpicker"))
hl.bind("SUPER + F2", hl.dsp.exec_cmd("togglemangohud"))
hl.bind("SUPER + F5", hl.dsp.exec_cmd("hyprctl reload"))

-----------------------
---- WINDOW CONTROL ----
-----------------------

hl.bind("SUPER + W", hl.dsp.window.close())
hl.bind("SUPER + B", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

----------------------
---- SHELL / SYSTEM ---
----------------------

hl.bind("SUPER + M", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu toggle"))

-- Keyboard layout switch
hl.bind("ALT_L + SHIFT_L", hl.dsp.exec_cmd("hyprctl switchxkblayout all next && ~/.config/hypr/scripts/keyboard.sh"))

-- Vesktop push-to-mute (mouse thumb button → Ctrl+Shift+M in Vesktop)
hl.bind("mouse:277", hl.dsp.send_shortcut({ mods = "ctrl_shift", key = "M", window = "class:^(vesktop)$" }))
------------------
---- FOCUS -------
------------------

hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

---------------------
---- SCRATCHPAD -----
---------------------

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-------------------------
---- WORKSPACE SCROLL ----
-------------------------

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

------------------------------
---- MOVE / RESIZE (MOUSE) ----
------------------------------

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------
---- SCREENSHOTS ----
--------------------

hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SUPER + ALT + PRINT", hl.dsp.exec_cmd("hyprcap rec region -c -n"))

----------------------------
---- MULTIMEDIA / LAPTOP ----
----------------------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

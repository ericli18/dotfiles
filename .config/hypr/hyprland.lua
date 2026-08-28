-- Hyprland 0.55 Lua config.

local hs = require("hyprsplit")

local file_manager = "nautilus"
local menu = "rofi -show drun"
local browser = "firefox"
local main_mod = "SUPER"

local function sh(cmd)
	return hl.dsp.exec_cmd(cmd)
end

local function exec_on_start(cmd, rules)
	hl.on("hyprland.start", function()
		hl.exec_cmd(cmd, rules)
	end)
end

----------------
-- Autostart
----------------

exec_on_start("waybar")
exec_on_start("hypridle")
exec_on_start("wlsunset -l 33.02 -L -96.70 -t 3000 -T 6500")
exec_on_start("hyprpaper")
exec_on_start("wl-paste --watch cliphist store")
exec_on_start("hyprctl setcursor Posys-Cursor-Scalable-Black 22")

-- exec_on_start("ghostty", { workspace = "1" })
-- exec_on_start("firefox", { workspace = "2" })
-- exec_on_start("ticktick", { workspace = "4" })

--------------
-- Monitors
--------------

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200",
	position = "0x0",
	scale = 1.25,
})

hl.monitor({
	output = "DP-2",
	mode = "preferred",
	position = "auto-center-up",
	scale = 1,
})

hl.monitor({
	output = "DP-3",
	mode = "preferred",
	position = "auto-center-up",
	scale = 1,
})

----------------
-- Environment
----------------

hl.env("XCURSOR_THEME", "Notwaita-Black")
hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_THEME", "Posys-Cursor-Scalable-Black")
hl.env("HYPRCURSOR_SIZE", "22")

----------------
-- Appearance
----------------

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	general = {
		gaps_in = 3,
		gaps_out = 3,
		border_size = 1,
		col = {
			inactive_border = "rgba(255, 255, 255, 0.4)",
			active_border = { colors = { "rgb(d699b6)", "rgb(dbbc7f)" }, angle = 45 },
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 5,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = false,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},

	input = {
		kb_layout = "us,cz",
		kb_variant = ",qwerty",
		kb_model = "",
		kb_options = "grp:alt_space_toggle",
		kb_rules = "",
		follow_mouse = 1,
		mouse_refocus = false,
		sensitivity = 0,
		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
			scroll_factor = 0.6,
		},
	},
})

hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("fluent_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.05, 0.82 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.20, 0 }, { 0.82, 0.10 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 0.75, bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

----------------
-- Keybindings
----------------

hl.bind("XF86MonBrightnessUp", sh("brightnessctl -q s +10%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", sh("brightnessctl -q s 10%-"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", sh("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", sh("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", sh("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", sh("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", sh("playerctl pause"), { locked = true })
hl.bind("XF86AudioNext", sh("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", sh("playerctl previous"), { locked = true })
hl.bind("XF86AudioMicMute", sh("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("Print", sh("grimblast save area $HOME/Pictures/Screenshots/$(date +'%s_ss.png')"))

hl.bind(main_mod .. " + Q", sh("ghostty +new-window"))
hl.bind(main_mod .. " + W", hl.dsp.window.close())
hl.bind(main_mod .. " + M", sh("loginctl terminate-session ${XDG_SESSION_ID-}"))
hl.bind(main_mod .. " + E", sh(file_manager))
hl.bind(main_mod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + I", sh("hyprctl dispatch workspaceopt allfloat"))
hl.bind(main_mod .. " + Return", sh(menu))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + O", hl.dsp.layout("togglesplit"))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(main_mod .. " + B", sh(browser))

hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(main_mod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(main_mod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(main_mod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(main_mod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "down" }))

hl.bind("CTRL + right", hl.dsp.window.resize({ x = 50, y = 0 }))
hl.bind("CTRL + left", hl.dsp.window.resize({ x = -50, y = 0 }))
hl.bind("CTRL + up", hl.dsp.window.resize({ x = 0, y = -50 }))
hl.bind("CTRL + down", hl.dsp.window.resize({ x = 0, y = 50 }))

hs.config({
	num_workspaces = 5,
	persistent_workspaces = true,
})

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(main_mod .. " + TAB", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(main_mod .. " + mouse_down", hs.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hs.dsp.focus({ workspace = "e-1" }))
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(main_mod .. " + SHIFT + G", sh("~/.config/hypr/gamemode.sh"))
hl.bind(main_mod .. " + V", sh("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

----------------
-- Rules
----------------

hl.window_rule({
	name = "ticktick-workspace",
	match = { class = "^(ticktick)$" },
	workspace = "4",
})

hl.window_rule({
	name = "neovide-workspace",
	match = { class = "^(neovide)$" },
	workspace = "3",
})

hl.window_rule({
	name = "code-workspace",
	match = { initial_class = "Code" },
	workspace = "3",
})

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})

hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Keep the helper alive for reload/monitor events registered by hyprsplit.
hs.ensure_good_workspaces()

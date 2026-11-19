-- Monitors

local primaryMonitor = "DP-1"
local secondaryMonitor = "HDMI-A-1"

hl.monitor({ output = "eDP-1", mode = "3840x2160@59.997002", position = "0x0", scale = 1.5 })
hl.monitor({ output = primaryMonitor, mode = "3840x2160@59.997002", position = "0x0", scale = 1 })
hl.monitor({ output = secondaryMonitor, mode = "1920x1080@59.997002", position = "3840x0", scale = 1, transform = 1 })

-- Workspaces
hl.workspace_rule({ workspace = "1", monitor = primaryMonitor, default = true })
hl.workspace_rule({ workspace = "2", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "3", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "4", monitor = primaryMonitor })
hl.workspace_rule({ workspace = "5" })
hl.workspace_rule({ workspace = "6" })
hl.workspace_rule({ workspace = "7", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "8", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "9", monitor = secondaryMonitor })

-- hl.window_rule({
-- 	match = { class = "^(firefox)$", title = "^(.*)(Sharing Indicator)$" },
-- 	float = true,
-- 	move = { "(monitor_w-80)", "(monitor_h-40)" },
-- 	pin = true,
-- })

hl.window_rule({
	match = { class = "^steam_app_default$", title = "^Style3D$", float = true },
	no_blur = true,
	opaque = false,
	no_dim = true,
	no_shadow = true,
	no_anim = true,
	decorate = false,
	rounding = 0,
	xray = true,
	no_vrr = true,
})

-- Env
hl.env("XCURSOR_SIZE", "16")
hl.env("HYPRCURSOR_SIZE", "16")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("NVD_BACKEND", "direct")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")

hl.on("hyprland.start", function()
	hl.exec_cmd("wayle panel start")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("nm-applet")
end)

hl.on("config.reloaded", function()
	hl.exec_cmd("killall hyprpaper")
	hl.exec_cmd("killall nm-applet")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("wayle panel restart")
end)

-- Input settings
hl.config({
	input = {
		kb_layout = "fi",
		kb_variant = "nodeadkeys",
		kb_options = "caps:escape,lvl3:lwin_switch",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = false,
		},

		sensitivity = 0,
		repeat_rate = 80,
		repeat_delay = 300,
	},

	cursor = {
		no_hardware_cursors = 1,
		use_cpu_buffer = 2,
	},

	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(c0cb47ff)", "rgba(53e0adff)" }, angle = 45 },
			inactive_border = "rgba(594671ff)",
		},

		layout = "dwindle",
		resize_on_border = true,
	},

	decoration = {
		rounding = 3,

		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			new_optimizations = true,
			ignore_opacity = true,
		},

		-- drop_shadow = yes
		-- shadow_range = 40
		-- shadow_render_power = 3
		-- col.shadow = rgba(29264055)

		inactive_opacity = 0.8,
		dim_inactive = true,
		dim_strength = 0.2,
		dim_around = 0.5,
	},

	animations = { enabled = true },

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "slave",
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
		vrr = 0,
	},
})

local terminal = "foot"
local mainMod = "ALT"

-- Basic binds
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -combi-modi drun,run -show combi -show-images -m -5"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("hyprctl reload"))

-- Layout control
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize window
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.window_rule({
	match = { tag = "force-opaque" },
	no_dim = true,
	opaque = true,
})

hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.tag({ tag = "force-opaque" }))

-- Media keys

local wmScripts = "~/.config/wm-scripts"
local ac = wmScripts .. "/audio-control"

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ac .. " VOLUME_UP"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ac .. " VOLUME_DOWN"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ac .. " MUTE"))
hl.bind("Pause", hl.dsp.exec_cmd(ac .. " MIC_MUTE"))

hl.bind("Print", hl.dsp.exec_cmd(wmScripts .. "/screenshot"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(wmScripts .. "/gopass"))

-- Animations

hl.curve("myBezier", { type = "bezier", points = { { 0, 1 }, { 0.5, 1 } } })

hl.animation({ leaf = "global", speed = 3, enabled = true, bezier = "myBezier" })

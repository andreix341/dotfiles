-- workspaces.lua
-- Workspace rules and bindings converted from workspaces.conf

------------------------------
---- WORKSPACE DEFINITIONS ----
------------------------------

-- eDP-1 (laptop screen) → numbered workspaces 1–5
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", persistent = true })

-- HDMI-A-1 (external monitor) → numbered workspaces 10/20/30/40
hl.workspace_rule({
	workspace = "10",
	monitor = "HDMI-A-1",
	persistent = true,
	default = true,
})
hl.workspace_rule({ workspace = "20", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "30", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "40", monitor = "HDMI-A-1", persistent = true })

--------------------------
---- WORKSPACE BINDS ------
--------------------------

-- eDP-1 workspaces: SUPER + 1-5
for i = 1, 5 do
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- HDMI-A-1 workspaces: SUPER + z/x/c/v
local hdmi_keys = {
	{ key = "z", ws = "10" },
	{ key = "x", ws = "20" },
	{ key = "c", ws = "30" },
	{ key = "v", ws = "40" },
}

for _, entry in ipairs(hdmi_keys) do
	hl.bind("SUPER + " .. entry.key, hl.dsp.focus({ workspace = "name:" .. entry.ws }))
	hl.bind("SUPER + SHIFT + " .. entry.key, hl.dsp.window.move({ workspace = "name:" .. entry.ws }))
end

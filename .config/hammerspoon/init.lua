---------------------
-- Reload Hammerspoon
---------------------
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config reloaded")

----------------
-- ControlEscape
----------------
hs.loadSpoon("ControlEscape"):start()

--------------------------
-- Applications on hotkeys
--------------------------
hs.hotkey.bind({"cmd", "ctrl"}, "O", function()
	hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "I", function()
	hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "P", function()
	hs.application.launchOrFocus("Slack")
end)

------------------------------------------
-- https://github.com/scottwhudson/Lunette
------------------------------------------
hs.loadSpoon("Lunette")
customBindings = {
	center = {
		{{"cmd", "ctrl"}, "C"},
	},
	fullScreen = {
		{{"cmd", "ctrl"}, "F"},
	},
	leftHalf = {
		{{"cmd", "ctrl"}, "H"},
	},
	rightHalf = {
		{{"cmd", "ctrl"}, "L"},
	},
	topHalf = false,
	bottomHalf = false,
	topLeft = {
		{{"cmd", "ctrl"}, "K"},
	},
	bottomLeft = {
		{{"cmd", "ctrl"}, "J"},
	},
	topRight = {
		{{"cmd", "shift", "ctrl"}, "K"},
	},
	bottomRight = {
		{{"cmd", "shift", "ctrl"}, "J"},
	},
	nextDisplay = {
		{{ "cmd", "alt", "ctrl"}, "L"}
	},
	prevDisplay = {
		{{ "cmd", "alt", "ctrl"}, "H"}
	},
	nextThird = false,
	prevThird = false,
	enlarge = {
		{{ "cmd", "ctrl" }, "["}
	},
	shrink = {
		{{ "cmd", "ctrl" }, "]"}
	},
	undo = {
		{{ "cmd", "ctrl"}, "Z"}
	},
	redo = false,
}
spoon.Lunette:bindHotkeys(customBindings)


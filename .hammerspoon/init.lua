-- Reload Hammerspoon
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config reloaded")

-- https://github.com/scottwhudson/Lunette
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
  enlarge = false,
  shrink = false,
  undo = false,
  redo = false,
}
spoon.Lunette:bindHotkeys(customBindings)


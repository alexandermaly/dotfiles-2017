--todo
--screen thirds
--left handed dates
--key sequence triggers
-----------------------------------------------
-- Set up
-----------------------------------------------

local hyper4 = {"cmd", "shift", "alt", "ctrl"}
local hyper3 = {"cmd", "alt", "ctrl"}
local hyper3angle={"cmd", "alt", "shift"}
local hyper3split={"cmd", "shift", "ctrl"}
local hyper2 = {"cmd", "ctrl"}
hs.window.animationDuration=0.1

-- window movement --
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
function arrangewindow(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f)
end

hs.hotkey.bind(hyper3,"left", function() arrangewindow(0,0,0.5,1) end) 		-- left side
hs.hotkey.bind(hyper3,"right", function() arrangewindow(0.5,0,0.5,1) end)	-- right side
hs.hotkey.bind(hyper3,"up", function() arrangewindow(0,0,1,0.5) end) 		-- top half
hs.hotkey.bind(hyper3,"down", function() arrangewindow(0,0.5,1,0.5) end)	-- bottom half
hs.hotkey.bind(hyper3, "d", function() arrangewindow(0,0,0.5,1) end) -- left side
hs.hotkey.bind(hyper3, "g", function() arrangewindow(.5,0,.5,1) end) -- right side
hs.hotkey.bind(hyper3, "f", function() arrangewindow(0,0,1,1) end) -- full

hs.hotkey.bind(hyper3, "r", function() arrangewindow(0,0,.5,.5) end) -- top left quarter
hs.hotkey.bind(hyper3, "t", function() arrangewindow(.5,0,.5,.5) end) -- top right quarter
hs.hotkey.bind(hyper3, "c", function() arrangewindow(0,.5,.5,.5) end) -- lower left quarter
hs.hotkey.bind(hyper3, "v", function() arrangewindow(.5,.5,.5,.5) end) -- lower right quarter

hs.hotkey.bind(hyper3, "b", function() arrangewindow(0,0,0.333,1) end) -- left third
hs.hotkey.bind(hyper3, "n", function() arrangewindow(.333,0,.333,1) end) -- middle third
hs.hotkey.bind(hyper3, "m", function() arrangewindow(.667,0,0.333,1) end) -- right third


-- Center window with some room to see the desktop
hs.hotkey.bind(hyper3, "y", function() arrangewindow(0.025,0.025,0.95,0.95) end)

-- Fullscreen
hs.hotkey.bind(hyper3, "f", function() arrangewindow(0,0,1,1) end)
--

hs.hotkey.bind(hyper3angle, "d", function()
  hs.settings.dateFormat="%Y-%m-%d"
  local dateNow = os.date(hs.settings.dateFormat)
  hs.eventtap.keyStrokes(dateNow)
end)

hs.hotkey.bind(hyper3split, "d", function()
  hs.settings.dateFormat="%y%m%d-%H%M%S"
  local timeNow = os.date(hs.settings.dateFormat)
  hs.eventtap.keyStrokes(timeNow)
end)

--pop next screen
hs.hotkey.bind(hyper3, "x", function()
  --hs.notify.new({title="NextScreen", informativeText="next"}):send()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
end)

--pop prev screen
hs.hotkey.bind(hyper3, "z", function()
  --hs.notify.new({title="PrevScreen", informativeText="previous"}):send()
  local win = hs.window.focusedWindow()
  local previousScreen = win:screen():previous()
  win:moveToScreen(previousScreen)
end)


-----------------------------------------------
-- Hyper i to show window hints
-----------------------------------------------

hs.hotkey.bind(hyper3, "i", function()
    hs.hints.windowHints()
end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper3, 'k', function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(hyper3, 'j', function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(hyper3, 'l', function()
    hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(hyper3, 'h', function()
    hs.window.focusedWindow():focusWindowWest()
end)

-----------------------------------------------

hs.hotkey.bind(hyper3, "W", function()
  hs.notify.new({title="Notify", informativeText=dateNow}):send()
end)

hs.hotkey.bind(hyper3, "E", function()
  hs.notify.new({title="Notify", informativeText=timeNow}):send()
end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
    hs.notify.new({title="Config reloaded", informativeText="reloaded .hammerspoon"}):send()

end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
--hs.alert.show("Config loaded")


local wifiWatcher = nil
local homeSSID = "almostlandsend"
local lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(55)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

hs.hotkey.bind(hyper4, "v", function()
	hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- safari bookmarks attempt

function bookmarkall_safari()
    hs.application.launchOrFocus("Safari")
    local safari = hs.appfinder.appFromName("Safari")
	--hs.alert.show(safari)
	local numTabs=safari_count_tabs()
	hs.notify.new({title="Tabs:", informativeText=numTabs}):send()

	local menu_str="Add Bookmarks for These " .. numTabs .. " Tabs…"
	hs.notify.new({title="Tabs:", informativeText=menu_str}):send()

	safari:selectMenuItem(menu_str)
	hs.notify.new({title="Tabs:", informativeText="bookmarking"}):send()
end

function script_test()
	send_script=[[tell application "Safari"
	return 2
	end tell]]
	local return_bool, tabcount, raw = hs.osascript.applescript(send_script)
	return tabcount
end

function safari_count_tabs()
	send_script=[[tell application "Safari"
	set winlist to first window
	set totaltabcount to 0
	set tabcount to 0
	repeat with win in winlist
		try
			set tabcount to number of tabs in win
			set totaltabcount to totaltabcount + tabcount
		on error errmsg
		end try
	end repeat
	display notification totaltabcount as string
	return totaltabcount
	end tell
	]]

	local return_bool, tabcount, raw = hs.osascript.applescript(send_script)
	hs.notify.new({title="Tabs counted:", informativeText=tabcount}):send()
	return tabcount
end

hs.hotkey.bind(hyper4, 'd', bookmarkall_safari)

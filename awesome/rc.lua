-- Awesome 3.5 Compatible Configuration
-- Author: Epsiarto Nurwijayadi (epsi.nurwijayadi@gmail.com)
-- Description: Awesome config, tested on Arch's awesome 3.5.9

-- {{{ Required libraries
-- Standard Awesome Library
local awful     = require("awful")
-- Theme handling library
local beautiful = require("beautiful")
-- Required library
local menubar = require("menubar")
-- }}}

local config_path = awful.util.getdir("config") .. "/"
-- {{{ Error handling -- }}}
dofile(config_path .. "main/" .. "error-handling.lua")
-- {{{ Themes -- }}}
dofile(config_path .. "main/" .. "theme.lua")

-- Custom Local Library
local main = {
  layouts = require("main.layouts"),
  tags    = require("main.tags"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
}
-- Custom Local Library: Keys and Mouse Binding
local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys    = require("binding.globalkeys"),
  bindtotags    = require("binding.bindtotags"),
  clientkeys    = require("binding.clientkeys")
}
-- Custom Local Library: Wibox (statusbar or maybe titlebar here)
local statusbar = require("anybox.statusbar") -- after theme



-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

RC = {} -- global namespace

-- os.execute("nm-applet &")
os.execute("compton &")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
-- local layouts =
RC.layouts = main.layouts()
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
RC.tags = main.tags()
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys

RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)

-- Menubar configuration
menubar.utils.terminal = RC.terminal -- Set the terminal for applications that require it

-- }}}

-- {{{ Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
--dofile(config_path .. "/main/" .. "rules.lua")
awful.rules.rules = main.rules(
    binding.clientkeys(),
    binding.clientbuttons()
  )
-- }}}


statusbar()

-- To Do
--
-- learn signals
--
-- read awesome [wiki, doc, source]
-- dynamic tagging, and layout keystrokes
-- http://dotshare.it/category/wms/awesome/
-- read luabook
-- https://plus.google.com/communities/105701199238055272871
-- documentation
-- blog

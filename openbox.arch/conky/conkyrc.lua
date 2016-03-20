# Conky settings #
background no
update_interval 1

cpu_avg_samples 2
net_avg_samples 2

override_utf8_locale yes

double_buffer yes
no_buffers yes

text_buffer_size 2048
#imlib_cache_size 0

temperature_unit fahrenheit

# Window specifications #

#own_window yes
#own_window_type override
#own_window_transparent yes
#own_window_hints undecorate,sticky,skip_taskbar,skip_pager,below

# kwin

#own_window yes
# ARGB can be used for real transparency, note that a composite manager is required for real transparency
#own_window_argb_visual true
# Set the transparency alpha value from 0 to 255
#own_window_argb_value 0
#own_window_type desktop

# openbox

own_window yes
own_window_class Conky
own_window_type normal 
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager  
own_window_transparent yes



border_inner_margin 0
border_outer_margin 0

minimum_size 200 250
maximum_width 200

alignment tr
gap_x 35
gap_y 55

# Graphics settings #
draw_shades no
draw_outline no
draw_borders no
draw_graph_borders no

# Text settings #
use_xft yes
xftfont caviar dreams:size=8
xftalpha 0.5

uppercase no

temperature_unit celsius


default_color FFFFFF

# Lua Load  #
lua_load ~/.lua/scripts/clock_rings.lua
lua_draw_hook_pre clock_rings

TEXT
${voffset 8}${color 004444}${font caviar dreams:size=16}${time %A}${font}${voffset -8}${alignr 50}${color FFFFFF}${font caviar dreams:size=38}${time %e}${font}
${color FFFFFF}${voffset -30}${color FFFFFF}${font caviar dreams:size=18}${time %b}${font}${voffset -3} ${color FFFFFF}${font caviar dreams:size=20}${time %Y}${font}${color 004444}${hr}
${voffset 140}${font caviar dreams:size=10}${alignr}HOME${font}
${font caviar dreams:size=12}${color FFFFFF}${alignr}${weather http://weather.noaa.gov/pub/data/observations/metar/stations/ LQBK temperature temperature 30} °C${font}
${image ~/.conky/blackarch-logo.png -p 56,100 -s 85x85}

${color FFFFFF}${goto 25}${voffset 35}${cpu cpu0}%
${color 339900}${goto 25}CPU
${color FFFFFF}${goto 50}${voffset 23}${memperc}%
${color 339900}${goto 50}RAM
${color FFFFFF}${goto 75}${voffset 23}${swapperc}%
${color 339900}${goto 75}Swap
${color FFFFFF}${goto 100}${voffset 23}${fs_used_perc /}%
${color 339900}${goto 100}Disk
${color FFFFFF}${goto 125}${voffset 25}${downspeed eth0}
${color FFFFFF}${goto 125}${upspeed eth0}
${color 339900}${goto 125}Net



${color FFFFFF}${font caviar dreams:size=8}Uptime: ${uptime_short}
${color FFFFFF}${font caviar dreams:size=8}Processes: ${processes}
${color FFFFFF}${font caviar dreams:size=8}Running: ${running_processes}


${color 339900}${font caviar dreams:size=8}${alignr}${nodename}
${color 339900}${font caviar dreams:size=8}${alignr}${pre_exec cat /etc/issue.net}  $machine
${color 339900}${font caviar dreams:size=8}${alignr}Kernel: ${kernel}

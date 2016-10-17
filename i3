# No title bar
new_window pixel 1

# Disable mouse related functions
focus_follows_mouse no
mouse_warping none

# Solarized dark
set $B0 #073642
set $B1 #002b36
set $G0 #fdf6e3
set $G1 #839496
set $G2 #586e75
set $R0 #dc322f
set $Y0 #b58900

# Background
exec_always --no-startup-id xsetroot -solid '$B1'

# class                  border   bg       text     indicator
client.focused           $B1  $G2  $G0  $G2
client.focused_inactive  $B1  $B0  $G1  $B0
client.unfocused         $B1  $B0  $G1  $B0
client.urgent            $B1  $R0  $G0  $B1

# i3bar
bar {
  font pango: Roboto Mono 8
  status_command i3status -c ~/.i3/i3status.conf
  colors {
    separator  $G2
    background $B1
    statusline $G1
    # workclass         border   bg       text
    focused_workspace   $Y0  $Y0  $B1
    active_workspace    $G2  $G2  $B0
    inactive_workspace  $B0  $B1  $G1
    urgent_workspace    $R0  $R0  $G0
  }
}

# Globals
set $mod Mod4

# Font
font pango: Roboto Mono 8

# Drag float windows with mouse
floating_modifier $mod

# Open Terminal
bindsym $mod+Return exec i3-sensible-terminal

# Start a floating terminal
bindsym $mod+Shift+Return exec --no-startup-id urxvt -name "floating_urxvt"
for_window [class="URxvt" instance="floating_urxvt$"] floating enable

# Kill focused window
bindsym $mod+q kill

# Focus windows
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# Move windows
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+L Move right

# Open dmenu
bindsym $mod+d exec i3-dmenu-desktop

# Split orientation
bindsym $mod+v split v
bindsym $mod+Shift+v split h

# Fullscreen
bindsym $mod+f fullscreen

# Change container layout
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# Toggle floating
bindsym $mod+Shift+space floating toggle

# Toggle focus between floating window and fixed window
bindsym $mod+space focus mode_toggle

# Focus workspaces
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# Move workspaces
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# Refresh i3
bindsym $mod+Shift+r restart

# Logout
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# Resize
mode "resize" {
  bindsym h resize shrink  width 5 px or 5 ppt
  bindsym j resize grow   height 5 px or 5 ppt
  bindsym k resize shrink height 5 px or 5 ppt
  bindsym l resize grow    width 5 px or 5 ppt
  bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

# Lock
bindsym $mod+control+l exec i3lock -c 000000 -n

# Hide border on the edge
hide_edge_borders both

# Volume control
bindsym XF86AudioRaiseVolume exec amixer -q set Master 2dB+ unmute
bindsym XF86AudioLowerVolume exec amixer -q set Master 2dB- unmute
bindsym XF86AudioMute exec amixer -q set Master toggle

# Screen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Suspend
bindsym XF86PowerOff exec systemctl suspend

# Float pop-up windows
for_window [window_role="pop-up"] floating enable
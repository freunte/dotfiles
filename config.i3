################################################
#                                              #
#   Arch Linux GUI i3 WM Configuration File.   #
#   Make a habit to read this file. You will   #
#   find keybindings and various other         #
#   settings here. Please see                  #
#                                              #
#       https://i3wm.org/docs/userguide.html   #
#                                              #
#   for a complete reference on moving forward #
#   from what I have provided here.            #
#                                              #
################################################



# This is our mod Key. Currently it is set to the Windows Key.
# You can uncomment the line below to set 'Alt' key as the mod key.
#set $mod Mod1
set $mod Mod4

# Font for window titles. Will also be used by the bar.
#font pango:monospace 0
# No title window tab, set borders to 1 pixel
#for_window [class="^.*"] border pixel 1 
default_border pixel 1
default_floating_border pixel 1

#Window color
set $bgcol   #e5711b
set $text    #ffffff
set $bdcol   #ff5733
set $incol   #77216f

#                   Border    Background    Text     Indicator
client.focused      $bdcol    $bgcol        $text    $incol

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# start a terminal. We use kitty.
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher).
# bindsym $mod+d exec --no-startup-id dmenu_run
# A more modern dmenu replacement is rofi:
# You have 2 options to launch rofi:
# This mode search for .desktop files in /usr/share/applications.
# This is the recommended mode. It searches for the programs as
# defined in .desktop file, with their description, and corresponding
# icons
bindsym $mod+d exec --no-startup-id rofi -show drun -icon-theme "Tela-circle" -show-icons

# The other mode search for applications in /usr/bin or /usr/sbin.
# This should only be used if a program lacks a .desktop file.
bindsym $mod+Shift+d exec --no-startup-id rofi -show run 

# Launch Polybar. Take a look at ~/.confi/polybar/config to
# configure the bar.
exec_always --no-startup-id $HOME/.config/polybar/launch.sh

# Display Wallpaper, always.
exec_always feh --bg-fill /home/rene/Images/archlinux4.png

# Provide Gaps to Windows. Increase/Decrease as you like.
gaps inner 10

#Compositor. This helps in transparency and fading.
exec_always picom -f

# Lock Screen This will yield a black lock screen, which
# can be customized to your liking.
bindsym $mod+x exec betterlockscreen -l

# Battery popup
exec --no-startup-id i3-battery-popup -n -D -L 20 -l 10

# Redshift
exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent
exec --no-startup-id redshift

# Shutdown the computer
#bindsym $mod+Shift+s exec shutdown now

#Reboot Machine
#bindsym $mod+r exec systemctl reboot

# Suspend the system to RAM (needs swap space)
#bindsym $mod+s exec systemctl suspend

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.

# The 4 lines of text above come from i3 documentation. Waking up from a suspended
# system will launch betterlockscreen
exec --no-startup-id xss-lock --transfer-sleep-lock -- betterlockscreen -l --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
# We use this. System dark theme is applied to it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
# These are examples if you would like to use pactl. We will not use this,
# but rather alsamixer.
#set $refresh_i3status killall -SIGUSR1 i3status
#bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
#bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
#bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
#bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

#Volume Control in ALG i3
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec amixer -q set Master toggle

##Brightness Control in ALG i3
bindsym XF86MonBrightnessUp exec brightnessctl set +10
bindsym XF86MonBrightnessDown exec brightnessctl set 10-

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# The keybindings starting from here till the end of the document are
# used for navigation in the window manager

# 1A] change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# 1B] alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# 2A] move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# 2B] alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# 3] split in horizontal orientation
bindsym $mod+h split h

# 4] split in vertical orientation
bindsym $mod+v split v

# 5] enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# 6] change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# 7] toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# 8] change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# 9A] focus the parent container
bindsym $mod+a focus parent

# 9B] focus the child container
#bindsym $your_keybinding focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# 10] switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# 11] move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# 12A] reload the configuration file
bindsym $mod+Shift+c reload
# 12B] restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# 12C] exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# 13A] resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}


# 13B] Enter Resize Mode
bindsym $mod+r mode "resize"


# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available). Commented out due to use of polybar. If you want to
# use i3 bars (status or blocks) this are some examples on how you can do it.
# bar {
        #status_command i3status
        #tray_output primary
        #status_command i3status -c ~/.config/i3/i3status.conf
        #status_command i3blocks -c ~/.config/i3/i3blocks.conf
#}

# Launch a program on a certain workspace, from rofi (which may or may not have a keybinding)
# for_window [class="nameofapp"] move to workspace $wsno.
# WS No. 5 has been used as example.
# Note: You will have to launch the program from a program launcher (rofi).
for_window [class="brave"] move to workspace $ws2
for_window [class="firefox"] move to workspace $ws2
for_window [class="mscore"] move to workspace $ws3

# The following way allows programs to be launched with a
# defined keybinding, on a certain workspace, without
# touching program launcher. Assign Programs to respective
# workspaces.
bindsym $mod+b workspace 2; exec brave
bindsym $mod+shift+f exec pcmanfm
bindsym $mod+shift+m workspace 3; exec mscore
bindsym $mod+p exec pycharm

# Screenshot 
bindsym --release Print exec import -window root screenshot.jpg
bindsym --release $mod+Print exec import root screenshot.jpg

#Multi Monitor (Dual Monitor, extended monitor)
#Replace HDMI2 with DVI-2, VGA-2, DP-2, DVI-2 etc. Get value by typing xrandr in the terminal.
#If X is a natural number, then;
#eDP-X is the display used in Laptops.
#HDMI-X is display used in Desktop connected to monitor with HDMI Cable.
#VGA-X is display used in Desktop connected to monitor with VGA Cable.
#exec --no-startup-id xrandr --output HDMI-2 --right-of HDMI-1 --auto
exec --no-startup-id xrandr --output LVDS1 --auto --output HDMI1 --auto --left-of VGA1

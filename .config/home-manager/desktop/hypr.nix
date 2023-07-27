{ config, pkgs, ... }:
{
  # Hyprland Config:

  wayland.windowManager.hyprland.extraConfig = ''
# Start of config
monitor=,preferred,auto,auto

$eDaemonS = emacs --daemon
$eDaemon = emacsclient -c

$bar = waybar -c .config/waybar/vertbar/config.jsonc -s .config/waybar/vertbar/style.css

$setTheme = gsettings set org.gnome.desktop.interface gtk-theme "TokyoNight"
$setIcon = gsettings set org.gnome.desktop.interface icon-theme "ePapirus-Dark"
$setCursor = gsettings set org.gnome.desktop.interface cursor-theme "Layan-border"

$setWallpaper0 = swaybg -i ~/.emacs.d/.custom/wallpapers/20XX.jpg
$setWallpaper01 = swaybg -i ~/.emacs.d/.custom/wallpapers/nixos.png
$setWallpaper02 = swaybg -i ~/.emacs.d/.custom/wallpapers/wind-waker.jpg
$setWallpaper03 = mpvpaper -o "loop" HDMI-A-2 ~/.emacs.d/.custom/wallpapers/live/snorlax.mp4
$setWallpaper04 = mpvpaper -o "loop" HDMI-A-2 ~/.emacs.d/.custom/wallpapers/live/winter-cabin.mp4

exec-once = $bar & $setWallpaper01 & $setTheme & $setIcon & $setCursor & $eDaemonS & $eDaemon

input {
    kb_layout = us
    repeat_delay = 200
    repeat_rate = 60
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =
    follow_mouse = 0
    touchpad {
        natural_scroll = yes
        tap-to-click = true
    }
    sensitivity = 0
}

general {
    gaps_in = 8 # 5
    gaps_out = 15 # 13
    border_size = 2.5 # 2
    col.active_border=0xfff5c2e7
    col.inactive_border=0xff45475a
    apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
    col.group_border=0xff89dceb
    col.group_border_active=0xfff9e2af
    layout = master
}

decoration {
    rounding = 10
    blur = yes
    blur_size = 3
    blur_passes = 1
    blur_new_optimizations = on
    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)

    windowrule = opacity .9 0.8,^(Emacs)$
    windowrule = opacity .9 0.8,^(Alacritty)$
    windowrule = opacity .9 0.8,^(Spotify)$
    windowrule = opacity .9 0.8,^(Thunar)$
    windowrule = tile, title:^(Spotify)$
}

animations {
    enabled = yes

    bezier = lrBezier, 0.05, 0.9, 0.1, 1.05
    bezier = udBezier,0.13,0.99,0.29,1.1

    # Up and Down Animations
    animation=windows,1,4,udBezier,slide
    animation=border,1,10,default
    animation=fade,1,10,default
    animation=workspaces,1,6,udBezier,slidevert
    # Left and Right Animations
    #animation=windows,0,7,lrBezier
    #animation=windowsOut,0,7,default,popin 80%
    #animation=border,0,10,default
    #animation=fade,0,7,default
    #animation=workspaces,0,6, default
}

dwindle {
    pseudotile = yes
    preserve_split = yes
}

master {
    new_is_master = false
    new_on_top = true
}

gestures {
    workspace_swipe = off
}
device:epic mouse V1 {
    sensitivity = -0.5
}

$volUp          = amixer set Master 2%+
$volDown        = amixer set Master 2%-
$muteAudio      = amixer set Master toggle

$brightnessUp   = brightnessctl set +200
$brightnessDown = brightnessctl set 200-

$webcmd         = firefox
$termcmd        = alacritty
$playercmd      = spotify
$screenshit     = grimshot save area
$melee          = cd && ./System/Applications/Slippi/Slippi-Launcher.AppImage && cd -
$godot          = cd && ./System/Applications/Godot4/Godot_v4.0.2-stable_mono_linux.x86_64 && cd -
$pix            = cd && ./System/Applications/Pixelorama/Pixelorama.x86_64 && cd -

$mod        = SUPER
$modShift   = SUPER SHIFT
$meta       = ALT
$metaShift  = ALT SHIFT

binde   = , XF86AudioRaiseVolume, exec, $volUp
binde   = , XF86AudioLowerVolume, exec, $volDown
bindr   = , XF86AudioMute, exec, $muteAudio
bind    = , XF86AudioPlay, exec, playerctl play-pause
bind    = , XF86AudioNext, exec, playerctl next
bind    = , XF86AudioPrev, exec, playerctl previous
binde   = , XF86MonBrightnessUp, exec, $brightnessUp
binde   = , XF86MonBrightnessDown, exec, $brightnessDown
bind    = , SunPrint_Screen, exec, $screenshit
bind    = , f11, exec, $screenshit
bind    = , XF86Explorer, exec, $screenshit
bind    = , XF86Search, exec, wofi -S drun -G -I -m -t
bind    = , f7, exec, $termcmd

bind  = $modShift, Q, exit,
binde = $mod, W, killactive,
bind  = $mod, RETURN, exec, $termcmd

bind  = $modShift, RETURN, layoutmsg, swapwithmaster

binde = $modshift, L, layoutmsg, swapnext
binde = $modShift, H, layoutmsg, swapprev
binde = $modShift, J, layoutmsg, swapnext
binde = $modShift, K, layoutmsg, swapprev

binde = $mod, H, movefocus, l
binde = $mod, L, movefocus, r
binde = $mod, K, movefocus, u
binde = $mod, J, movefocus, d

bind    = $mod, SPACE, submap, [Leader]
submap  = [Leader]

bind    = , RETURN, exec, $termcmd
bind    = , B, exec, $webcmd
bind    = , S, exec, $playercmd
bind    = , E, exec, $eDaemon
bind    = , M, exec, $melee
bind    = , G, exec, gimp
bind    = , W, exec, ws2editor
bind    = , p, exec, pavucontrol

bind    = SHIFT, D, exec, discord
bind    = SHIFT, G, exec, $godot
bind    = SHIFT, P, exec, $pix

bind    = , SPACE, submap, reset
submap  = reset

bind    = $mod, f, submap, [Window]
submap  = [Window]

bind    = , RETURN, layoutmsg, swapwithmaster
binde   = SHIFT, L, layoutmsg, swapnext
binde   = SHIFT, H, layoutmsg, swapprev
binde   = SHIFT, J, layoutmsg, swapnext
binde   = SHIFT, K, layoutmsg, swapprev

binde   = , H, movefocus, l
binde   = , L, movefocus, r
binde   = , K, movefocus, u
binde   = , J, movefocus, d
binde   = , W, killactive,

bind    = , SPACE, togglefloating,
bind    = SHIFT, f, fullscreen
bind    = , I, layoutmsg, addmaster
bind    = , O, layoutmsg, removemaster
bindr   = , U, layoutmsg, orientationtop
bindr   = , P, layoutmsg, orientationbottom

bindr   = , T, layoutmsg, orientationleft
bind    = , R, submap, resize

bind    = , 1, workspace, 1
bind    = , 2, workspace, 2
bind    = , 3, workspace, 3
bind    = , 4, workspace, 4
bind    = , 5, workspace, 5

bind    = , 6, workspace, 6
bind    = , 7, workspace, 7
bind    = , 8, workspace, 8
bind    = , 9, workspace, 9
bind    = , 0, workspace, 10

bind    = SHIFT, 1, movetoworkspace, 1
bind    = SHIFT, 2, movetoworkspace, 2
bind    = SHIFT, 3, movetoworkspace, 3
bind    = SHIFT, 4, movetoworkspace, 4
bind    = SHIFT, 5, movetoworkspace, 5

bind    = SHIFT, 6, movetoworkspace, 6
bind    = SHIFT, 7, movetoworkspace, 7
bind    = SHIFT, 8, movetoworkspace, 8
bind    = SHIFT, 9, movetoworkspace, 9
bind    = SHIFT, 0, movetoworkspace, 10

bind    = , f, submap, reset
submap  = reset

bind    = $mod, R, submap, resize
submap  = resize

binde   =, L, resizeactive, 10 0
binde   =, H, resizeactive, -10 0
binde   =, K, resizeactive,0 -10
binde   =, J, resizeactive, 0 10

bind    =, R, submap, reset
submap  = reset

bind = $mod, 1, workspace, 1
bind = $mod, 2, workspace, 2
bind = $mod, 3, workspace, 3
bind = $mod, 4, workspace, 4
bind = $mod, 5, workspace, 5
bind = $mod, 6, workspace, 6
bind = $mod, 7, workspace, 7
bind = $mod, 8, workspace, 8
bind = $mod, 9, workspace, 9
bind = $mod, 0, workspace, 10

bind = $modShift, 1, movetoworkspace, 1
bind = $modShift, 2, movetoworkspace, 2
bind = $modShift, 3, movetoworkspace, 3
bind = $modShift, 4, movetoworkspace, 4
bind = $modShift, 5, movetoworkspace, 5
bind = $modShift, 6, movetoworkspace, 6
bind = $modShift, 7, movetoworkspace, 7
bind = $modShift, 8, movetoworkspace, 8
bind = $modShift, 9, movetoworkspace, 9
bind = $modShift, 0, movetoworkspace, 10

bind = $mod, mouse_down, workspace, e+1
bind = $mod, mouse_up, workspace, e-1

bindm = $mod, mouse:272, movewindow
bindm = $mod, mouse:273, resizewindow
  
'';
  
}

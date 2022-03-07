import os
import pwd
import time
import psutil

from pywm import (
    PYWM_MOD_LOGO,
    PYWM_MOD_ALT,

)

# Set Mod Key
mod = PYWM_MOD_LOGO # or PYWM_MOD_ALT for use ALT key

# Global Config
anim_time = .25
blend_time = .5
corner_radius = 0  #For desktop view
lock_on_wakeup = False
power_times = [1800, 1600]

# Startup apps
def on_startup():
    os.system("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots")
    os.system("waybar &")
    os.system("mako &")
    #os.system("~/conf/sway/scripts/import-gsettings")

def on_reconfigure():
    os.system("notify-send newm \"Reloaded config\" &") # Install mako
    os.system("gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-purple-dark'")
    os.system("gsettings set org.gnome.desktop.wm.preferences 'Catppuccin-purple-dark'")
    os.system("gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'")
    os.system("gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin Lavender'")
    os.system("gsettings set org.gnome.desktop.interface cursor-size 40")
    os.system("gsettings set org.gnome.desktop.interface font-name 'Inter'")


outputs = [
    { 'name': 'LVDS-1', 'pos_x': 0, 'pos_y': 0, 'width': 1280, 'height': 800, 'scale': 1.,  'anim': False}
]

pywm = {
    'xkb_model': "macintosh",
    'xkb_layout': "us,es",
    #'xkb_options': "caps:escape",
    'encourage_csd': False,
    'enable_xwayland': True,
    'natural_scroll': False,
    'texture_shaders': 'fancy', # Testing 
    'renderer_mode': 'passthrough' # Testing (Direct value crash newm) 
}

focus = {
    'distance': 1,
    'width': 1,
    'animate_on_change': False,
    'anim_time': 0,
    'color': '#C9CBFF'   
}

def should_float(view):
    if view.app_id == "wofi":
        return True, (500, 500), (0.5, 0.25)
    if view.app_id == "pavucontrol":
        return True, (340, 600), (0.15, 0.4)
    if view.app_id == "rofi":
         return True, (600, 600), (0.5, 0.5)
    if view.title is not None and view.title.strip() == "Firefox — Sharing Indicator":
        return True, (100, 40), (0.5, 0.1)
    return None

view = {
    'padding': 8,
    'fullscreen_padding': 8,
    'send_fullscreen': False,
    'should_float': should_float,
    'floating_min_size': False,
    'debug_scaling': True,
    'border_ws_switch': 100,
}

# Testing 
interpolation = {
        'size_adjustment': .1,
}

swipe_zoom = {
    'grid_m': 1,
    'grid_ovr': 0.02,
}


background = {
    'path': '/home/sadrach/fondo/color-waterfall.png',
    'time_scale': 0.125,
    'anim': False,
}

key_bindings = lambda layout: [
    
    # Change windows focus on layout view    
    ("M-h", lambda: layout.move(-1, 0)),
    ("M-j", lambda: layout.move(0, 1)),
    ("M-k", lambda: layout.move(0, -1)),
    ("M-l", lambda: layout.move(1, 0)),
    ("M-t", lambda: layout.move_in_stack(1)),
    ("M-Left", lambda: layout.move(-1, 0)),
    ("M-Down", lambda: layout.move(0, 1)),
    ("M-Up", lambda: layout.move(0, -1)),
    ("M-Right", lambda: layout.move(1, 0)),

    # Move windows in layout view
    ("M-Shift-h", lambda: layout.move_focused_view(-1, 0)),
    ("M-Shift-j", lambda: layout.move_focused_view(0, 1)),
    ("M-Shift-k", lambda: layout.move_focused_view(0, -1)),
    ("M-Shift-l", lambda: layout.move_focused_view(1, 0)),
#     ("M-Shift-Left", lambda: layout.move_focused_view(-1, 0)),
#     ("M-Shift-Down", lambda: layout.move_focused_view(0, 1)),
#     ("M-Shift-Up", lambda: layout.move_focused_view(0, -1)),
#     ("M-Shift-Right", lambda: layout.move_focused_view(1, 0)),
# 
    # Resize window focused 
    ("M-C-h", lambda: layout.resize_focused_view(-1, 0)),
    ("M-C-j", lambda: layout.resize_focused_view(0, 1)),
    ("M-C-k", lambda: layout.resize_focused_view(0, -1)),
    ("M-C-l", lambda: layout.resize_focused_view(1, 0)),
#     ("M-C-Left", lambda: layout.resize_focused_view(-1, 0)),
#     ("M-C-Down", lambda: layout.resize_focused_view(0, 1)),
#     ("M-C-Up", lambda: layout.resize_focused_view(0, -1)),
#     ("M-C-Right", lambda: layout.resize_focused_view(1, 0)),
# 
    ("M-Tab", lambda: layout.move_next_view(active_workspace=False)),
    ("M-v", lambda: layout.toggle_focused_view_floating()),
    ("M-w", lambda: layout.change_focused_view_workspace()),
    ("M-W", lambda: layout.move_workspace()),
    ("Print", lambda: os.system("grim ~/screen-"$(date +%s)".png &")),

    ("M-Return", lambda: os.system("kitty &")),
    #("M-e", lambda: os.system("emacsclient -c -a \"emacs\" &")),
    #("M-c", lambda: os.system("brave --enable-features=UseOzonePlatform --ozone-platform=wayland &")),
    #("M-m", lambda: os.system("bash /$HOME/.shell/macho-gui.sh &")),
    ("M-q", lambda: layout.close_view()),

    ("M-p", lambda: layout.ensure_locked(dim=True)),
    ("M-P", lambda: layout.terminate()),
    ("M-R", lambda: layout.update_config()),

    # ("M-r", lambda: os.system("catapult &")),
    ("M-x", lambda: os.system("rofi -show &")),
    ("M-d", lambda: os.system("wofi -show &")),
    ("M-f", lambda: layout.toggle_fullscreen()),


    ("ModPress", lambda: layout.toggle_overview(only_active_workspace=False)),
]

bar = {
    'enabled': False,
}

gestures = {
    'lp_freq': 120.,
    'lp_inertia': 0.4
}

swipe = {
    'gesture_factor': 3
}

panels = {
    'lock': {
        'cmd': 'alacritty -e newm-panel-basic lock',
        'w': 0.7,
        'h': 0.6,
        'corner_radius': 12,
        # 'cmd': 'npm run start -- lock',
        # 'cwd': '/home/jonas/newm-panel-nwjs'
    },
    'launcher': {
        'cmd': 'alacritty -e newm-panel-basic launcher',
        'w': 0.7,
        'h': 0.6,
        'corner_radius': 12,
        # 'cmd': 'npm run start -- launcher',
        # 'cwd': '/home/jonas/newm-panel-nwjs'
    },
    'notifiers': {
        # 'cmd': 'npm run start -- notifiers',
        # 'cwd': '/home/jonas/newm-panel-nwjs'
    }
}

grid = {
    'throw_ps': [2, 10]
}



from __future__ import annotations
import logging
import os
from typing import Callable, Any
from newm.layout import Layout
from newm.helper import BacklightManager, WobRunner, PaCtl

from pywm import (
    PYWM_MOD_LOGO,
    PYWM_MOD_ALT,

    PYWM_TRANSFORM_90,
    PYWM_TRANSFORM_180,
    PYWM_TRANSFORM_270,
    PYWM_TRANSFORM_FLIPPED,
    PYWM_TRANSFORM_FLIPPED_90,
    PYWM_TRANSFORM_FLIPPED_180,
    PYWM_TRANSFORM_FLIPPED_270,
)

logger = logging.getLogger(__name__)

def on_startup():
    os.system("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots")
    os.system("catapult &")
    os.system("waybar &")
    os.system("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1/")
    
def on_reconfigure():
    os.system("notify-send newm \"Reloaded config\" &")

#     gnome_schema = 'org.gnome.desktop.interface'
#     gnome_peripheral = 'org.gnome.desktop.peripherals'
#     wm_service_extra_config = (
#         f"gsettings set {gnome_schema} gtk-theme 'Sweet-Dark-v40'",
#         f"gsettings set {gnome_schema} icon-theme 'candy-icons'",
#         f"gsettings set {gnome_schema} cursor-theme 'Sweet-cursors'",
#         f"gsettings set {gnome_schema} cursor-size 35",
#         f"gsettings set {gnome_schema} font-name 'Lucida MAC 15'",
#         "gsettings set org.gnome.desktop.wm.preferences button-layout :",
#         f"gsettings set {gnome_peripheral}.keyboard repeat-interval 30",
#         f"gsettings set {gnome_peripheral}.keyboard delay 500",
#         f"gsettings set {gnome_peripheral}.mouse natural-scroll false",
#         f"gsettings set {gnome_peripheral}.mouse speed 0.0",
#         f"gsettings set {gnome_peripheral}.mouse accel-profile 'default'",

 

outputs = [
        {'name': 'LVDS-1', 'scale': 1, 'pos_x': 0, 'pos_y':0 'width':1280, 'height'; 800}
    ]

background = {
    'path': os.environ["HOME"] + "/fondo/catppuccin.png",
    'time_scale': 0,
    'anim': True,
}

pywm = {
    'xkb_model': "PLACEHOLDER_xkb_model",
    'xkb_layout': "us",
    #'xkb_options': "caps:swapescape",
    'focus_follows_mouse': True,
    #'xcursor_theme': 'Sweet-cursors',
    #'xcursor_size': 24,
    'encourage_csd': True,
    'enable_xwayland': True,
    'natural_scroll': False,
    'texture_shaders': 'basic',
    # 'renderer_mode': 'indirect',
    # 'contstrain_popups_to_toplevel': True
}



view = {
    'padding': 5,
    'fullscreen_padding': 5,
    'send_fullscreen': False,
    'rules': rules,
    'floating_min_size': False,
    'debug_scaling': True,
    'border_ws_switch': 100,
    'corner_radius': 12
}

swipe_zoom = {
    'grid_m': 1,
    'grid_ovr': 0.5,
}

mod = PYWM_MOD_LOGO

corner_radius = 12
anim_time = .25
blend_time = 0.5
#term = 'kitty'
power_times = [1000, 1000, 2000]


key_bindings = lambda layout: [
    ("M-h", lambda: layout.move(-1, 0)),
    ("M-j", lambda: layout.move(0, 1)),
    ("M-k", lambda: layout.move(0, -1)),
    ("M-l", lambda: layout.move(1, 0)),
    ("M-t", lambda: layout.move_in_stack(1)),

    ("M-H", lambda: layout.move_focused_view(-1, 0)),
    ("M-J", lambda: layout.move_focused_view(0, 1)),
    ("M-K", lambda: layout.move_focused_view(0, -1)),
    ("M-L", lambda: layout.move_focused_view(1, 0)),

    ("M-C-h", lambda: layout.resize_focused_view(-1, 0)),
    ("M-C-j", lambda: layout.resize_focused_view(0, 1)),
    ("M-C-k", lambda: layout.resize_focused_view(0, -1)),
    ("M-C-l", lambda: layout.resize_focused_view(1, 0)),

    ("M-v", lambda: layout.toggle_focused_view_floating()),
    ("M-w", lambda: layout.change_focused_view_workspace()),
    ("M-W", lambda: layout.move_workspace()),
    ("M-S", lambda: os.system("grim -g \"$(slurp)\" &")),

    ("M-Return", lambda: os.system("kitty &")),
    # ("M-e", lambda: os.system("emacsclient -c -a \"emacs\" &")),
    # ("M-c", lambda: os.system("brave --enable-features=UseOzonePlatform --ozone-platform=wayland &")),
    # ("M-m", lambda: os.system("bash /$HOME/.shell/macho-gui.sh &")),
    ("M-q", lambda: layout.close_view()),

    ("M-p", lambda: layout.ensure_locked(dim=True)),
    ("M-P", lambda: layout.terminate()),
    ("M-C-r", lambda: layout.update_config()),

    # ("M-r", lambda: os.system("catapult &")),
    ("M-r", lambda: os.system("rofi -show run &")),
    ("M-f", lambda: layout.toggle_fullscreen()),

    ("ModPress", lambda: layout.toggle_overview(only_active_workspace=False)),
]


bar = {
    # 'cmd': 'waybar',
    'enabled': False
}


gestures = {
    'lp_freq': 120.,
    'lp_inertia': 0.4,
    # 'pyevdev': {"enabled": True},
}

swipe = {'gesture_factor': 3}

panels = {
    'lock': {
        'cmd': f'{term} newm-panel-basic lock',
        'w': 0.7,
        'h': 0.7,
        'corner_radius': 50,
    },
}

grid = {
    'throw_ps': [3, 9]
}

energy = {
    'idle_times': [60, 180],
    'idle_callback': backlight_manager.callback
}

focus = {
    # 'color': '#A29DFF11',  # change color
    # 'distance': 0,
    # 'width': 0,
    # 'animate_on_change': false,
    # 'anim_time': 0
    'enabled': False
}


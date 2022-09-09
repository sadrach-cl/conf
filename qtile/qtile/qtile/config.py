import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401



dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "Sadrach"

mod = "mod4"
terminal = "alacritty"

### keys ###
keys = [
    Key([mod], "d", lazy.spawn("rofi -show drun -config ~/.config/rofi/rofidmenu.rasi"), desc="spawn rofi"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod], "Tab", lazy.spawn("rofi -show")),
    Key([mod, "shift"], "e", lazy.spawn("./.config/rofi/powermenu.sh")),
    Key([mod], "l", lazy.spawn("./.config/scripts/i3lock-fancy/i3lock-fancy.sh")),
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    #Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    #Key([mod, "shift"], "up", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right",  lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down",  lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    #Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    #Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    #Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),

    Key([mod, "shift"], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([], "XF86AudioRaiseVolume",lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioLowerVolume",lazy.spawn("pamixer -d 5")),
    Key([], "XF86AudioMute",lazy.spawn("pamixer -t")),
]

### groups ###
groups= [
    Group("1",
          label="I",
          layout="bsp",
          matches=[Match(wm_class=["chromium"]),
                   ],
          ),

    Group("2",
          label="II",
          # spawn='vivaldi',
          layout="bsp",
          matches=[Match(wm_class=["Org.gnome.Nautilus"]),
                   Match(wm_class=["Nemo"]),
                   Match(wm_class=["Thunar"]),
                   ],
          ),

    Group("3",
          label="III",
          layout="bsp",
          matches=[Match(wm_class=["Terminal"]),
                   Match(wm_class=["Foot"]),
                   ],
          ),

    Group("4",
          label="IV",
          layout="bsp",
          matches=[Match(wm_class=["Atom"]),
                    ],
          ),

    Group("5",
          label="V",
          layout="bsp",
          matches=[Match(wm_class=["Telegram"]),
                   ],
          ),

]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
            ])

# LAYOUTS
layouts = [
    layout.Tile     (margin=8, border_width=0, border_focus="#bb94cc", border_normal="#4c566a", ratio=0.55, shift_windows=True),
    layout.Bsp      (margin=8, border_width=0, border_focus="#bb94cc", border_normal="#4c566a", fair=False),
    layout.Max(),
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

### autostart ###
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('./.config/qtile/autostart.sh')
    subprocess.call([home])

### mouse ###
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

### Colors Scheme ###
colors =  [
        ["#00000000", "#00000000", "#00000000"], # color 0
        ["#181c25", "#181c25", "#181c25"], # color 1
        ["#353c49", "#353c49", "#353c49"], # color 2
        ["#aa648e", "#aa648e", "#aa648e"], # color 3
        ["#cd6583", "#cd6583", "#cd6583"], # color 4
        ["#4e8bbc", "#4e8bbc", "#4e8bbc"], # color 5
        ["#61b1f0", "#61b1f0", "#61b1f0"], # color 6
        ["#93ff96", "#93ff96", "#93ff96"], # color 7
        ["#f2f5de", "#f2f5de", "#f2f5de"]] # color 8


### Bar ###
widget_defaults = dict(
    font='novamono for Powerline',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        #wallpaper='/home/karttikeya/Pictures/Wallpapers/street.jpg',
        #wallpaper_mode='fill',
        # bottom=bar.Bar(
        top=bar.Bar(
        [

            widget.TextBox(
                text="\ue0b6",
                fonts="droid sans mono for powerline",
                foreground=colors[3],
                background=colors[0],
                padding=0,
                fontsize=18
            ),
            
                
            widget.TextBox(
                text="SadracH",
                fonts="droid sans mono for powerline",
                foreground=colors[8],
                background=colors[3],
                padding=0,
                fontsize=12,
            ),

            widget.TextBox(
                text="\ue0b4",
                fonts="droid sans mono for powerline",
                foreground=colors[3],
                background=colors[0],
                padding=0,
                fontsize=18
            ),

            #widget.WindowName(
             #   font = "sans",
              #  max_chars=10,
                #background=colors[3],
               # foreground = colors[8], 
            #),

            

            widget.Spacer(),

             widget.TextBox(
                  text="\ue0b6",
                  fonts="droid sans mono for powerline",
                  foreground=colors[3],
                  background=colors[0],
                  padding=0,
                  fontsize=18
             ),
            widget.GroupBox(
                font="space mono for powerline",
                fontsize=14,
                margin_y=4,
                margin_x=4,
                padding_y=5,
                padding_x=3,
                borderwidth=0,
                inactive=colors[2],
                active=colors[6],
                rounded=True,
                highlight_color=colors[3],
                highlight_method="block",
                this_current_screen_border=colors[0],
                block_highlight_text_color=colors[8],
                background=colors[3],
            ),

             widget.CurrentLayoutIcon(
                custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                scale=0.45,
                padding=0,
                foreground=colors[2],
                background=colors[3],
            ),

             widget.TextBox(
                 text="\ue0b4",
                 fonts="droid sans mono for powerline",
                 foreground=colors[3],
                 background=colors[0],
                 padding=0,
                 fontsize=18
             ),

            widget.Spacer(),
            widget.Systray(
                background=colors[0],
                foreground=colors[8],
                icon_size=15,
                padding=4,
            ),
            widget.Sep(
                background=colors[0],
                padding=10,
                linewidth=0,
            ),


            widget.Sep(
                background=colors[0],
                padding=8,
                linewidth=0,
            ),
            widget.TextBox(
                text="\uE0B6",
                fonts="droid sans mono for powerline",
                foreground=colors[3],
                background=colors[0],
                padding=0,
                fontsize=18
            ),

            widget.Sep(
                background=colors[3],
                padding=8,
                linewidth=0,
            ),
            widget.Clock(
                background=colors[3],
                foreground=colors[8],
                font="novamono for powerline bold",
                fontsize=12,
                format=' %H:%M %p %a %d-%m-%Y',
            ),

            widget.TextBox(
                    text='',
                    background=colors[3],
                    foreground=colors[8],
                    mouse_callbacks= {
                        'Button1':
                        lambda: qtile.cmd_spawn(os.path.expanduser('./.config/rofi/powermenu.sh'))
                    },
                    
                ),

            widget.TextBox(
                text="\ue0b4",
                fonts="droid sans mono for powerline",
                foreground=colors[3],
                background=colors[0],
                padding=0,
                fontsize=18
            ),
        ],
            20,
            background=colors[0],
            margin=[10,10,10,5],
            #padding=8
            # margin=[4,4,6,4],
            # opacity=0.79,
        ),
    ),
]
#############################################

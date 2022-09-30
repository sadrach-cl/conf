from libqtile.config import Key, Group, DropDown, ScratchPad
from libqtile.lazy import lazy
from .keys import keys, mod, terminal

# GROUPS
groups = (
    Group(' WWW', layout='monadtall'),
    Group(' DEV', layout='monadtall'),
    Group(' SYS', layout='monadtall'),
    Group(' VRT', layout='monadtall'),
    Group(' MUS', layout='monadtall'),
    Group(' VID', layout='monadtall'),
    Group(' FUN', layout='monadtall'),
    Group(' MSG', layout='monadtall'),
    ScratchPad('scratchpad', [DropDown(
        'term', terminal, width=0.5, height=0.5,
        x=0.05, y=0.05, opacity=1.0, on_focus_lost_hide=False
    )])
)

for i, group in enumerate(groups[:-1], 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[group.name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(group.name)))


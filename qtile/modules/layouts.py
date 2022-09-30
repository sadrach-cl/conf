from turtle import title
from libqtile import layout
from libqtile.config import Match

layouts = [
    layout.Tile(margin=10, border_width=0),
    layout.MonadTall(margin=10, border_width=0),
    layout.Columns(margin=10, border_width=0),
    layout.Max(margin=10, border_width=0),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    layout.Bsp(margin=10, border_width=0),
    layout.Matrix(margin=10, border_width=0),
    layout.MonadTall(margin=10, border_width=0),
    layout.MonadWide(margin=10, border_width=0),
    layout.RatioTile(margin=10, border_width=0),
    
    layout.TreeTab(margin=10, border_width=0),
    layout.VerticalTile(margin=10, border_width=0),
    layout.Zoomy(margin=10, border_width=0),
]

floating_layout = layout.Floating(border_width=0, float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='yad'),  # GPG key password entry
])

# #!/usr/bin/env sh

############## PRIMARY DISPLAY SPACES ############## 
SPACE_ICONS=("⭘" "⭘" "⭘" "⭘" "⭘" "⭘" "⭘")
SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid center                    \
             --set space.$sid associated_space=$sid              \
                              icon=${SPACE_ICONS[i]}             \
                              icon.font="$FONT_LABEL:Demi Bold Italic:14" \
                              icon.color=$BASE \
                              icon.background=$BG  \
                              icon.padding_right=10               \
                              icon.padding_right=10              \
                              icon.highlight_color=$MAUVE          \
                              background.padding_right=0         \
                              background.padding_right=0       \
                              background.height=25               \
                              background.corner_radius=0         \
                              background.color=$BG        \
                              background.drawing=on              \
                              label.drawing=off                  \
                              click_script="$SPACE_CLICK_SCRIPT"
done


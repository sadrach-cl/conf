// Global 
{
	"layer": "top",   
      	"position": "top",
	// If height property would be not present, it'd be calculated dynamically
     "height": 25,
     "width" : 10,
 
    	"modules-left": [
        	"custom/launcher",
        	"sway/workspaces",
        	"sway/mode",
	],
 
	"modules-center": [     
      	],
 
    	"modules-right": [
                //"network",
	        "idle_inhibitor",
	        //"memory",
	        //"cpu",
	        // "custom/weather",
	        "pulseaudio",
	        "custom/keyboard-layout",
	        //"battery",
                //"custom/PBPbattery",
	        "backlight#icon",
                "backlight#value",
	        "clock",
	        "tray",
                //"custom/weather",
	        "custom/power",
     	],
 
// Modules


"idle_inhibitor": {
  "format": "{icon} ",
  "format-icons":{
      "activated": "",
      "deactivated": ""

   }
},
 
"battery": {
    	"states": {
      		// "good": 95,
      		"warning": 30,
      		"critical": 15
	},
    	"format": "{capacity}% {icon}",
    	"format-charging": "{capacity}% ",
    	"format-plugged": "{capacity}% ",
    	 // "format-good": "", // An empty format will hide the module
    	// "format-full": "",
    	"format-icons": ["", "", "", "", ""]
},

"custom/PBPbattery": {
    	"exec": "~/.config/waybar/scripts/PBPbattery.sh",
    	"format": "{}",
},
 
 
"clock": {
      	"interval": 10,
      	"format-alt": "{:%e %b %Y}", // Icon: calendar-alt
      	"format": "{:%H:%M}",
      	"tooltip-format": "{:%e %B %Y}"
},
 
"cpu": {
        "interval": 5,
        "format": "  {usage}% ({load})", // Icon: microchip
        "states": {
        "warning": 70,
        "critical": 90,
        },
        "on-click": "xfce4-terminal -e 'htop'",
},
 
"custom/keyboard-layout": {
      	"exec": "swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '\"' -f4",
      	// Interval set only as a fallback, as the value is updated by signal
      	"interval": 30,
      	"format": "  {}", // Icon: keyboard
      	// Signal sent by Sway key binding (~/.config/sway/key-bindings)
      	"signal": 1, // SIGHUP
      	"tooltip": false,
        "on-click": "~/.config/waybar/scripts/keyhint.sh",
},
 
"memory": {
        "interval": 5,
        "format": " {}%", // Icon: memory
        "on-click": "xfce4-terminal -e 'htop'", 
        "states": {
            	"warning": 70,
            	"critical": 90
        }
},
 
"network": {
      	"interval": 5,
        "format-wifi": "  {essid} ({signalStrength}%)", // Icon: wifi
        "format-ethernet": "  {ifname}: {ipaddr}/{cidr}", // Icon: ethernet
        "format-disconnected": "⚠  Disconnected",
        "tooltip-format": "{ifname}: {ipaddr}",
        "on-click": "xfce4-terminal -e 'nmtui'",
},
"network#vpn": {
            "interface": "tun0",
            "format": "  {essid} ({signalStrength}%)",
            "format-disconnected": "⚠  Disconnected",
           "tooltip-format": "{ifname}: {ipaddr}/{cidr}",          
},
 
"sway/mode": {
     	"format": "{}",
        "tooltip": false
},
 
"sway/window": {
        "format": "{}",
        "max-length": 120
},
 
"sway/workspaces": {
         "disable-scroll": true,
         "disable-markup" : false,
         "all-outputs": true,
         "format": "  {icon}  ",
         //"format":"{icon}",
         "format-icons": {
             "1": "",
             "2": "",
             "3": "",
             "4": "",
          }
     },
"pulseaudio": {
    	"scroll-step": 1, // %, can be a float
    	"format": "{volume}% {icon}",
    	"format-bluetooth": "{volume}% {icon}  {format_source}",
    	"format-bluetooth-muted": " {icon}  {format_source}",
    	"format-muted": "婢 {format_source}",
    	"format-source": "{volume}% ",
    	"format-source-muted": "",
    	"format-icons": {
      		"headphone": "",
      		"hands-free": "וֹ",
      		"headset": "  ",
      		"phone": "",
      		"portable": "",
      		"car": "",
      		"default": [""]
	},
    	"on-click": "pavucontrol",
    	"on-scroll-up": "pamixer -ui 2",
    	"on-scroll-down": "pamixer -ud 2",
},
 
"custom/weather": {
    	"exec": "~/.config/waybar/scripts/weather.sh",
    	"format": "{text} {icon}",
    	"return-type": "json",
    	"interval": 600,
        "tooltip-format": "{tooltip}"
},

"tray": {
       	"icon-size": 18,
       	"spacing":10,
 },
 
"backlight#icon": {
    	"format": "{icon}",
    	"format-icons": [""],
    	"on-scroll-down": "brightnessctl -c backlight set 1%-",
    	"on-scroll-up": "brightnessctl -c backlight set +1%"
},

"backlight#value" :{
     "format": "{percent}%",
     "on-scroll-down": "brightnessctl -c backlight set 1%-",
     "on-scroll-up": "brightnessctl -c backlight set +1%"

},

"custom/firefox": {
    	"format": "",
    	"on-click": "exec google-chrome",
    	"tooltip": false
},
 
"custom/terminal": {
    	"format": " ",
    	"on-click": "exec alacritty",
    	"tooltip": false
},
 
"custom/files": {
    	"format": "",
    	"on-click": "exec /usr/bin/nautilus",
    	"tooltip": false
},
 
"custom/launcher": {
    	"format":" ",
    	"on-click": "exec wofi -c ~/.config/wofi/config -I",
    	"tooltip": false,
},
 
"custom/power": {
    	"format":"⏻",
    	"on-click": "exec ~/.config/waybar/scripts/power-menu.sh",
    	"tooltip": false,
    	},

}


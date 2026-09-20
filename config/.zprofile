export PROTON_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"
export GDK_BACKEND=wayland
export SDL_VIDEODRIVER=wayland,x11
export MOZ_ENABLE_WAYLAND=1
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export XDG_SESSION_TYPE=wayland

# this is not require to set by default just for forcing
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia

export MENU_TERM=foot
export MENU_LAUNCHER=bemenu
export BMENU_BACKEND=wayland
export BEMENU_OPTS="\
-i -c -l 10 -W 0.25 -p '' -H 28 --fixed-height \
--fn \"JetBrainsMono Nerd Font Propo 13\"  \
--tf #8a9a7b --tb #181616e6 \
--nf #c5c9c5 --nb #181616e6 \
--ff #c5c9c5 --fb #181616e6 \
--hf #8ea4a2 --hb #181616e6 \
--af #c5c9c5 --ab #181616e6"

# waylock colors (used by lock/powermenu scripts)
export LOCK_INIT_COLOR=0x282727
export LOCK_INPUT_COLOR=0x2b3328
export LOCK_FAIL_COLOR=0x43242b

export PATH="$HOME/.local/bin:$HOME/Scripts:$PATH"

# home-manager session vars display managers auto source this but greetd:tuigreet does not
# if [ -f "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh" ]; then
#   . "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
# fi


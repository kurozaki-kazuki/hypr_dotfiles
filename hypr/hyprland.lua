-- ============================================================
-- HYPRLAND LUA CONFIG
-- Converted from hyprland.conf
-- Hyprland 0.55+
-- ============================================================

---

-- MONITORS

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = 1,
})

---

-- MY PROGRAMS

local background    = 0xFF1A1A1A
local surface       = 0xFF252525
local surface_alt   = 0xFF2D2D2D
local text          = 0xFFE0E0E0
local text_secondary = 0xFFA0A0A0
local text_dim      = 0xFF707070
local highlight     = 0xFF6B6B6B

local terminal    = "kitty"
local fileManager = "nautilus"
local menu        = "rofi -show run"

---

-- AUTOSTART

hl.on("hyprland.start", function()


-- DBus / systemd environment
hl.exec_cmd(
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland"
)

hl.exec_cmd(
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
)

-- Theme
hl.exec_cmd(
    'gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"'
)

hl.exec_cmd(
    'gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"'
)

hl.exec_cmd(
    'gsettings set org.gtk.Settings.FileChooser sort-directories-first true'
)

hl.exec_cmd(
    'gsettings set org.gnome.desktop.wm.preferences theme "Adwaita-dark"'
)

-- Core background services
hl.exec_cmd("dunst")
hl.exec_cmd("nm-applet")
hl.exec_cmd("systemctl --user start hyprpolkitagent")

-- Wallpaper
hl.exec_cmd("hyprpaper")

-- Clipboard manager
hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

-- Bar
hl.exec_cmd("waybar")


end)

---

-- ENVIRONMENT VARIABLES

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("__GL_GSYNC_ALLOWED", "0")
hl.env("__GL_VRR_ALLOWED", "0")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("MOZ_ENABLE_WAYLAND", "1")

---

-- LOOK AND FEEL

hl.config({


general = {
    border_size = 2,

    gaps_out = 10,

    col = {
        inactive_border = surface_alt,
        active_border   = highlight,
        nogroup_border  = surface,
    },

    resize_on_border = true,
    allow_tearing = true,
},

decoration = {
    rounding = 12,

    active_opacity = 0.95,
    inactive_opacity = 0.90,

    blur = {
        enabled = true,
        size = 4,
        passes = 1,
        new_optimizations = true,
        ignore_opacity = true,
    },
},
animations = {
    enabled = true,
},

misc = {
    focus_on_activate = true,

    disable_hyprland_logo = true,
    disable_splash_rendering = true,

    force_default_wallpaper = 0,

    mouse_move_enables_dpms = true,
    middle_click_paste = false,
    key_press_enables_dpms = true,

    animate_manual_resizes = true,
    animate_mouse_windowdragging = true,

    enable_swallow = true,
    swallow_regex = "^(kitty)$",

    vrr = 1,
},

ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
},


})

---

-- ANIMATION CURVES

hl.curve("easeOutQuint", {
type = "bezier",
points = {
{ 0.23, 1 },
{ 0.32, 1 },
},
})

hl.curve("easeInOutCubic", {
type = "bezier",
points = {
{ 0.65, 0.05 },
{ 0.36, 1 },
},
})

hl.curve("linear", {
type = "bezier",
points = {
{ 0, 0 },
{ 1, 1 },
},
})

hl.curve("almostLinear", {
type = "bezier",
points = {
{ 0.5, 0.5 },
{ 0.75, 1 },
},
})

hl.curve("quick", {
type = "bezier",
points = {
{ 0.15, 0 },
{ 0.1, 1 },
},
})

---

-- ANIMATIONS

hl.animation({
leaf = "global",
enabled = true,
speed = 6,
bezier = "default",
})

hl.animation({
leaf = "border",
enabled = true,
speed = 5.39,
bezier = "easeOutQuint",
})

hl.animation({
leaf = "windows",
enabled = true,
speed = 4.79,
bezier = "easeOutQuint",
})

hl.animation({
leaf = "windowsIn",
enabled = true,
speed = 4.1,
bezier = "easeOutQuint",
style = "popin 87%",
})

hl.animation({
leaf = "windowsOut",
enabled = true,
speed = 1.49,
bezier = "linear",
style = "popin 87%",
})

hl.animation({
leaf = "fadeIn",
enabled = true,
speed = 1.73,
bezier = "almostLinear",
})

hl.animation({
leaf = "fadeOut",
enabled = true,
speed = 1.46,
bezier = "almostLinear",
})

hl.animation({
leaf = "fade",
enabled = true,
speed = 3.03,
bezier = "quick",
})

hl.animation({
leaf = "layers",
enabled = true,
speed = 3.81,
bezier = "easeOutQuint",
})

hl.animation({
leaf = "layersIn",
enabled = true,
speed = 4,
bezier = "easeOutQuint",
style = "fade",
})

hl.animation({
leaf = "layersOut",
enabled = true,
speed = 1.5,
bezier = "linear",
style = "fade",
})

hl.animation({
leaf = "fadeLayersIn",
enabled = true,
speed = 1.79,
bezier = "almostLinear",
})

hl.animation({
leaf = "fadeLayersOut",
enabled = true,
speed = 1.39,
bezier = "almostLinear",
})

hl.animation({
leaf = "workspaces",
enabled = true,
speed = 1.94,
bezier = "almostLinear",
style = "fade",
})

hl.animation({
leaf = "workspacesIn",
enabled = true,
speed = 1.21,
bezier = "almostLinear",
style = "fade",
})

hl.animation({
leaf = "workspacesOut",
enabled = true,
speed = 1.94,
bezier = "almostLinear",
style = "fade",
})

hl.animation({
leaf = "zoomFactor",
enabled = true,
speed = 7,
bezier = "quick",
})

---

-- DWINDLE

hl.config({
dwindle = {
preserve_split = true,
},
})

---

-- MASTER

hl.config({
master = {
new_status = "master",
},
})

---

-- INPUT

hl.config({
input = {
kb_layout = "us",
kb_variant = "",
kb_model = "",
kb_options = "",
kb_rules = "",


    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {
        natural_scroll = false,
    },
},


})

---

-- GESTURES

hl.gesture({
fingers = 3,
direction = "horizontal",
action = "workspace",
})

---

-- DEVICE

hl.device({
name = "epic-mouse-v1",
sensitivity = -0.5,
})

---

-- KEYBINDINGS

local mainMod = "SUPER"

-- Terminal
hl.bind(
mainMod .. " + Q",
hl.dsp.exec_cmd(terminal)
)

-- Close active window
hl.bind(
mainMod .. " + C",
hl.dsp.window.close()
)

-- Exit Hyprland
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("hyprctl dispatch exit")
)

-- File manager
hl.bind(
mainMod .. " + E",
hl.dsp.exec_cmd(fileManager)
)

-- Toggle floating
hl.bind(
mainMod .. " + N",
hl.dsp.window.float({
action = "toggle",
})
)

hl.bind(
mainMod .. " + N",
hl.dsp.window.float({
action = "toggle",
})
)

-- Rofi run
hl.bind(
mainMod .. " + R",
hl.dsp.exec_cmd(menu)
)

-- Pseudo
hl.bind(
mainMod .. " + P",
hl.dsp.window.pseudo()
)

-- Toggle split
hl.bind(
mainMod .. " + J",
hl.dsp.layout("togglesplit")
)

-- Fullscreen
hl.bind(
mainMod .. " + F",
hl.dsp.window.fullscreen({
mode = "fullscreen",
action = "toggle",
})
)

-- power profile
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("~/.config/hypr/scripts/amd-power.sh"), { locked = true })
---

-- MOVE FOCUS

hl.bind(
mainMod .. " + left",
hl.dsp.focus({
direction = "left",
})
)

hl.bind(
mainMod .. " + right",
hl.dsp.focus({
direction = "right",
})
)

hl.bind(
mainMod .. " + up",
hl.dsp.focus({
direction = "up",
})
)

hl.bind(
mainMod .. " + down",
hl.dsp.focus({
direction = "down",
})
)

---

-- WORKSPACES

for i = 1, 10 do


local key = i % 10

-- Switch workspace
hl.bind(
    mainMod .. " + " .. key,
    hl.dsp.focus({
        workspace = i,
    })
)

-- Move active window
hl.bind(
    mainMod .. " + SHIFT + " .. key,
    hl.dsp.window.move({
        workspace = i,
    })
)


end

---

-- SPECIAL WORKSPACE / SCRATCHPAD

hl.bind(
mainMod .. " + S",
hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
mainMod .. " + SHIFT + S",
hl.dsp.window.move({
workspace = "special:magic",
})
)

---

-- SCROLL THROUGH WORKSPACES

hl.bind(
mainMod .. " + mouse_down",
hl.dsp.focus({
workspace = "e+1",
})
)

hl.bind(
mainMod .. " + mouse_up",
hl.dsp.focus({
workspace = "e-1",
})
)

---

-- MOUSE WINDOW MOVEMENT

hl.bind(
mainMod .. " + mouse:272",
hl.dsp.window.drag(),
{ mouse = true }
)

hl.bind(
mainMod .. " + mouse:273",
hl.dsp.window.resize(),
{ mouse = true }
)

---

-- VOLUME / BRIGHTNESS / MIC / REFRESH with dunst bars

hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh up"), { locked = true, repeating = true })
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh down"), { locked = true, repeating = true })
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh mute"), { locked = true, repeating = true })

hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("~/.config/hypr/scripts/mic.sh"), { locked = true, repeating = true })

hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh up"), { locked = true, repeating = true })
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh down"), { locked = true, repeating = true })

hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("~/.config/hypr/scripts/screen_res.sh"), { locked = true })
-- refresh rate

hl.bind(
    mainMod .." + F12",
    hl.dsp.exec_cmd("~/.config/hypr/scripts/screen_res.sh"),
    {
    locked = true
}
)
-- MEDIA KEYS

hl.bind(
"XF86AudioNext",
hl.dsp.exec_cmd("playerctl next"),
{ locked = true }
)

hl.bind(
"XF86AudioPause",
hl.dsp.exec_cmd("playerctl play-pause"),
{ locked = true }
)

hl.bind(
"XF86AudioPlay",
hl.dsp.exec_cmd("playerctl play-pause"),
{ locked = true }
)

hl.bind(
"XF86AudioPrev",
hl.dsp.exec_cmd("playerctl previous"),
{ locked = true }
)

---

-- ROFI

hl.bind(
mainMod .. " + SPACE",
hl.dsp.exec_cmd("rofi -show drun")
)

---

-- CLIPBOARD

hl.bind(
mainMod .. " + V",
hl.dsp.exec_cmd(
"cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"
)
)

---

-- POWER MENU

hl.bind(
mainMod .. " + ESCAPE",
hl.dsp.exec_cmd(
"~/.config/waybar/scripts/power_menu.sh"
)
)

---

-- WINDOW RULES

-- Ignore maximize requests from all applications
local suppressMaximizeRule = hl.window_rule({


name = "suppress-maximize-events",

match = {
    class = ".*",
},

suppress_event = "maximize",


})

-- Fix XWayland dragging issues
hl.window_rule({


name = "fix-xwayland-drags",

match = {
    class = "^$",
    title = "^$",

    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
},

no_focus = true,


})

-- Hyprland-run window rule
hl.window_rule({


name = "move-hyprland-run",

match = {
    class = "hyprland-run",
},

move = "20 monitor_h-120",

float = true,


})

---

-- LAYER RULES

hl.layer_rule({
    name = "dunst",
    match = { namespace = "notifications" },
    blur = false,
    ignore_alpha = 0,
    xray = false,
})

hl.layer_rule({
    name = "rofi_blur",
    match = { namespace = "rofi" },
    blur = true,
})

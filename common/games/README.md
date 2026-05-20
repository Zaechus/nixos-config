# Games

## Retroarch
Keep vsync ON when using gl and not using VRR, and force fullscreen+wayland+vulkan at your own risk...

### Tips
`input_joypad_driver = "sdl2"` for gyro/accelerometer support.

### GBA
`mgba_interframe_blending = "mix"` can fix LCD ghosting on some games.

### N64
`mupen64plus-rdp-plugin = "parallel"` and optionally \\\
`mupen64plus-rsp-plugin = "parallel"` are greatly superior for accuracy. \
`mupen64plus-cpucore = "cached_interpreter"` can also improve accuracy and stability.

`mupen64plus-parallel-rdp-deinterlace-method = "Weave"` can fix games with screenshake.

### General
Set drivers, enable achievements, set theme, enforce fullscreen and integer scaling, etc.

```ini
audio_driver = "pipewire"

cheevos_enable = "true"

# disable annoying leaderboard messages
cheevos_visibility_lboard_cancel = "false"
cheevos_visibility_lboard_start = "false"
cheevos_visibility_lboard_submit = "false"
cheevos_visibility_lboard_trackers = "false"

input_auto_mouse_grab = "true"
input_driver = "wayland"
input_joypad_driver = "sdl2"

menu_driver = "rgui"
menu_ticker_speed = "5.500000"

# (set netplay_nickname)

rgui_browser_directory = "~/Games/roms"
rgui_menu_color_theme = "20"

video_fullscreen = "true"
# (set video_refresh_rate)
video_scale_integer = "true"
video_shader_enable = "true"
video_shader_remember_last_dir = "true"
```
optional settings:
```ini
video_driver = "vulkan"
video_max_swapchain_images = "2"
video_vsync = "false"
video_windowed_fullscreen = "false"
vrr_runloop_enable = "true"
vulkan_gpu_index = "1"
```

## rpcs3
Try enabling Write Color Buffers.

## xemu
Try disabling Hard FPU emulation.

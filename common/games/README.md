# Games

## Retroarch
Keep vsync ON, and just don't bother using fullscreen wayland and forcing vulkan...

### N64
`mupen64plus-rdp-plugin = "parallel"` and optionally \\\
`mupen64plus-rsp-plugin = "parallel"` are greatly superior for accuracy. \
`mupen64plus-cpucore = "cached_interpreter"` can also improve accuracy and stability. \
`mupen64plus-parallel-rdp-deinterlace-method = "Weave"` can fix games with screenshake.

## rpcs3
Try enabling Write Color Buffers.

## xemu
Try disabling Hard FPU emulation.

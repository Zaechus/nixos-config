# sway

### wf-recorder
Get device node name:
```sh
wpctl status
wpctl inspect <default sink id>
```
Given device name `alsa_output.pci-0000_07_00.6.HiFi__Headphones__sink`:
```sh
wf-recorder --audio=alsa_output.pci-0000_07_00.6.HiFi__Headphones__sink.monitor
```

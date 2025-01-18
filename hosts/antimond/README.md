# antimond

A Framework Laptop 16 running NixOS.

### `sfdisk --dump /dev/nvme0n1`
```
label: gpt
label-id: BED1586D-89D7-4154-8B4A-A0CFB9C5D1DD
device: /dev/nvme0n1
unit: sectors
first-lba: 2048
last-lba: 1953525134
sector-size: 512

/dev/nvme0n1p1 : start=        2048, size=     1126400, type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B, uuid=1BBC8CF5-EBF0-4B72-980A-0270D71386FF
/dev/nvme0n1p2 : start=     1128448, size=  1952395264, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4, uuid=7B07E990-A44A-45D2-8640-01EFC2DA7ED3
```

## Quirks

### Audio

The Audio Expansion Card must be set as the default card in order for the audio to switch to headphones when plugged in. This is relatively simple with `wpctl status` and `wpctl set-default <id>`.

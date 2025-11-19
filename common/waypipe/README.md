# waypipe

## Usage

`waypipe [--xwls] -c zstd=3 [--remote-node /dev/dri/card1] --video av1 ssh [-B INTERFACE] DESTINATION COMMAND...`

I don't think `/dev/dri/card1` is a correct option for `--remote-node`, but it makes it faster anyway.

### Audio

Client: `pactl load-module module-native-protocol-tcp`

Server: `pactl load-module module-tunnel-sink server=tcp:IPADDR`

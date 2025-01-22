config.load_autoconfig()

# Downloads
c.downloads.location.directory = '~/Downloads'
c.downloads.location.prompt = False
c.downloads.position = 'bottom'

c.tabs.show = 'always'
c.statusbar.show = 'always'
# window fullscreen
config.bind('<F10>',
    'config-cycle tabs.show always never;;' +
    'config-cycle statusbar.show always never')
# true fullscreen
config.bind('<F11>',
    'fullscreen;;' +
    'config-cycle tabs.show always never;;' +
    'config-cycle statusbar.show always never')

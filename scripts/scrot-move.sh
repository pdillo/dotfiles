#!/bin/bash
# Take the screenshot
scrot '%Y-%m-%d-%H%M%S_$wx$h_scrot.png'

# Move any new screenshots to your Documents/scrots folder
# The -n flag ensures we don't overwrite anything
mv -n *_scrot.png ~/Documents/scrots/

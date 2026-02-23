#!/bin/bash
# Script to run critical X settings and fixes after waking from suspend

# 1. Re-apply Caps Lock to Escape mapping
setxkbmap -option caps:escape

# 2. Re-disable trackpad
synclient TouchpadOff=1

# 3. Trigger a full i3 refresh
# This addresses Polybar and i3 workspace glitches after display changes on wake.
i3-full-refresh

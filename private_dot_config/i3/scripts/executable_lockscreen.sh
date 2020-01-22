#!/bin/bash

rm /tmp/lockscreen.png
scrot /tmp/lockscreen.png
convert -blur 0x8 /tmp/lockscreen.png /tmp/lockscreen.png
convert -composite /tmp/lockscreen.png ~/.lockscreen -gravity South -geometry -20x1200 /tmp/lockscreen.png
i3lock -i /tmp/lockscreen.png

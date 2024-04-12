#!/bin/bash

echo "***** Nvidia drivers *****"
apt-cache policy nvidia-driver* | rg "Installed: [A-Za-z0-9]" -B 1
echo "******** nvidia* *********"
apt-cache policy "nvidia*" | rg "Installed: [A-Za-z0-9]" -B 1
echo "******** -nvidia* ********"
apt-cache policy "\-nvidia*" | rg "Installed: [A-Za-z0-9]" -B 1

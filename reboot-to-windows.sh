#!/bin/bash

BOOT_ID_FOR_WINDOWS=$(efibootmgr | rg Windows | rg -o "\d+")

echo "Found boot ID for Windows: $BOOT_ID_FOR_WINDOWS"

sudo efibootmgr --bootnext $BOOT_ID_FOR_WINDOWS
sudo reboot now

#!/bin/bash
echo -e "Starting msfconsole startup"

sudo systemctl start postgresql
sudo systemctl enable postgresql

msfdb init

echo "YOU CAN NOW START MSFCONOLE... HAPPY HUNTING!"

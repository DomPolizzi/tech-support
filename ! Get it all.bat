echo This script is going to run an SFC SCAN, DISM Repairs, Network Repairs, and a Checkdisk. 
echo It will require a reboot following the confirmation of the 'chkdsk' command

echo 'Press enter to start'
pause
sfc /scannow 

DISM /Online /Cleanup-Image /CheckHealth >> C:\logs\dism.txt
DISM /Online /Cleanup-Image /ScanHealth
DISM /online /Cleanup-Image /StartComponentCleanup
DISM /online /Cleanup-Image /StartComponentCleanup /ResetBase
DISM /Online /Cleanup-Image /RestoreHealth 

pause 
echo Internet issues fix. Press enter to start
Pause

ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset

Pause
echo WARNING! PLEASE READ CAREFULLY. Extensive PC issue fix. This fix will require you to restart your computer and the PC will not be able to be used until finished. This can take several hours. If you wish to run this hit enter, when prompted type the letter Y and hit enter then reboot your computer. If not please type exit then hit enter or close this window 
pause 

chkdsk /r

shutdown /t /r 2
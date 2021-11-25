echo "PC name:"
(Get-WmiObject -Class:Win32_ComputerSystem).Name
echo "PC model:"
(Get-WmiObject -Class:Win32_ComputerSystem).Model
echo "RAM - form factor:"
wmic memorychip get FormFactor
echo "RAM - Manufacturer:"
wmic memorychip get manufacturer
echo "RAM - partnumber:"
wmic memorychip get partnumber


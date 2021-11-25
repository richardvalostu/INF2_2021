$ManufacturerVar=(Get-CimInstance -ClassName Win32_BIOS).Manufacturer
(Get-Content -path .\PCblank.tex -Raw) -replace 'Manufacturer:',"Manufacturer: $ManufacturerVar" | Set-Content -path ".\PCunderCon.tex"
$ModelPC=(Get-WmiObject -Class:Win32_ComputerSystem).Model

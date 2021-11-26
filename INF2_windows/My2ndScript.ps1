$name_author="Elvis Preslay"
(Get-Content $pwd\HWspec.tex) | Foreach-Object { $_ -replace " *:[^\/].*", ":"} | Set-Content $pwd\HWspec2.tex
(Get-Content $pwd\HWspec2.tex) | Foreach-Object { $_ -replace "\\author{.*}", "\author{$name_author}"} | Set-Content $pwd\HWspecFinal.tex
$PCman=(Get-CimInstance -ClassName Win32_ComputerSystem).Manufacturer
(Get-Content .\HWspecFinal.tex) | Foreach-Object { $_ -replace "PC Manufacturer:", "PC Manufacturer: $PCman"} | Set-Content $pwd\HWspecFinal.tex
$disky=(Get-PhysicalDisk)
$numberOfDisk=0
foreach($disk in $disky)
{
	$numberOfDisk++
	echo "Disk n. $cislo"
	$typdisku=$disk.MediaType
	echo "Disk Type: $typdisku"
	(Get-Content .\HWspecFinal.tex) | Foreach-Object { $_ -replace "Disk Type:", "Disk Type: $typdisku"} | Set-Content $pwd\HWspecFinal.tex
	$menodisku=$disk.FriendlyName
	(Get-Content .\HWspecFinal.tex) | Foreach-Object { $_ -replace "Disk Name:", "Disk Name: $menodisku"} | Set-Content $pwd\HWspecFinal.tex
}
pdflatex.exe $pwd\HWspecFinal.tex
start $pwd\\HWspecFinal.pdf
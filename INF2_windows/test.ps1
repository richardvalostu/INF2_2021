$disky=(Get-PhysicalDisk)
$cislo=0
foreach($disk in $disky)
{
	$cislo++
	echo "Disk n. $cislo"
	$typdisku=$disk.MediaType
	echo "Disk Type: $typdisku"
	if ("$typdisku" -eq "SSD") {
    	echo "SSD TYPE:"
	}
	$menodisku=$disk.FriendlyName
	echo "Disk_name: $menodisku"
}
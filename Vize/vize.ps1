$cikti = ""
$sayi= 0
foreach($item in Get-Process) {
$find = netstat -ano | findstr $item.Id
if ($find) {
$result = arrayFilterSpace("$find".Split(' '));
$servisportu= $result[1].Substring($result[1].lastIndexOf(':')+1)
$servisadi = $item.Name
$servisyolu = $item.Path
$bilgi = "Servis: $servisadi`r`n"
$bilgi += "Portu: $servisportu`r`n"
$bilgi += "Yol: $servisyolu`r`n`r`n"
$cikti += $bilgi
$bilgi
$sayi++
}
}
function arrayFilterSpace {
param($array)
$result = @()
for($sayi = 0; $sayi -lt $array.length; $sayi++) {
if ($array[$sayi]) {
$result += $array[$sayi];
}
}
return $result
}

cd ~\Desktop
$cikti | Out-File -FilePath./cikti.txt
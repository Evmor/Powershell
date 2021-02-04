# Самая длинная последовательность Коллатца
cls
# Создается коллекция

$collection = @{}
for ($i = 2; $i -lt 1000000; $i++) {
    $key = $number = $i
    $count = 0
    while ($number -ne 1) {
        if ($collection.Keys -contains $number) {
            $collection[$key] = ($collection[$number] + $count)
            break
        }
        else {
            if ($number % 2 -eq 0) {
                $number = $number / 2
                
            }
            else {
                $number = 3*$number + 1
            }
         $count += 1   
        }
    $collection[$key] = $count
    }
}

# $collection

$a = ($collection.GetEnumerator() | Sort-Object -Property Value -Descending)
$maxcount = $a[0]
Write-Host ''
$maxcount.Key


<#
# 837799 - 524
cls
$maxcount = 0
for ($i = 15051; $i -gt 2; $i--) {
    $a = $number = $i
    $count = 0
    while ($number -ne 1) {
        if ($number % 2 -eq 0) {
            $number = $number / 2
        }
        else {
            $number = 3 * $number + 1
        }
        $count += 1
    }
    if ($maxcount -lt $count) {
        $maxcount = $count
        $maxnumber = $a
    }
       
}


Write-Host 'Current:', $i, '$maxcount=', $maxcount, '$maxnumber=', $maxnumber

#>
    

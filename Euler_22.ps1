# Задача решена.
# Сумма очков имен равна 871198282

$string = Get-Content .\Downloads\names.txt
$string = $string -replace '"'
$array = $string -split ','
$array = $array | sort
$hashtable = @{}
$hashtableABC = @{}
$array | ForEach-Object -Begin {$i = 1} -Process {
    $hashtable.$i = $PSItem
    $i++
}

$TheABC = (65..90) | ForEach-Object {[string] [char] $PSItem}

$TheABC | ForEach-Object -Begin {$i = 1} -Process {
    $hashtableABC.$PSItem = $i
    $i++
}

# Сумма очков имени
# Функция, на входе получает имя
function NameBalls {
    param ($name)
    $NameCount = 0
    $name = $name -split ''
    $name | ForEach-Object {
        if ($PSItem -in $hashtableABC.Keys) {
            $NameCount += [int] $hashtableABC.$($PSItem)
        }
    }
    $NameCount
}

function MainFunction {
    $SumNames = 0
    for ($i=1; $i -le $hashtable.Count; $i++) {
        $SumNames += ($i * (NameBalls $hashtable.$i))
    }
    Write-Host "Сумма очков имен равна $SumNames"
}

# Проверка тестового условия
# 'COLIN' - 938 в списке
# Сумма очков имени = 53
# Имя 'COLIN' получает 938*53=49714 очков.
# Какова сумма очков имен в файле?
If ($hashtable.938 -ne 'COLIN') {
    Write-Host "Тестовое имя $($hashtable.938) не подходит" -ForegroundColor Red
    break
} else {
    Write-Host "Тестовое имя $($hashtable.938) подходит." -ForegroundColor Green
    if ((NameBalls $hashtable.938) -ne 53) {
        Write-Host "Сумма очков имени $($hashtable.938) не подходит." -ForegroundColor Red
    } else {
        Write-Host "Сумма очков имени $($hashtable.938) правильная." -ForegroundColor Green
        MainFunction
    }
}





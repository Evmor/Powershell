# 'a'  в степени  'b'
# при 2 <= a <= 100
# и 2 <= b <= 100


Write-Host 'Время на выполнение:'
Measure-Command -Expression {
    $array = @()
    for ($a=2; $a -le 100; $a++) {
        for ($b=2; $b -le 100; $b++){
            $array += [math]::Pow($a, $b)
            $count++
        }
    }
    $array = $array | Select-Object -Unique
}

Write-Host "Правильный ответ: " $array.Count

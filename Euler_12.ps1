# Первое треугольное число с 500 делителями 

# Функция поиска количества делителей
function find_delimiter {
param ($number)
    for ($i, $product = 2, 1; $i -le $number; $i++) {
        $count = 0
        while ($number % $i -eq 0) {
            $number /= $i
            $count += 1
        }
        $product *= $count + 1
    }
    $product
}

# Генератор треугольного числа

$triangle_number = 0
for ($i = 1; $true; $i++) {
    $triangle_number += $i
    $a = find_delimiter($triangle_number)
    if ($a -gt 500) {
        break
    }
}

Write-Host $triangle_number




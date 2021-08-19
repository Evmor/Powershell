'''
Удивительно, но существует только три числа, 
которые могут быть записаны в виде суммы четвертых степеней их цифр:

    1634 = 1^4 + 6^4 + 3^4 + 4^4
    8208 = 8^4 + 2^4 + 0^4 + 8^4
    9474 = 9^4 + 4^4 + 7^4 + 4^4

1 = 1^4 не считается, так как это - не сумма.

Сумма этих чисел равна 1634 + 8208 + 9474 = 19316.

Найдите сумму всех чисел, которые могут быть записаны 
в виде суммы пятых степеней их цифр.
Правильный ответ:  443839
'''


$Sum = 0
function Get-PowSum {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateScript({$PSItem -gt 1})]
        [int]
        $number
    )
    $number -split '' | ForEach-Object -Begin {
        $Sum=0} -Process {
            $Sum += [Math]::Pow($PSItem, 5)
        }
    if ($number -eq $Sum) {
        return $number
    }
}

for ($item = 2; $item -le [math]::Pow(9, 5)*6; $item++) {
    $Sum += $item | Get-PowSum
}

Write-Host "Правильный ответ: " $Sum
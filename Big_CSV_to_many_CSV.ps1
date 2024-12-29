<#
.SYNOPSIS
    Скрипт для разбивки CSV-файла на несколько файлов, если количество строк превышает определенное значение.

.DESCRIPTION
    Этот скрипт принимает входной CSV-файл и разбивает его на несколько выходных файлов, каждый из которых содержит не более определенного количества строк. 
    Заголовок CSV сохраняется в каждом выходном файле.

.PARAMETER InputFile
    Путь к входному CSV-файлу. Этот параметр является обязательным.

.PARAMETER OutputCatalog
    Путь к каталогу, в который будут сохранены выходные файлы. Этот параметр является обязательным.

.EXAMPLE
    ./Big_CSV_to_many_CSV.ps1 -InputFile '/Path/to/input.csv' -OutputCatalog '/Path/to/output/' -MaxCount 10000
    
    Этот пример запускает скрипт, разбивая указанный входной CSV-файл и сохраняя выходные файлы в указанном каталоге.

.NOTES
    Автор: Ev
    Дата: 2024-12-28
#>

[CmdletBinding()]
[OutputType()]
param (
    # InputFile
    [Parameter(Mandatory=$true)]
    [string]
    $InputFile = '/Path/to/CSV_file',
    # OutputCatalog
    [Parameter(Mandatory=$true)]
    [string]
    $OutputCatalog = '/Output/Catalog',
    # MaxRows
    [Parameter(Mandatory=$true)]
    [int]
    $MaxCount = 10000
)

$ErrorActionPreference = 'Stop'
$Count = 0
$Index = 0
$InputFileName = Split-Path $InputFile -Leaf
$OutputFileName = $InputFileName -replace "\.csv", "_$($Index).csv"
$OutputFile = Join-Path -Path $OutputCatalog -ChildPath $OutputFileName
$Header = Get-Content $InputFile | Select-Object -Index 0
$Header | Out-File $OutputFile
Get-Content $InputFile | Select-Object -Skip 1 | ForEach-Object {
    $_ | Add-Content $OutputFile
    $Count++
    if ($Count -gt $MaxCount) {
        $Count = 0
        $Index++
        $OutputFileName = $InputFileName -replace "\.csv", "_$($Index).csv"
        $OutputFile = Join-Path -Path $OutputCatalog -ChildPath $OutputFileName
        $Header | Out-File $OutputFile
    }
}

$ErrorActionPreference = 'Continue'

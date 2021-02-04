# Посчитать, сколько воскресений
# было на 1-е число месяца 
# с 01.01.1901 по 31.12.2000
# 
# Ответ: 171

$SundayCount = 0
for ($year = 1901; $year -le 2000; $year++) {
    for ($month = 1; $month -le 12; $month++) {
        if ((get-date -Year $year -Month $month -Day 01).DayOfWeek -eq 'Sunday') {
            $SundayCount++
        }
    }
}

Write-Host "Воскресений было: $SundayCount"
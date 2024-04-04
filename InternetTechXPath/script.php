<?php
// Загрузка XML-файла
$xml = simplexml_load_file('staff.xml');

// а) Количество сотрудников
$employeeCount = count($xml->xpath("//person"));
echo "Количество сотрудников: $employeeCount<br>";

// б) Список сотрудников, замещающих несколько должностей
$multiPositionEmployees = $xml->xpath("//person[count(employee/position) >= 2]/@name");
echo "<br>Список сотрудников, замещающих несколько должностей:<br>";
foreach ($multiPositionEmployees as $employee) {
    echo "$employee<br>";
}

// в) Список сотрудников подразделения с указанным наименованием
$departmentName = "Кафедра электроники и микропроцессорных систем";
$departmentEmployees = $xml->xpath("//person[employee/department = '$departmentName']/@name");
echo "<br>Список сотрудников подразделения '$departmentName':<br>";
foreach ($departmentEmployees as $employee) {
    echo "$employee<br>";
}

// г) Список сотрудников с указанным номером городского телефона
$phoneNumber = "269926";
$phoneEmployees = $xml->xpath("//person[contact/@phonenum = '$phoneNumber']/@name");
echo "<br>Список сотрудников с номером городского телефона '$phoneNumber':<br>";
foreach ($phoneEmployees as $employee) {
    echo "$employee<br>";
}

// д) Список сотрудников, для которых указана хоть какая-то контактная информация
$contactEmployees = $xml->xpath("//person[contact]/@name");
echo "<br>Список сотрудников с контактной информацией:<br>";
foreach ($contactEmployees as $employee) {
    echo "$employee<br>";
}
?>
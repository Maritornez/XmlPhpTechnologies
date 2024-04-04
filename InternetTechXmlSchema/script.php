<?php
// Создаем новый объект DOMDocument
$xmlDoc = new DOMDocument();

// Загружаем XML-файл
$xmlDoc->load('staff.xml');

// Создаем новый объект DOMDocument для XML-схемы
$xsdDoc = new DOMDocument();

// Загружаем XML-схему
$xsdDoc->load('staff.xsd');

// Создаем объект для валидации
$validator = new DOMDocument();

// Применяем XML-схему к XML-файлу
if ($xmlDoc->schemaValidateSource($xsdDoc->saveXML())) {
    echo 'XML-файл корректен по отношению к XML-схеме.';
} else {
    echo 'XML-файл не соответствует XML-схеме.';
}
?>

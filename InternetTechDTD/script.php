<?php
$xml = new DOMDocument();
$xml -> load('staffDTD.xml');

if($xml->validate()) {
    echo "XML-файл соответствует DTD-схеме";
}
else {
    var_dump("XML-файл не соответствует DTD-схеме");
    exit;
}
?>
<?php
$doc = new domDocument();
$doc -> load('staff.xml');
$stylesheet = new domDocument();
$stylesheet -> load('b.xslt');
$proc = new xsltProcessor();
$proc -> importStyleSheet($stylesheet);
echo $proc -> transformToXml($doc);
?>
<?php
$_SERVER['REQUEST_URI'] = str_replace(array(
    'http://' . $_SERVER['HTTP_HOST'],
    'https://' . $_SERVER['HTTP_HOST']
), '', $_SERVER['REQUEST_URI']);


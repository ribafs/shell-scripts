
# Procurar e sobrescrever com PHP
```php
$return = str_replace($procurar, $sobrescrever, $string);

$file = 'DatabaseSeeder.php';
$procurar = "public function run()";

  if ($file=file($file)) {
    foreach ($file as $txt) {
      if (stripos($procurar,$txt)!==false) {
        echo 'Encontrada a linha: '.$txt.'<br />';
      }
    }
  } else {
    echo 'Não pude ler o arquivo';
  }

$return = preg_grep($procurar, file($file)); // Se encontrar $procurar no $file ele retornará $procurar
print_r($return);


$fh = fopen($file, 'r') or die($php_errormsg);
while (!feof($fh)) {
    $line = fgets($fh, 4096);
    if (preg_match($procurar, $line)) {
        $return[ ] = $line;
    }
}
fclose($fh);
print $return[0];

$content = file_get_contents($file);
$sob = <<<EOT
\t\t\$this->call(PermissionsSeeder::class);\t\t\$this->call(ClientsSeeder::class)
EOT;
$sobrescrever = $procurar.$sob;
print $procurar;
print '<br>';
print $sobrescrever;

$newcontent = str_replace($procurar, $sobrescrever, "$content");
file_put_contents($file, "$newcontent");

print_r($newcontent);
```



<?php
# yes, PHP. I'm feeling masochistic today
$file = fopen("4.txt", 'r');
$inp = array([]);
$len = 0;

while(! feof($file)) {
  $line = trim(fgets($file));
  if ($line != "") {
    foreach (explode(" ", $line) as $prop){
      if (! (explode(":",$prop)[0] == "cid")){
        array_push($inp[$len], $prop);
      }
    }
  } else {
    array_push($inp, []);
    $len++;
  }
}
fclose($file);
$count = 0;
$count2 = 0;
foreach ($inp as $passport){
  if (count($passport) == 7 ){
    $count++;
    sort($passport);
    $fields = [];
    foreach ($passport as $prop) {
        array_push($fields, explode(":",$prop)[1]);
    }
    # might as well use PHP's infamous "features": silent type coercion, errors returning FALSE, and a bloated standard library
    # for real, who has a hex validation function in the prelude?
    if (
        $fields[0] <= 2020 && $fields[0] >= 1920 &&
        in_array($fields[1], ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]) &&
        $fields[2] <= 2030 && $fields[2] >= 2020 &&
        $fields[3][0] == '#' && ctype_xdigit(ltrim($fields[3], '#')) &&
        ((substr($fields[4], -2) == "cm" && (
        substr($fields[4], 0, 3) <= 193 &&
        substr($fields[4], 0, 3) >= 150
        )) || (substr($fields[4], -2) == "in" && (
        substr($fields[4], 0, 2) <= 76 &&
        substr($fields[4], 0, 2) >= 59
        ))) &&
        $fields[5] <= 2020 && $fields[5] >= 2010 &&
        strlen($fields[6]) == 9 && is_numeric($fields[6])
    ) {
        $count2++;
    }
  }
  
}
echo $count."\n";
echo $count2;

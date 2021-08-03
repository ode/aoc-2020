my $a, my $b = 0;
for open("2.txt").lines -> $line {
    $line ~~ /(\w+)\-(\w+)' '(\w)': '(.+)/;
    $a += +$3.Str.comb($2) ~~ $0..$1;
    if $3.Str.substr($0-1,1) eq $2 ^^ $3.Str.substr($1-1,1) eq $2 { $b++ }
}
say "$a $b"

my @l = open('10.txt').lines.sort({.Int}).rotor(2 => -1).map({-[-] @$_}).Array;
say @l.grep(3).elems.succ * @l.grep(1).elems.succ;
(my $count, my $ans) = (1, 1);
for @l -> $a {if $a == 1 { $count++ } else { $ans *= (1,1,2,4,*+*+* ... *)[$count]; $count = 0} }
$ans *= (1,1,2,4,*+*+* ... *)[$count];
say $ans

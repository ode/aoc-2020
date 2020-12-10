# original two-minute one-liner
print(max(x := [int(''.join({'F':'0', 'B':'1', 'L':'0', 'R':'1'}[a] for a in l[:-1]) ,2) for l in open('5.txt').readlines()]), set(range(min(x), max(x)))-set(x))

# golfed, with collaboration from people on discord
print(m:=max(x:={int(''.join('01'[a in 'BR'] for a in l[:-1]),2) for l in open('5.txt').readlines()}),set(range(min(x),m))-x)

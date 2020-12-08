main = readFile "8.txt" >>= print . part1 . map parse . lines -- replace part1 with part2 for part two.

part1 = run1 0 [] 0
part2 = head . filter (/= 0) . map (run2 0 [] 0) . mutate

data Op = Nop Int | Acc Int | Jmp Int

removeplus :: String -> String
removeplus ('+':s) = s
removeplus s = s

parse :: String -> Op
parse s = case words s of 
    ["acc", a] -> Acc (read $ removeplus a)
    ["jmp", a] -> Jmp (read $ removeplus a)
    ["nop", a] -> Nop (read $ removeplus a)

-- my solution is inefficient, as it uses linked lists ans hence has an O(n) lookup complexity.
-- While part 1 is quick, part two takes around 5-10 on my machine. A better solution would use Data.Array for operations

run1 :: Int -> [Int] -> Int -> [Op] -> Int
run1 acc prev index ops = 
    if elem index prev then acc
    else case ops !! index of
        Jmp a -> run1 acc (index:prev) (index + a) ops
        Nop _ -> run1 acc (index:prev) (index + 1) ops
        Acc a -> run1 (acc + a) (index:prev) (index + 1) ops

mutate :: [Op] -> [[Op]]
mutate = sequence . map mutop where
    mutop (Jmp a) = [Nop a, Jmp a]
    mutop (Nop a) = [Jmp a, Nop a]
    mutop (Acc a) = [Acc a]


run2 :: Int -> [Int] -> Int -> [Op] -> Int
run2 acc prev index ops = 
    if index >= length ops then acc else
        if elem index prev then 0
        else case ops !! index of
            Jmp a -> run2 acc (index:prev) (index + a) ops
            Nop _ -> run2 acc (index:prev) (index + 1) ops
            Acc a -> run2 (acc + a) (index:prev) (index + 1) ops

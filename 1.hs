num a = product $ head $ filter ((== 2020).sum) (sequence [a,a]) -- this is sequence [a,a,a] for part 2

prepare :: String -> [Int]
prepare = map read . lines

main = readFile "1.txt" >>= print . num . prepare

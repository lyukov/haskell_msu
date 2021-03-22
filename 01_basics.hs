fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact(n - 1)

isMember :: Eq a => a -> [a] -> Bool
isMember n [] = False
isMember n (x:xs)
    | n == x = True
    | otherwise = isMember n xs

unique1 :: Eq a => [a] -> [a] -> [a]
unique1 [] res = []
unique1 (x:xs) res
    | isMember x res = res
    | otherwise = res ++ [x]
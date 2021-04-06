permutations :: [a] -> [[a]]
permutations []     = [[]]
permutations (x:xs) = permutations xs >>= ins x
    where
        ins :: a -> [a] -> [[a]]
        ins x []     = [[x]]
        ins x (y:ys) = (x:y:ys) : map (y:) (ins x ys)

isMember :: Eq a => a -> [a] -> Bool
isMember n [] = False
isMember n (x:xs)
    | n == x = True
    | otherwise = isMember n xs

unique :: Eq a => [a] -> [a]
unique [] = []
unique (x:xs)
    | isMember x xs = unique xs
    | otherwise = x : unique xs

uniquePermutations :: Eq a => [a] -> [[a]]
uniquePermutations x = unique$permutations x
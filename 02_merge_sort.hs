merge2 :: Ord a => [a] -> [a] -> [a]
merge2 [] ys = ys
merge2 xs [] = xs
merge2 (x:xs) (y:ys) = if x <= y
    then x : merge2 xs (y:ys)
    else y : merge2 (x:xs) ys

merge4 :: Ord a => [a] -> [a] -> [a] -> [a] -> [a]
merge4 xs ys zs ts = merge2 (merge2 xs ys) (merge2 zs ts)

halve :: [a] -> ([a], [a])
halve x = splitAt (div (length x)  2) x

sorted :: Ord a => [a] -> [a]
sorted [] = []
sorted [x] = [x]
sorted x = merge4 list1 list2 list3 list4
    where
        (ulist12, ulist34) = halve x
        (ulist1, ulist2) = halve ulist12
        (ulist3, ulist4) = halve ulist34
        list1 = sorted ulist1
        list2 = sorted ulist2
        list3 = sorted ulist3
        list4 = sorted ulist4
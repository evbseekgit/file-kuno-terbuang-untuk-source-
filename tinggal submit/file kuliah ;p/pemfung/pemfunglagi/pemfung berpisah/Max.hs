max2 :: (Ord a) => a -> a -> a
max2 x y = if x >= y then x else y

maxList :: (Ord a) => [[a]] -> a
maxList [] = error "List of list kosong"
maxList [x] = maximum x
maxList (x:xs) = max2 (maximum x) (maxList xs)

main = do
    print $ maxList [[1,2], [3,4], [5,6]]
    print $ maxList [[-5,-2], [-1,0], [1,3]]
    print $ maxList [[10,20,30]] 

isMember :: (Eq a) => a -> [[a]] -> Bool
isMember _ [] = False
isMember x (y:ys)
  | x `elem` y = True
  | otherwise  = isMember x ys

main = do
  putStrLn  "apakah 3 merupakan bagian dari list di dalam list dari [[1,2], [3,4], [5,6]] ?"
  print $ isMember 3 [[1,2], [3,4], [5,6]]
  putStrLn "apakah 7 nerupakan bagian dari list di dalam list dari [[1,2], [3,4], [5,6]] ?"
  print $ isMember 7 [[1,2], [3,4], [5,6]]
  putStrLn "apakah 6 merupakan bagian dari list di dalam list dari [[1,2], [3,4], [5,6]] ? "
  print $ isMember 6 [[1,2], [3,4], [5,6]]
  putStrLn "apakah 2 merupakan bagian dari list di dalam list dari 2 [[8.7], [3,3], [1,3], [4,6], [9,3], [12,9], [22,4], [3,142857142857142857]] ? "
  print $ isMember 2 [[8.7], [3,3], [1,3], [4,6], [9,3], [12,9], [22,4], [3,142857142857142857]]

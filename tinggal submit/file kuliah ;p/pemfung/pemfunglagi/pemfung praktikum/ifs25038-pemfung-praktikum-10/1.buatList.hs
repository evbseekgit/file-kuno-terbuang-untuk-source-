nums = [10, 20, 30, 40, 50]

first = head nums
rest = tail nums
lastNum = last nums
len = length nums

main = do
  putStrLn $ "first = " ++ show (head nums)
  putStrLn $ "rest = " ++ show (tail nums)
  putStrLn $ "lastNum = " ++ show (last nums)
  putStrLn $ "len = " ++ show (length nums)
--filter
evenNumbers :: [Int] -> [Int]
evenNumbers list = filter (\x -> x `mod` 2 == 0) list

--map
doubleToEven :: [Int] -> [Int]
doubleToEven list = map (\x -> x * 2) list



main = do
    let numbers = [1,2,3,4,5,6,7,8,9,10]
    putStrLn "filter ="
    print $ evenNumbers numbers
    putStrLn " "
    putStrLn"map"
    let numbers = [1,2,3,4,5]
    print $ doubleToEven numbers
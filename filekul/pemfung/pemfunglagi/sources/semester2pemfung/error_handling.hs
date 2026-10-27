-- Save as: ErrorHandling.hs
module ErrorHandling where

-- Maybe type
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
tail (_:xs) = Just xs

-- Either type
readInt :: String -> Either String Int
readInt str = 
  case reads str of
    [(n, "")] -> Right n
    _         -> Left ("Cannot parse: " ++ show str)

divide :: Int -> Int -> Either String Int
divide _ 0 = Left "Division by zero"
divide x y = Right (x `div` y)

-- Calculator with error handling
calculator :: String -> String -> String -> Either String Int
calculator opStr xStr yStr = do
  x <- readInt xStr
  y <- readInt yStr
  case opStr of
    "+" -> Right (x + y)
    "-" -> Right (x - y)
    "*" -> Right (x * y)
    "/" -> divide x y
    _   -> Left "Unknown operator"

-- Maybe monad example
data User = User { userId :: Int, userName :: String }

findUser :: Int -> Maybe User
findUser 1 = Just (User 1 "Alice")
findUser 2 = Just (User 2 "Bob")
findUser _ = Nothing

getUserName :: Int -> Maybe String
getUserName id = do
  user <- findUser id
  return (userName user)

-- Pattern matching results
handleResult :: Either String Int -> String
handleResult (Right value) = "Result: " ++ show value
handleResult (Left error) = "Error: " ++ error

main :: IO ()
main = do
  putStrLn "=== ERROR HANDLING ==="
  
  putStrLn "\n1. Maybe Type:"
  print $ safeHead [1,2,3]
  print $ safeHead []
  print $ safeTail [1,2,3]
  print $ safeTail []
  
  putStrLn "\n2. Either Type:"
  print $ readInt "123"
  print $ readInt "12.3"
  print $ readInt "abc"
  
  putStrLn "\n3. Calculator:"
  print $ calculator "+" "10" "20"
  print $ calculator "/" "10" "0"
  print $ calculator "^" "2" "3"
  print $ calculator "+" "10" "abc"
  
  putStrLn "\n4. Maybe Monad:"
  print $ getUserName 1
  print $ getUserName 2
  print $ getUserName 3
  
  putStrLn "\n5. Result Handling:"
  putStrLn $ handleResult (calculator "+" "5" "3")
  putStrLn $ handleResult (calculator "/" "5" "0")
  
  putStrLn "\n=== END ==="
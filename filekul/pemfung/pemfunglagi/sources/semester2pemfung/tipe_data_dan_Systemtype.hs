-- Save as: TypeSystem.hs
module TypeSystem where

-- Basic types
add :: Int -> Int -> Int
add x y = x + y

identity :: a -> a
identity x = x

-- Maybe type
safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide x y = Just (x `div` y)

-- Either type
parseInt :: String -> Either String Int
parseInt str = 
  case reads str of
    [(n, "")] -> Right n
    _ -> Left "Parse error"

-- Custom data types
data Color = Red | Green | Blue | RGB Int Int Int
  deriving (Show, Eq)

type Person = (String, Int, Float)  -- (name, age, gpa)

-- Record syntax
data Student = Student {
  name :: String,
  age :: Int,
  gpa :: Float
} deriving (Show)

-- Day enum with manual instances
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show)

instance Eq Day where
  Monday == Monday = True
  Tuesday == Tuesday = True
  Wednesday == Wednesday = True
  Thursday == Thursday = True
  Friday == Friday = True
  Saturday == Saturday = True
  Sunday == Sunday = True
  _ == _ = False

main :: IO ()
main = do
  putStrLn "=== TYPE SYSTEM ==="
  
  putStrLn "\n1. Basic Types:"
  print $ add 10 20
  print $ identity "Hello"
  print $ identity 42
  
  putStrLn "\n2. Maybe Type:"
  print $ safeDivide 10 2
  print $ safeDivide 10 0
  
  putStrLn "\n3. Either Type:"
  print $ parseInt "123"
  print $ parseInt "abc"
  
  putStrLn "\n4. Custom Data Types:"
  print $ Red
  print $ RGB 255 0 0
  print $ (Red == Green)
  print $ (RGB 255 0 0 == RGB 255 0 0)
  
  putStrLn "\n5. Type Alias & Record:"
  let person = ("Alice", 25, 3.8)
  print person
  
  let student = Student {name = "Bob", age = 22, gpa = 3.9}
  print student
  print $ name student
  
  putStrLn "\n6. Manual Type Class:"
  print $ (Monday == Monday)
  print $ (Monday == Tuesday)
  
  putStrLn "\n=== END ==="
-- Save as: BasicIO.hs
module BasicIO where

-- Simple I/O
helloWorld :: IO ()
helloWorld = putStrLn "Hello, World!"

-- Interactive program
greetUser :: IO ()
greetUser = do
  putStr "Enter your name: "
  name <- getLine
  putStrLn $ "Hello, " ++ name ++ "!"

-- Calculator I/O
calculatorIO :: IO ()
calculatorIO = do
  putStrLn "Simple Calculator"
  putStr "Enter first number: "
  num1 <- getLine
  putStr "Enter second number: "
  num2 <- getLine
  putStr "Enter operation (+, -, *, /): "
  op <- getLine
  
  let result = case op of
        "+" -> show (read num1 + read num2)
        "-" -> show (read num1 - read num2)
        "*" -> show (read num1 * read num2)
        "/" -> if read num2 == 0 
               then "Error: Division by zero"
               else show (read num1 / read num2)
        _   -> "Error: Invalid operation"
  
  putStrLn $ "Result: " ++ result

-- File I/O
writeToFile :: FilePath -> String -> IO ()
writeToFile filename content = do
  writeFile filename content
  putStrLn $ "Written to " ++ filename

readFromFile :: FilePath -> IO ()
readFromFile filename = do
  contents <- readFile filename
  putStrLn $ "Contents of " ++ filename ++ ":\n" ++ contents

-- Menu system
menu :: IO ()
menu = do
  putStrLn "\n=== MENU ==="
  putStrLn "1. Greet"
  putStrLn "2. Calculator"
  putStrLn "3. File Demo"
  putStrLn "4. Exit"
  putStr "Choose option: "
  choice <- getLine
  
  case choice of
    "1" -> do
      greetUser
      menu
    "2" -> do
      calculatorIO
      menu
    "3" -> do
      writeToFile "demo.txt" "This is a demo file.\nCreated by Haskell program."
      readFromFile "demo.txt"
      menu
    "4" -> putStrLn "Goodbye!"
    _ -> do
      putStrLn "Invalid choice, try again"
      menu

main :: IO ()
main = do
  putStrLn "=== BASIC I/O OPERATIONS ==="
  helloWorld
  putStrLn ""
  menu
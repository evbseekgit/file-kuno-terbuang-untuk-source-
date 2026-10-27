-- Save as: AllModules.hs
module Main where

import Fundamental (main as fundamentalMain)
import TypeSystem (main as typeMain)
import Recursion (main as recursionMain)
import HigherOrder (main as higherOrderMain)
import ListComprehension (main as listCompMain)
import ListManipulation (main as listManipMain)
import ErrorHandling (main as errorMain)
import BasicIO (main as ioMain)

main :: IO ()
main = do
  putStrLn "=== HASKELL UAS COMPREHENSIVE REVIEW ==="
  
  putStrLn "\nPilih modul yang ingin dijalankan:"
  putStrLn "1. Fundamental Haskell Syntax"
  putStrLn "2. Type System"
  putStrLn "3. Recursion"
  putStrLn "4. Higher-Order Functions"
  putStrLn "5. List Comprehensions"
  putStrLn "6. List Manipulation"
  putStrLn "7. Error Handling"
  putStrLn "8. Basic I/O"
  putStrLn "9. Keluar"
  
  putStr "\nMasukkan pilihan (1-9): "
  choice <- getLine
  
  case choice of
    "1" -> fundamentalMain
    "2" -> typeMain
    "3" -> recursionMain
    "4" -> higherOrderMain
    "5" -> listCompMain
    "6" -> listManipMain
    "7" -> errorMain
    "8" -> ioMain
    "9" -> putStrLn "Terima kasih!"
    _ -> do
      putStrLn "Pilihan tidak valid"
      main
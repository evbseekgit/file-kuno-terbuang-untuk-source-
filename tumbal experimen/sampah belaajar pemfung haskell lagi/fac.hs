fac :: Int -> Int
fac x
  | x == 0 = 1
  | otherwise = x * fac (x - 1)

main :: IO ()
main = do
  putStrLn "factorial !"
  x <- readLn :: IO Int
  if x < 0
    then putStrLn "massukkan angka valid"
    else print (fac x)
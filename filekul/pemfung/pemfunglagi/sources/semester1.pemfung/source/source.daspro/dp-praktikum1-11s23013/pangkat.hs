pang :: Int -> Int -> Int
pang a x = if x == 0 then 1
            else a * pang (a (x-1)
main :: IO ()
main = do

    a <- readLn :: Int IO
    x <- readLn :: Int IO

    print (pang a x-1)
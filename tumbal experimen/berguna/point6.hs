data Point = Point Int Int deriving (Show)

-- Calculate distance between points
distance :: Point -> Point -> Float
distance (Point x1 y1) (Point x2 y2) =
    sqrt (fromIntegral ((x2 - x1)^2 + (y2 - y1)^2))

-- Program interaktif
main :: IO ()
main = do
    putStrLn "=== Point Distance Calculator ==="
    
    putStr "Masukkan x1: "
    x1 <- readLn
    putStr "Masukkan y1: "
    y1 <- readLn
    putStr "Masukkan x2: "
    x2 <- readLn
    putStr "Masukkan y2: "
    y2 <- readLn
    
    let point1 = Point x1 y1
    let point2 = Point x2 y2
    let dist = distance point1 point2
    
    putStrLn $ "Point 1: " ++ show point1
    putStrLn $ "Point 2: " ++ show point2
    putStrLn $ "Jarak antara kedua point: " ++ show dist
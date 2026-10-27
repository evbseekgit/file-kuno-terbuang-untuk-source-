data Point = Point Int Int deriving (Show, Eq)

-- Map grid 10x10
type Grid = [[Point]]

-- Buat grid points
createGrid :: Int -> Int -> Grid
createGrid width height =
    [ [ Point x y | x <- [0..width-1] ] | y <- [0..height-1] ]

-- Cari tetangga suatu point
getNeighbors :: Point -> Grid -> [Point]
getNeighbors (Point x y) grid =
    [ Point (x+dx) (y+dy) | dx <- [-1,0,1], dy <- [-1,0,1], 
                           (dx, dy) /= (0,0), isValid (x+dx) (y+dy) ]
    where
        isValid x' y' = x' >= 0 && y' >= 0 && 
                       x' < length (head grid) && y' < length grid

main :: IO ()
main = do
    putStrLn "=== Map Grid System ==="
    
    let grid = createGrid 3 3
    putStrLn "3x3 Grid:"
    mapM_ print grid
    
    let center = Point 1 1
    putStrLn $ "Neighbors of " ++ show center ++ ":"
    print $ getNeighbors center grid
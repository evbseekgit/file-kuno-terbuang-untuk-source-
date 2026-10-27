data Point = Point Float Float deriving (Show)

-- Posisi karakter dalam game
playerPosition :: Point
playerPosition = Point 100.0 50.0

enemyPosition :: Point  
enemyPosition = Point 120.0 60.0

-- Movement functions
moveUp :: Point -> Float -> Point
moveUp (Point x y) distance = Point x (y - distance)

moveDown :: Point -> Float -> Point
moveDown (Point x y) distance = Point x (y + distance)

moveLeft :: Point -> Float -> Point
moveLeft (Point x y) distance = Point (x - distance) y

moveRight :: Point -> Float -> Point
moveRight (Point x y) distance = Point (x + distance) y

-- Cek collision sederhana
isColliding :: Point -> Point -> Bool
isColliding (Point x1 y1) (Point x2 y2) =
    abs (x1 - x2) < 10 && abs (y1 - y2) < 10

main :: IO ()
main = do
    putStrLn "=== Game Character Positions ==="
    let newPlayerPos = moveRight (moveDown playerPosition 5.0) 15.0
    print $ "Posisi player: " ++ show newPlayerPos  -- Point 115.0 55.0
    
    putStrLn $ "Collision dengan enemy: " ++ show (isColliding newPlayerPos enemyPosition)
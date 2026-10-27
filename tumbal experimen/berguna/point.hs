-- Definisi tipe data Point
data Point = Point Int Int deriving (Show, Eq)

-- Membuat point
origin :: Point
origin = Point 0 0

pointA :: Point
pointA = Point 5 10

pointB :: Point
pointB = Point 3 7

-- Operasi dasar
translate :: Point -> Int -> Int -> Point
translate (Point x y) dx dy = Point (x + dx) (y + dy)

-- Contoh penggunaan
main :: IO ()
main = do
    putStrLn "=== Contoh Basic Point ==="
    print origin                    -- Point 0 0
    print pointA                    -- Point 5 10
    print $ translate pointA 2 3    -- Point 7 13
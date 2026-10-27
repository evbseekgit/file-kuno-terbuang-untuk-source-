data Point = Point Int Int deriving (Show)

-- Membentuk shape dari points
type Shape = [Point]

-- Buat rectangle dari dua points
createRectangle :: Point -> Point -> Shape
createRectangle (Point x1 y1) (Point x2 y2) =
    [ Point x1 y1, Point x2 y1, Point x2 y2, Point x1 y2, Point x1 y1 ]

-- Buat triangle
createTriangle :: Point -> Point -> Point -> Shape
createTriangle p1 p2 p3 = [p1, p2, p3, p1]

-- Scale shape
scaleShape :: Int -> Shape -> Shape
scaleShape factor = map (\(Point x y) -> Point (x * factor) (y * factor))

main :: IO ()
main = do
    putStrLn "=== Shape Drawing ==="
    
    let rect = createRectangle (Point 1 1) (Point 4 3)
    putStrLn "Rectangle points:"
    print rect
    
    let triangle = createTriangle (Point 0 0) (Point 2 0) (Point 1 2)
    putStrLn "Triangle points:"
    print triangle
    
    let scaledRect = scaleShape 2 rect
    putStrLn "Scaled rectangle:"
    print scaledRect
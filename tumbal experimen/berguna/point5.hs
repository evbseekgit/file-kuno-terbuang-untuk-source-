data Point = Point Float Float deriving (Show)

-- Object dengan position dan velocity
data GameObject = GameObject {
    position :: Point,
    velocity :: Point
} deriving (Show)

-- Update position berdasarkan velocity
updatePosition :: GameObject -> GameObject
updatePosition obj = obj {
    position = addPoints (position obj) (velocity obj)
}

-- Tambah dua points
addPoints :: Point -> Point -> Point
addPoints (Point x1 y1) (Point x2 y2) = Point (x1 + x2) (y1 + y2)

-- Apply gravity
applyGravity :: GameObject -> GameObject
applyGravity obj = obj {
    velocity = addPoints (velocity obj) (Point 0 (-0.5))
}

main :: IO ()
main = do
    putStrLn "=== Physics Simulation ==="
    
    let ball = GameObject (Point 0 10) (Point 2 0)
    putStrLn "Initial state:"
    print ball
    
    let afterGravity = applyGravity ball
    putStrLn "After gravity:"
    print afterGravity
    
    let finalState = updatePosition afterGravity
    putStrLn "Final state:"
    print finalState
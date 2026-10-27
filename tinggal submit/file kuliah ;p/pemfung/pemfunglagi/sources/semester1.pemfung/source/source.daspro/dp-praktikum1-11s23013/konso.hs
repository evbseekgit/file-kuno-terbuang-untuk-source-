data List = List {[]} deriving Show

isEmpty :: List -> Bool
isEmpty = if l == [] 

tail :: List -> List
tail (_:a) = a

nbElmt :: List -> Int
nbElmt l =
            if isEmpty l then 0
                else 1 + nbElmt (tail l)
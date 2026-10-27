NbElmt :: BinTree a -> Int
NbElmt p
  | isTreeEmpty p = 0
  | isOneElmt p = 1
  | isBiner p = NbElmt (left p) + 1 + NbElmt (right p)
  | isUnerLeft p = NbElmt (left p) + 1
  | isUnerRight p = 1 + NbElmt (right p) 
  | otherwise = 0
where
  left (node _ 1 _) = 1
  right (node _ _ r) = r
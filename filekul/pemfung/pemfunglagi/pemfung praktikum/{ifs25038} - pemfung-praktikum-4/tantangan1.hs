classificationAnimal :: Int -> Int -> Int -> String
classificationAnimal p1 p2 p3 =
  if p1 == 1 
    then if p2 == 1
      then if p3 == 1
        then "Vertebrata \n Warm-Blooded \n Mammals \n Bear, Tiger, Whale "
        else if p3 == 2
          then "Vertebrata \n Warm-Blooded \n Birds \n Ostrich, Peacock, Eagle" 
          else if p3 > 2
            then "Vertebrata\nWarm-Blooded"
            else "Tidak Ada"
      else if p2 == 2
        then if p3 == 1
          then "Vertebrata\n Cold-Blooded\nFish\n Salmon, Goldfish, Guppy"
          else if p3 == 2
            then "Vertebrata\nCold-Blooded\nReptiles\nTurtle, Crocodile, Snake"
            else if p3 == 3
              then "Vertebrata\nCold-Blooded\nAmphibians\nFrog, Toad, Newt"
              else if p3 > 3
                then "Vertebrata\nCold-Blooded"
                else "Tidak Ada"
      else if p2 >2 
        then "Vertebrata"
        else "Tidak Ada"
  else if p1 == 2
    then if p2 == 1
      then if p3 == 1
        then "Invertebrata\nWith Jointed Legs\nWith 3 pairs of legs\n Ant, Cockroach, Ladybug"
        else if p3 == 2
          then "Invertebrata\nWith Jointed Legs\nWith more than 3 pairs of legs\n Scorpion, Spider, Millipede"
          else if p3 > 2
            then "Invertebrata\nWith Jointed Legs"
            else "Tidak Ada"
    else if p2 == 2
      then if p3 == 1
        then "Invertebrata\nWithout Legs\nWorm-like\nEarthworm, Leech"
        else if p3 == 2
          then "Invertebrata\nWithout Legs\nNot-worm like\nFluke Worm, Tapeworm"
          else if p3 > 2
            then "Invertebrata\nWithout Legs"
            else "Tidak Ada"
      else if p2 > 2
        then "Invertebrata"
        else "Tidak Ada"
  else "Tidak Ada"      

main :: IO ()
main = do

  p1 <- readLn :: IO Int
  p2 <- readLn :: IO Int
  p3 <- readLn :: IO Int

  putStrLn (classificationAnimal p1 p2 p3)
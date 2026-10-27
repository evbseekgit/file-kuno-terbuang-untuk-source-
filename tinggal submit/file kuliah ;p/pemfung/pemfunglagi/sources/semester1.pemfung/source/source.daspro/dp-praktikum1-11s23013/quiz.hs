data Hour = Hour {hh :: Int , mm :: Int , ss :: Int} deriving Show

makeHour :: Int -> Int -> Int -> Hour
makeHour a b c = Hour {hh = a , mm = b , ss = c}

hour :: Hour -> Int
hour w = hh w

minute :: Hour -> Int
minute w = mm w

second :: Hour -> Int
second w = ss w

hourToSecond :: Hour -> Int
hourToSecond a = hh a * 3600 + mm a * 60 + ss a

secondToHour :: Int -> Hour
secondToHour a = Hour {hh = a `div`3600,
                       mm = (a `mod`3600) `div`60,
                       ss = a `mod` 60}

convert24To12 :: Hour -> String
convert24To12 a = if hh a < 10 && mm a < 10 && ss a < 10 then "0" ++ show (hh a) ++ ":" ++ "0" ++ show (mm a) ++ ":" ++ "0" ++ show (ss a) ++ " AM"
                    else if hh a < 10 && mm a < 10 then "0" ++ show (hh a) ++ ":" ++ "0" ++ show (mm a) ++ ":" ++ show (ss a) ++ " AM"
                    else if hh a < 10  then "0" ++ show (hh a) ++ ":" ++ show (mm a) ++ ":" ++ show (ss a) ++ " AM"
                    else if hh a > 12 && mm a < 10 && ss a < 10 then "0" ++ show (hh a - 12) ++ ":" ++ "0" ++ show (mm a) ++ ":" ++ "0" ++ show (ss a) ++ " PM"
                    else if hh a > 12 && mm a < 10 then "0" ++ show (hh a - 12) ++ ":" ++ "0" ++ show (mm a) ++ ":" ++ show (ss a) ++ " PM"
                    else if hh a > 12  then show (hh a - 12) ++ ":" ++ show (mm a) ++ ":" ++ show (ss a) ++ " PM"
                    else "0" ++ show (hh a) ++ ":" ++ show (mm a) ++ ":" ++ show (ss a) ++ " AM"
                    
-- convert12To24 :: Int -> Int -> Int -> String -> Hour
-- convert12To24 hh mm ss period =
--     case period of
--         "AM" -> if hh == 12 then makeHour 0 mm ss else makeHour hh mm ss
--         "PM" -> if hh == 12 then makeHour 12 mm ss else makeHour (hh + 12) mm ss

addHour :: Hour -> Hour -> Hour
addHour w a = secondToHour (hourToSecond w + hourToSecond a)

subHour :: Hour -> Hour -> Hour
subHour w a = if hourToSecond w - hourToSecond a > 0 then secondToHour (hourToSecond w - hourToSecond a)
                else secondToHour ((-1)*(hourToSecond w - hourToSecond a))

isEqD :: Hour -> Hour -> Bool
isEqD w a = hourToSecond w == hourToSecond a

isNotEqD :: Hour -> Hour -> Bool
isNotEqD w a = if isEqD w a == True then False
                  else True

main :: IO ()
main = do
  h1 <- readLn :: IO Int
  m1 <- readLn :: IO Int
  s1 <- readLn :: IO Int
  h2 <- readLn :: IO Int
  m2 <- readLn :: IO Int
  s2 <- readLn :: IO Int

  let j1 = makeHour h1 m1 s1
      j2 = makeHour h2 m2 s2

  print (hour j1)
  print (hour j2)
  print (hourToSecond j1)
  print (hourToSecond j2)
  print (secondToHour (hourToSecond j1))
  print (secondToHour (hourToSecond j2))
  print (convert24To12 j1)
  print (convert24To12 j2)
  -- print (convert12To24 j1)
  -- print (convert12To24 j2)
  print (addHour j1 j2)
  print (subHour j1 j2)
  print (isEqD j1 j2)
  print (isNotEqD j1 j2)
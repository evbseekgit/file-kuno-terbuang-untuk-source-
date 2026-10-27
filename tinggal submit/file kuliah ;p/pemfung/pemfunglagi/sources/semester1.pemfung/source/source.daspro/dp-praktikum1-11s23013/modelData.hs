main :: IO()
main = do
    -- 1) Data Number
    -- mendeklarasikan bilangan bulat
    let dataInt = 42
    -- mendeklarasikan bilangan riil
    let dataDouble = 3.14
    -- menampilkan number
    print dataInt
    print dataDouble

    -- 2) Data Character
    -- mendeklarasikan Character
    let dataChar = 'A'
    -- menampilkan Character
    print dataChar

    -- 3) Data String
    -- mendeklarasikan String
    let dataStr = "Belajar bahasa pemrograman Haskell bersama "
    let dataStr2 = "Wesly Ambarita"
    -- menampilkan String
    putStrLn dataStr
    putStrLn dataStr2

    -- 4) Data Boolean
    -- mendeklarasikan boolean
    let dataBool = True
    -- menampilkan boolean
    print dataBool

    -- 5) Data List 
    -- mendeklarasikan list
    let myList = [6, 9, 1999]
    -- menampilkan list
    print myList

    -- 6) Data Tuple 
    -- mendeklarasikan list
    let myTuple = (3, '-', 5.0, False)
    -- menampilkan tuple
    print myTuple

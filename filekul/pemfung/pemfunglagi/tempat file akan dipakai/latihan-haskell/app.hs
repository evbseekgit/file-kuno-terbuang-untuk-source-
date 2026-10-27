import Text.Printf

main :: IO ()
main = do
    nama <- getLine

    printf "Hello, %s!\n" nama

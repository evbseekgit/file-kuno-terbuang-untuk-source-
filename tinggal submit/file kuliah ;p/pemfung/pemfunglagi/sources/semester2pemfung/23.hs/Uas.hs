-- Main.hs
-- Perkenalkan Saya
-- Evan Benta Purba \\ 11S25038

module Main where

import qualified Mahasiswa as M
import qualified Buku as B
import qualified Ruangan as R
import qualified Keuangan as K

main :: IO ()
main = do
  putStrLn "=== SISTEM PERPUSTAKAN UNIVERSITAS ===\n"
  B.main  -- Memanggil main dari modul Buku
  putStrLn ""
  M.main  -- Memanggil main dari modul Mahasiswa
  putStrLn ""
  R.main  -- Memanggil main dari modul Ruangan
  putStrLn ""
  K.main  -- Memanggil main dari modul Keuangan
  putStrLn "\n=== SELESAI ==="
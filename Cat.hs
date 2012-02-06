import Data.List

main :: IO ()
main = interact $ unlines . foldr (:) [] . lines

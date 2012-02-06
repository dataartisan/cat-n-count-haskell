import Data.List
import System.IO

f :: (Int, [a]) -> a -> (Int, [a])
f (n, xs) x = let n' = n + 1 ; xs' = xs ++ [x] in n' `seq` xs' `seq` (n', xs')
z :: (Int, [a])
z = (0, [])

catNCount :: [a] -> (Int, [a])
catNCount = foldl' f z

unparse :: Show s => (s, [String]) -> [String]
unparse (s, xs) = xs ++ [show s]

main :: IO ()
main = interact $ unlines . unparse . catNCount . lines

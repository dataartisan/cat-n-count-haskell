import Data.List
import System.IO

-- heap overflow without `seq`
-- constituent for paramorphism
f :: Int -> String -> (Int, String)
f n x = let n' = n + 1 in n' `seq` (n', x)
z :: Int
z = 0

-- stack overflow with mapAccumR
catNCount :: [String] -> (Int, [String])
catNCount = mapAccumL f z

unparse :: Show s => (s, [String]) -> [String]
unparse (s, xs) = xs ++ [show s]

main :: IO ()
main = interact $ unlines . unparse . catNCount . lines

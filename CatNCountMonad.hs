import System.IO

-- stack overflow without `seq`
mainLoop :: Int -> IO ()
mainLoop count = count `seq` do
  eof <- isEOF
  if eof
    then
      putStrLn $ show count
    else do
      line <- getLine
      putStrLn line
      mainLoop $ count + 1

main :: IO ()
main = mainLoop 0

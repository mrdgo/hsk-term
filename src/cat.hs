import           Data.Foldable
import           System.Environment
import           System.IO

cat :: FilePath -> IO ()
cat [] = return ()
cat s  = readFile s >>= \ lines -> putStr lines

main = getArgs >>= \ args -> if length args < 1
                                then putStrLn "Usage: ./Main <filename>"
                                else cat $ args !! 0

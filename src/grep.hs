-- simple grep
import           System.Environment
import           System.IO

type Pattern = String

matchLine :: Eq a => [a] -> [a] -> Bool
matchLine [] _ = True
matchLine _ [] = False
matchLine (p:xp) (l:xl)
    | p == l = prefix xp xl
    | otherwise = matchLine (p:xp) xl

prefix :: Eq a => [a] -> [a] -> Bool
prefix [] _  = True
prefix _ []  = False
prefix (x:xs) (y:ys)
    | x == y = prefix xs ys
    | otherwise = False

grep :: Pattern -> FilePath -> IO ()
grep p f =
    readFile f >>= \text ->
        sequence_ . map putStrLn $ filter (matchLine p) (lines text)

main =
    getArgs >>=
        \ args ->
                if (length args) == 2 then
                    grep (head args) (last args)
                else
                    print "Parse failed."



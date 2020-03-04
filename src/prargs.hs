import           Data.Foldable
import           System.Environment
import           System.IO
-- getArgs :: IO [String]
-- putStr :: String -> IO ()
-- fmap :: Functor f => (a -> b) -> f a -> f b
--  map ::              (a -> b) -> [a] -> [b]
-- (>>=) :: IO a -> (a -> IO b) -> IO b
-- sequence :: (Monad m, Traversable t) => t (m a) -> m (t a)

-- Write each argument in a seperate line.
-- Lambda: [String] -> IO ()
-- sequence :: [IO ()] -> IO ()
main = getArgs >>= \args -> sequence $ map putStrLn args


--module RpnCalc where

import Text.Read (readMaybe)

data Token = Number Int | Operator (Int -> Int -> Int)

parseToken :: String -> Maybe Token
parseToken "+" = Just (Operator (+))
parseToken "-" = Just (Operator (-))
parseToken "/" = Just (Operator div)
parseToken "*" = Just (Operator (*))
parseToken str = fmap Number (readMaybe str)

tokenise :: String -> Maybe [Token]
tokenise = sequence . fmap parseToken . words 
-- map is also applicable here cause we fmap on the list
-- another neat soln: tokenise = mapM parsetoken . words
-- mapM :: (a -> Maybe b) -> [a] -> Maybe [b]

newtype Calc a = C ([Int] -> Maybe ([Int], a))

pop :: Calc Int
pop = C subpop where
  subpop :: [Int] -> Maybe ([Int], Int)
  subpop [] = Nothing
  subpop (x:xs) = Just (xs, x)
{- Alternative solution by Curtis
pop = C $ (fmap swap) . uncons
swap :: (a, b) -> (b, a)
uncons :: [a] -> Maybe (a, [a])
n.b. these are from Data.Tuple and Data.List respectively
-}

push :: Int -> Calc ()
push i = C $ subpush i where
  subpush :: Int -> [Int] -> Maybe ([Int], ())
  subpush l ls = Just ((l:ls), ())
{- Alternative solution by Curtis
push x = C $ \xs -> Just ((x:xs), ())
-}

instance Functor Calc where
  fmap f (C sa) = C $ \s ->
      case sa s of 
        Nothing      -> Nothing
        Just (s', a) -> Just (s', f a)

instance Applicative Calc where
  pure x = C (\s -> Just (s,x))
  C sf <*> C sx = C $ \s -> 
      case sf s of 
          Nothing     -> Nothing
          Just (s',f) -> case sx s' of
              Nothing      -> Nothing
              Just (s'',x) -> Just (s'', f x)

instance Monad Calc where
  return = pure
  C sa >>= f = C $ \s -> 
      case sa s of 
          Nothing     -> Nothing
          Just (s',a) -> unwrapCalc (f a) s'
    where unwrapCalc (C a) = a

evaluate :: [Token] -> Calc Int
evaluate [] = pop
evaluate ((Number n):ns) = push n >> evaluate ns
evaluate ((Operator o):ns) = do
  a <- pop
  b <- pop
  push (b `o` a)
  evaluate ns
{- Notes from curtis
  evaluate ((Number n):ns) = push n >> evaluate ns 
could be written as
  evaluate ((Number n):ns) = do
    push n
    evaluate ns

-}

calculate :: String -> Maybe Int
calculate s = fmap evaluate (tokenise s) >>= runCalc
{- Notes from Curtis (n.b. this negates the need for runCalc)
calculate s = do
  ts <- tokenise s
  let C calc = evaluate ts
  snd <$> calc []
-}

runCalc :: Calc a -> Maybe a
runCalc calc = fmap snd $ let (C f) = calc in f []


main :: IO ()
main = do
  x <- getLine
  putStrLn . show . calculate $ x
  main
  

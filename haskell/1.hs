-- stack repl -- opens repl`
-- double.hs -- loads module into the repl
-- :set +t -- prints type hints
-- :t double -- prints type of val
double :: Integer -> Integer
double x = x * 2

-- Basic factorial impl
factN :: Integer -> Integer
factN x =
  if x == 0
    then 1
    else x * factN (x - 1)

-- Multiple entry points (order matters)
fact :: Integer -> Integer
fact 0 = 1
fact x = x * fact (x - 1)

-- Using guards
factorial :: Integer -> Integer
factorial x
  | x > 1 = x * factorial (x - 1)
  | otherwise = 1

second :: [Integer] -> Integer
second l = head (tail l)

-- is equivalent for
-- second l = head . tail
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibTuple (x, y, 0) = (x, y, 0)
fibTuple (x, y, i) = fibTuple (y, x + y, i - 1)

fibResult :: (Integer, Integer, Integer) -> Integer
fibResult (x, y, index) = x

fibN :: Integer -> Integer
fibN x = fibResult (fibTuple (0, 1, x))

-- Alternative fib sequence impl
fibNextPair :: (Integer, Integer) -> (Integer, Integer)
fibNextPair (x, y) = (y, x + y)

fibNthPair :: Integer -> (Integer, Integer)
fibNthPair 1 = (1, 1)
fibNthPair n = fibNextPair (fibNthPair (n - 1))

fibA :: Integer -> Integer
fibA = fst . fibNthPair

-- Lists
-- Destructive assignment
-- let (head:tail) = [1,2,3,4,5]
allEven :: [Integer] -> [Integer]
allEven [] = []
allEven (head:tail) =
  if even head
    then head : allEven tail
    else allEven tail

-- Ranges
range :: Integer -> [Integer]
range 0 = []
range n = [0 .. n]

rangeWithStep :: (Integer, Integer, Integer) -> [Integer]
rangeWithStep (from, to, step) = [from,from + step .. to]

-- Sequences
takeN :: Int -> [Integer]
takeN n = take n [1 ..]

-- List comprehension (very similar to Erlang)
doubleAll :: [Integer] -> [Integer]
doubleAll l = [i * 2 | i <- l]

swapTupleItems :: [(Integer, Integer)] -> [(Integer, Integer)]
swapTupleItems l = [(y, x) | (x, y) <- l]

-- Cartesian product
computeCartesianProduct :: [String] -> [[String]]
computeCartesianProduct lst = [[a, b] | a <- lst, b <- lst, a /= b]

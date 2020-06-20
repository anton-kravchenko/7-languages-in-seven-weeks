-- Lambdas
concat = (\a b -> a ++ b)

str = \a b -> a ++ b "Haskell " "lang"

doubleAll = (\lst -> map (\n -> n * 2) lst)

squareAll = map square
  where
    square x = x * x

-- "Section" (+ 1) is a "partially" applied function
addOne = map (+ 1)

-- Also partial application
-- All of the multi-argument functions are curried (allow for partial application)
filterOdd = filter odd

-- Lazy evaluation
mRange start step = start : mRange (start + step) step

rangeValues = take 10 (mRange 0 1)

-- Lazy fibonacci sequence
lazyFib x y = x : lazyFib y (x + y)

fib = lazyFib 1 1 -- <-- lazy sequence

fibNth n = take n fib !! (n - 1)

-- take 5 (drop 20 (lazyFib 1 1))
-- take 5(zip fib fib) --> [(1,1),(1,1),(2,2),(3,3),(5,5)]
f = zipWith (+) lazyFib 1 1 lazyFib 2 2

-- take 10 (map (* 2) [1..])
--
--
-- Function composition (F1 . F2)
multiplyFibSequenceByTen n = map ((* 5) . (* 2)) (take n fib)

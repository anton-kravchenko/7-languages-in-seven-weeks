isEven n = n `mod` 2 == 0

allEven :: [Integer] -> [Integer]
allEven = filter isEven -- filter func seems to be curried

reverseList :: [Integer] -> [Integer]
reverseList []          = []
reverseList (head:tail) = reverseList tail ++ [head]

buildTuples :: [[String]]
buildTuples = [[a, b] | a <- ["black", "blue"], b <- ["black", "blue"], a /= b]

multiplicationTable :: [[Integer]]
multiplicationTable = [[1 .. 12], [1 .. 12], [a * a | a <- [1 .. 12]]]

import           Data.Char
import           Data.List

sortList :: [Integer] -> [Integer]
sortList list = sort list

sortListBy :: [a] -> (a -> a -> Ordering) -> [a]
sortListBy list comp = sortBy comp list

parseFloat :: String -> Float
parseFloat rawStr = read parsedVal :: Float
  where
    parsedVal =
      foldl
        (\parsed c ->
           if isDigit c || c == '.'
             then parsed ++ [c]
             else parsed)
        ""
        rawStr

everyThird x = [x,(x + 3) ..]

everyFifth x = [x,(x + 5) ..]

everyEight = zipWith (+) (everyThird 0) (everyFifth 0)

divideByTwo = (/ 2)

addNewLine = (++ "\n")

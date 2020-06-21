import           Data.Maybe

data Bool = True
    | False

data Suit = Spades
    | Hearts
    deriving (Show)

data Rank = Ten
    | Jack
    | Queen
    | King
    | Ace
    deriving (Show)

type Card = (Suit, Rank)

type Hand = [Card]

value :: Rank -> Integer
value Ten   = 1
value Jack  = 2
value Queen = 3
value King  = 4
value Ace   = 5

cardValue :: Card -> Integer
cardValue (suite, rank) = value rank

backwards :: [a] -> [a]
backwards []          = []
backwards (head:tail) = backwards tail ++ [head]

-- Trio is a "data constructor"
data Triplet a = Trio a a a
    deriving (Show)

-- Tree is a "type constructor"
-- Leaf and Node are "data constructors"
data Tree a = Node [Tree a]
    | Leaf a
    deriving (Show)

-- let tree = Node[Leaf 1, Node[Leaf 2, Leaf 3]]
-- Determines depth of a Tree
depth (Leaf _) = 1
depth (Node n) = 1 + maximum (map depth n)

-- Monads
-- All monads have 3 components:
-- - a type construct based on some type of a container
-- - a function called `return` that wraps up a function and puts it to the container
-- - a bind function called `>>=` that unwraps a function
--
-- All monads satisfy 3 rules:
-- - it should be possible to create a monad using a type constructor that will work with a type that can hold a value
-- - it should be possible to wrap and un-wrap values without loss of the information
-- - nesting bind functions should be the same as calling them sequentially -> ((m >>= f) >>= g = m >>= (\x -> f x >>= g))
newtype Position t =
  Position t
  deriving (Show)

stagger (Position d) = Position (d + 2)

crawl (Position d) = Position (d + 1)

rtn x = x

x >>== f = f x

treasureMap pos = pos >>== stagger >>== stagger >>== crawl >>== rtn

tryIo = do
  putStr "Enter your name: "
  line <- getLine
  let backwards = reverse line
  return ("Your name backwards is " ++ backwards)

-- Maybe Monad
data MaybeT a = JustT a
    | NothingT

-- Pattern matching
printIt :: Maybe String -> IO ()
printIt maybeStr =
  case maybeStr of
    Nothing  -> putStr "It's nothing\n"
    Just str -> putStr ("It's " ++ str ++ "\n")

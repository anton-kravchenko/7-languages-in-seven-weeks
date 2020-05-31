(defmacro unless [test t-branch f-branch]
  (list 'if (list 'not test) t-branch f-branch))

(unless false (print "TRUE branch") (print "FALSE branch"))

(defprotocol Point
  (move [this x y]))

(defrecord PointImpl [x y]
  Point
  (move [this dx dy] (PointImpl. (+ x dx) (+ y dy)))
  Object
  (toString [this] (str  "Point => x=" x "; y=" y)))

(str (move (PointImpl. 10 20) 5 10)); => "Point => x=15; y=30"

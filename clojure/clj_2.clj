(defn size [v]
  (if (empty? v)
    0
    (inc (size (rest v)))))

; JVM doesn't support tail recursion so tail optimization is only available via loop and recur
(defn size_r [v]
  (loop [l v, acc 0]
    (if (empty? l)
      acc
      (recur (rest l) (inc acc)))))

; Sequence - implementatin-endependent absctactin around containers in Clojure
; Test functiono
(every? number? [1 2 3]) ; true
(some nil? [1 2 nil]) ; true

(not-every? number? [1 2 3]) ; false
(not-any? nil? [1 2 nil]) ; false


(def words ["luke" "chewie" "han" "lando"])
(filter #(> (count %) 4) words)
; or
(filter (fn [word] (> (count word) 4)) words)
(map (fn [i] (* i i)) [1 2 3 4 5])

; List comprehension
(def colors ["red" "blue"])
(def toys ["block" "car"])

(for [i colors] (str ">>>" i)) ; Bind to 1 list
(for [color colors, toy toys] (str color ">>>" toy)) ; Bing to 2 lists

(defn small-word? [word] (> 4 (count word)))
; List comprehension with filtering via :when
(for [color colors, toy toys, :when (small-word? toy)] (str color ">>>" toy))

; reduce
(reduce + [1 2 3 4 5])
(reduce * [1 2 3 4 5])

; sort
(sort [5 4 3 2 1])
(defn abs [x] (if (> x 0) x (- x)))
(sort-by abs [-1 -4 3 2])

; Finite sequences
(range 1 10)
; equivalent of
(range 10)

; Intinite sequences
(take 3 (repeat "Use the Force, Luke"))
; equivalent of
(take 5 (cycle ["Use the Force, Luke"]))

(take 5 (drop 2 (cycle [:one :two :three])))
; equivalent of
(->> [:one :two :three] (cycle) (drop 2) (take 5)) ;(:three :one :two :three :one)

(take 5 (interpose :and (cycle [:one :two :three]))) ;(:one :and :two :and :three)

; join sequences via interleave
(take 20 (interleave (cycle (range 2)) (cycle (range 3))))
; Intinite sequence via iterate
(take 5 (iterate inc 1))

; fibonacci sequence
(defn fib-pair [[a b]] [b, (+ a b)])
(defn fib [n] (map first (take n (iterate fib-pair [0 1]))))

; factorial
(defn fact [n] (reduce * (take n (iterate inc 1))))

(def directions [:norh :east :south :west])
(defn turn
  [base amount]
  (rem (+ base amount) (count directions)))

; Protocols - this is kind of interface
(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))

; Implementation for the protocol
(defrecord SimpleCompass [dir]
  Compass
  (direction [_] (directions dir))
  (left [_] (SimpleCompass. (turn dir 3))) ; <- SimpleCompass. ags - creates an instance
  (right [_] (SimpleCompass. (turn dir 1))) ; <- Like (String. "str") creates string

  Object
  (toString [this] (str "[" (direction this) "]")))

(left (SimpleCompass. 0)) ; Rotate left
(direction (SimpleCompass. 3)); :west
(str (SimpleCompass. 3)); => "[:west]"

; Macros
; quotes ' prevent execution - this builds the "list of code" - data as code
(defmacro unless [test body]
  (list 'if (list 'not test) body))

; Agruments are not evaluated prior to passing to the functino and treated as lists
(unless false (print "TRUE")) ; true

; Prints expanded macros
(macroexpand '(unless condition body)); -> (if (not condition) body)
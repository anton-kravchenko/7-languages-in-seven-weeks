(ns clojure-.core)

(println "Clojure hello")
(/ (/ 12 2) (/ 8 4))
(+ 2 2 2 2 2)
(/ 8 4 2)

; (def castToString [x] (str x))
(str "one: " 1 ", two: " 2 ", three: " 3)

; contcatenatin of characters
(str \f \o \r \c \e)

; characters are not equal strings
(= "a" \a)
(= "a" (str \a)) ; true

; Returns underlying JVM class: java.lang.Boolean
(class true) ;

(if true (println "True branch") (println "False branch"))

(first (list 1 2 3))

; 0 and "" are truthy
(boolean (and "" 0)) ; true

; nil is falsy
(boolean nil); false

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Lists
'(1 2 3)
; equivalent lf
(list 1 2 3)

(first (list 1 2 3))
(last '(:one :two :three))
(rest (list 1 2 3))
; constructing lists
(cons 1 (cons 2 (cons 3 nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Vectors
; idiomatic Clojure uses lists for code and vectors for data
[:one :two 3]

; get n'th
(nth [1 2 3] 2) ; 3
; quivalent with (vectors are also functins that take indexes as arguments)
([1 2 3] 2)

; contacing vectors
(concat [:one] [:two] [3])

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Sets
(def nums #{:one :two :three})
(count nums)
(sort nums)

; create sorted sets
(sorted-set 3 2 1) ;#{1 2 3}

; merge sets
(clojure.set/union #{1,2} #{3})

; compute diff
(clojure.set/difference #{1, 2, 3} #{1,2}) ; #{3}

; add elements
(#{1, 2} 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Maps
{:one 1 :two 2}
; access
({:one 1 :two 2} :one) ; 1
; equivalent of
(:one {:one 1, :two 2})
; merge maps
(merge {:one 1} {:two 2}) ; {:one 1, :two 2}
; merge with resolving same hashes
(merge-with + {:one -1} {:one 2}) ; {:one 1}
; create new association
(assoc {:one 1} :two 2)
; sorted map
(sorted-map :three 3 :two 2 :one 1) ; {:one 1, :three 3, :two 2}

; Functinos
; Syntax 1 (defn <name> [the list f args] (body))
(defn force-it [jedi] (str "Use the force, " jedi)); (force-it "Luke") => "Use the force, Luke"
; Syntax 2 (defn <name> <dest> [args] (body))
(defn force-it-1 "Star wars reference" [jedi] (str "Use the force, " jedi)); (force-it "Luke") => "Use the force, Luke"
; (doc force-it-1) ; prints the docs (description)

; Destructuring
(def line [[0 0] [10 10]])
(defn line-start [[first _]] first)
(defn line-end [[_ second]] second)

(def tic-tac-toe-board [[:x :o :x] [:o :x :x] [:x :x :o]])
(defn center [[_ [_ c _] _]] c)
; with no wildcards after target arg
(defn center-simplified [[_ [_ c]]] c)

; defining variables
(defn center-let [board]
  (let [[_ [_ center]] board] center))

(def person {:name "Jabba" :professino "Gangster"})
(defn get-name [persoon] (let [{persons-name :name}  persoon] (str "The person's name is " persons-name)))

; High order functins
(def people ["Lea", "Han solo"])
(defn count-length [words] (map count words))

; Anonymous function
(def double-len (fn [word] (* 2 (count word))))
(defn twice-count [words] (map double-len words))
; equivalent of - where # is a "reader macro"
(defn twice-count-s [words] (map #(* 2 (count %))) words)

(def v [1 2 3])
(defn sum [nums] (apply + nums))
(defn max-num [nums] (apply max nums))
(defn less-than-three [nums] (filter #(< % 3) nums))
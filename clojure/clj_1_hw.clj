(defn big [st n] (> (count st) n))
(defn collection-type [col]
  (cond
    (list? col) :list
    (vector? col) :vector
    (map? col) :map))

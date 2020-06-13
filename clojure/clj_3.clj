; STM - software transactional memory
; Creating references
(ref "String ref")
(def movie (ref "Star wars"))
; De-referencing
(deref movie)
; OR
@movie

(alter movie str ": The Empire Strikes Back"); Throws "No transaction running" error
(dosync (alter movie str ": The Empire Strikes Back")) ; Update value under reference inside a transaction

; Atom - allows change of data outside the context of a transation
(atom "Don't even try to split me")
(def atom_ (atom "Don't even try to split me"))

(reset! atom_ "Split with impunity"); Replaces entire atom

(def nums (atom []))
(swap! nums conj [{:one 1}]) ; Modifies atom in-place => [[{:one 1}]]
(swap! nums conj [{:two 2}]) ; => [[{:one 1}] [{:two 2}]]

; Implementing cache
(defn create
  []
  (atom {}))

(defn get-by-key [cache key] (@cache key))
; 2 entry points
(defn put
  ([cache value-map] (swap! cache merge value-map))
  ([cache key value] (swap! cache assoc key value)))

(def ac (create))
(put ac :quote "I'm your father, Luke")
@ac ; => {:quote "I'm your father, Luke"}
(print (get ac :quote))
(put ac {:one 1}) ; => {:quote "I'm your father, Luke", :one 1}

; Agents
(defn twice [n] (* 2 n))
(def tribbles (agent 1))
(send tribbles twice) ; Update happens in another thread

; Futures - concurrency cnstruct that allows an asynchronous return of before computation is complete
(def wait-for-it (future (Thread/sleep 5000) "and here it is")) ; Runs in a separate thread

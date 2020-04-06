// fibonacci
fib := method(n,
    seq := list(0,1)
    for (i, 2, n, seq append(seq at(i - 1) + seq at(i - 2))); seq at(i)
)
fib(10) println

// return zero when dividing by 0
Number setSlot("native_division", Number getSlot("/"))
Number setSlot("/", method(denominator,
    if (denominator == 0,
        0,
        self native_division(denominator))
    )
)

// sum all elements in 2 dimensional array
sum := method(lists,
    s := 0
    for (i, 0, lists size - 1, s = s + lists at(i) sum); writeln("Total sum is ", s)
)

// average for all items in a list
List myAverage := method(
    size := self size
    if (size == 0, Exception raise("Empty list"), self sum / size)
)

// 2 dim list
List2D := Object clone
List2D dim := method(x, y,
    self matrix := list()
    for(i, 0, y -1 ,
        self matrix append(list())
        for(j, 0, x - 1, self matrix at(i) append(nil))
    )
)
List2D set := method(x, y, val,
    self matrix at(y) atPut(x, val)
)
List2D transpose := method(
    self matrix = self matrix reverse
    for(i, 0, self matrix size - 1, self matrix atPut(i, self matrix at(i) reverse))
)
List2D flush := method(
    f := File with("matrix.txt")
    f openForUpdating
    self matrix justSerialized(f)
    f close
)

List2D read := method(
    f := File with("matrix.txt")
    self matrix := doString(f asBuffer)
    f close
)

list := List2D clone

// guess the number
num := (Random(100) value * 100) floor
input := File standardInput
guess := nil
attempt := 1

"Guess the number"
10 repeat(
    writeln("Attempt #", attempt)
    attempt = attempt + 1

    guess := input readLine() asNumber()

    if (guess == num, break)
    if (guess < num, writeln("Too small"), writeln("Too big"))
)

if(guess == num, writeln("You did it - the num is ", guess), writeln("The number was ", guess))
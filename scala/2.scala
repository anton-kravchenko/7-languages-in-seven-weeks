import scala.collection.mutable.HashMap

object HelloWorld {
  def main(args: Array[String]): Unit = {}

  def double(x: Int): Int = x * 2

  def lists() = {
    var l = List(1, "two") // type of this list is List[Any]
    l = List() //the type is List[Nothing]
  }

  def sets = {
    var s = Set("one", "two", "three")
    s = s + "four" // add element
    s = s - "four" // remove element

    var s1 = Set("one", "four", "five", "six")

    var all = s ++ s1 // add 2 sets
    var different = s -- s1 // subtract 2 sets
    var same = s & s1; // intersection

    // Equality
    Set(3, 2, 1) == Set(1, 2, 3) // is true
    List(1, 2, 3) == List(3, 2, 1) // is false
  }

  def maps {
    var ordinals = Map(0 -> "zero", 1 -> "one", 2 -> "two")
    var two = ordinals(2)

    val map = HashMap[Int, String]()
    map += 4 -> "four"
    map += 5 -> "five"
  }

  /* Everything inherits from Any and Nothing inherits from everything */
  def Any_and_Nothing_types {

    // Any is a super type for everything
    val m = HashMap[String, Any]()
    m += "random-val-1" -> 1
    m += "random-val-2" -> "two"

    // Nothing is a sub type of everything
    List() ++ List(1) // typeof List() is List[Nothing]
  }

  def foreach {
    List("foo", "bar", "baz").foreach(s => println(s))
    Set("foo", "bar", "baz").foreach(s => println(s))
    Map("foo" -> "bar", "baz" -> "foo").foreach(println)
  }

  def listMethods {
    val l = List(1, 2, 3)
    l.isEmpty
    // Nil is an empty list
    Nil.isEmpty // true
    List() == Nil // true
    l.size
    l.length
    l.head
    l.tail
    l.last
    l.init // selects all elements except the last one
    l.reverse
    l.drop(1)
  }

  def listTraversal {
    val list = List("foo", "bar", "baz")
    list.count(word => word.indexOf("a") != -1)
    list.filter(word => word.indexOf("a") == -1)
    list.map(word => word.length())
    list.forall(word => word.length() > 1)
    list.exists(word => word == "foo")
    list.sortBy((s) => s.charAt(0).toLower)
    // foldLeft
    list.foldLeft(0) { (sum, i) => sum + i }
    list.foldLeft(0)((sum, value) => sum + value) // curried version
  }
}

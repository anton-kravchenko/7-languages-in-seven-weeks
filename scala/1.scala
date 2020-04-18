object HelloWorld {
  def main(args: Array[String]): Unit = {
    println("Hello, world!")

    variables
    whileLoop
    forLoop
    forEach
    range
    tuples
  }

  def variables {
    var s = "*" * 3; // immutable
    val s1 = "abc" + 5; // mutable
    val range = 0 until 10_000_000

    print(s, s1, range)
  }

  def whileLoop {
    var i = 0
    while (i <= 3) {
      println(i)
      i += 1
    }
  }
  def forLoop {
    var i = 4;
    for (i <- 0 until 7) {
      print(i)
    }
  }
  def forEach {
    val list = List(1, 2, 3)
    list.foreach { arg => println(arg) }
  }
  def range {
    var range = 0 until 10
    range = 0 until 10 by 3
    range = (10 until 0) by -1
  }
  def tuples {
    var tuple = (" Elvis", "Presley")
    print(tuple._1, tuple._2)

    // like destructive assignment in JS
    val (x, y) = (1, 2)
  }
}

class PersonDTO(firstName: String, lastName: String)

class Compass {
  val directions = List("north", "east", "south", "west")
  var bearing = 0

  println("Initial bearing: ", direction)

  def direction() = directions(bearing) // one-line method def

  def inform(turnDirection: String) {
    println("Turning " + turnDirection + ". Now bearing " + direction)
  }

  def turnRight() {
    bearing = (bearing + 1) % directions.size
    inform("right")
  }

  def turnLeft() {
    bearing = (bearing + (directions.size - 1)) % directions.size
    inform("left")
  }
}

class PersonWith2Constructors(firstName: String) {
  println("Outer constructor")

  def this(firstName: String, lastName: String) {
    this(firstName)
    println("Inner constructor")
  }

  def talk() = println("Hi. I'm " + firstName)
}

// This "object" is a companion object (single tone) with static methods for the class
object CompanionObject {
  def classMethod() = println("This is the class method")
}
class CompanionObject {
  def instanceMethod() = println("This is an instance method")
}

// Inheritance
class Person(val name: String) { // immutable instance member
  def talk(message: String) = println(name + " says " + message)
  def id(): String = name
}

class Employee(override val name: String, val number: Int)
    extends Person(name) {

  override def talk(message: String) =
    println(name + " with ID " + number + " says " + message)

  override def id(): String = number.toString
}

// Traits (like mixins in Ruby)
trait Nice {
  def greet() = println("Howdily doodily." + this.toString())
}

class Character(override val name: String) extends Person(name) with Nice

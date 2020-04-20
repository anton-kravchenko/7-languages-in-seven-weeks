import scala.actors.Actor
import scala.actors.Actor._

object HelloWorld {
  def main(args: Array[String]): Unit = {
    val p = new PingPing()
    p ! Ping
    p ! Pong
  }

  def xml() = {
    // XML is a first class programming construct (Just like in React)
    /*
    val movies =
      <movies>
        <movie genre="action">Pirates of the Caribbean</movie>
        <movie genre="fairytale">Edward Scissorhands</movie>
      </movies>

    movies.text

    // And pattern matching for it

    (movies \ "_").foreach { movie => movie match {
      case <movie>{movieName}</movie> => println(movieName)
      case <short>{shortName}</short> => println(shortName + " (short)")
    }
   */
  }
  def patternMatching() = {

    def matchStrings(lang: String): String = lang match {
      case "Java Script" => "duck typing"
      case "Java"        => "nominal type system"
      case _             => "mixed"
    }
  }

  def factorial(n: Int): Int = {
    n match {
      case 0          => 1
      case x if x > 0 => factorial(n - 1) * n
    }
  }
}

class PingPing extends Actor {
  def act() = {
    loop {
      react {
        case Ping => println("Pong")
        case Pong => println("Ping")
      }
    }
  }
}

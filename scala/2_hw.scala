import scala.collection.mutable.ListBuffer
import scala.collection.mutable.HashMap
import scala.io.Source

object HelloWorld {
  def main(args: Array[String]): Unit = {
    getTotalSize(List("foo", "bar", "baz"))
    val c = new CensorImpl(
      "Write a Censor trait with a method that will replace the curse words Shoot and Darn with Pucky and Beans alternatives."
    )
    c.readDictionaryFromFile
    println(c.censor())
  }

  def getTotalSize(list: List[String]) =
    list.foldLeft(0)((size, word) => size + word.length())
}

trait Censor {
  val dictionary = HashMap("Shoot" -> "Pucky", "Darn" -> "Beans")
  var text: String

  def censor() = {
    var censored = ListBuffer[String]()
    text
      .split(" ")
      .foreach((word) => {
        dictionary.get(word.toLowerCase()) match {
          case Some(replacement) => censored += replacement
          case None              => censored += word
        }
      })

    censored.toList.mkString(" ")
  }

  def readDictionaryFromFile() = {
    val filename = "./dict.txt"
    for (line <- Source.fromFile(filename).getLines) {
      val Array(key, value) = line.split(", ")
      dictionary += key -> value
    }
  }
}

class CensorImpl(var text: String) extends Censor {}

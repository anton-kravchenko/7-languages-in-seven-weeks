import scala.collection.mutable.ArrayBuffer

object HelloWorld {
  def main(args: Array[String]): Unit = {

    var board = new TikTakToeBoard(
      Vector("X", "X", "O", "O", "X", "O", "X", "O", "X")
    )
    board.printBoard
    board.processBoard
  }
}

class TikTakToeBoard(val board: Vector[String]) {
  def processBoard: Unit = {
    if (isGameFinished) findWinner
    else println("No winner yet")
  }

  def isGameFinished() = board.exists(cell => cell == "") != true

  def findWinner: Unit = {
    val lines = getRows ++ getCols() ++ getDiagonals()
    val winningLine =
      lines.find(line =>
        line.forall(cell => cell == "X") || line.forall(cell => cell == "O")
      )

    winningLine match {
      case Some(line) => println(winningLine.get(0) + " has won!")
      case None       => println("Tight!")
    }

  }

  def printBoard: Unit = getRows().foreach(row => println(row.mkString(" ")))

  def getRows() = board.sliding(3, 3).toVector

  def getCols() = (0 to 2).map(i => ((i to 8) by 3).map(board(_)))

  def getDiagonals() =
    Vector(
      ((0 to 9) by 4).map { board(_) },
      ((2 to 6) by 2).map { board(_) }
    )
}

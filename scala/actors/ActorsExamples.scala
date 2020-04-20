package com.actors
import akka.actor.ActorSystem
import akka.actor.Actor
import akka.actor.ActorRef
import akka.actor.{Props, ActorSystem}
import akka.pattern.ask
import akka.util.Timeout
import scala.concurrent.Await
import scala.concurrent.duration._
import scala.language.postfixOps
import scala.util.Random._

object HelloAkkaActorSystem extends App {
  val actorSystem = ActorSystem("NameOfTheActorSystem")
  println(actorSystem)
  val actor =
    actorSystem.actorOf(Props(classOf[SummingActor], 0), "summing_actor")

  actor ! 1
  actor ! 2
  actor ! "What else"
}

class SummingActor(initialSum: Int) extends Actor {
  var sum = 0

  override def receive: Receive = {
    case x: Int => {
      sum = initialSum + sum + x
      println("Received " + x + " the total sum is " + sum)
    }
    case _ => println("Don't know how to handle non integer message")
  }
}

object FibonacciActorApp extends App {
  implicit val timeout = Timeout(10 seconds)
  val actorSystem = ActorSystem("ActorSystem")
  val actor = actorSystem.actorOf(Props[FibonacciActor])
  val future = (actor ? 10).mapTo[Int]
  var fibonacciNumber = Await.result(future, 10 seconds)
  println("Received fibonacci number: " + fibonacciNumber)
}

class FibonacciActor extends Actor {
  override def receive: Receive = {
    case num: Int => {
      val fibonacciNumber = fib(num)
      sender ! fibonacciNumber
    }
  }
  def fib(num: Int): Int = {
    num match {
      case 0 | 1 => num
      case _     => fib(num - 1) + fib(num - 2)
    }
  }
}

object Messages {
  case class Done(randomNumber: Int)
  case object GenerateRandomNumber
  case class Start(actorRef: ActorRef)
}

class RandomNumberGenerator extends Actor {
  import Messages._
  override def receive: Receive = {
    case GenerateRandomNumber => {
      println("Received GenerateRandomNumber message")
      val randomNumber = nextInt()
      sender ! Done(randomNumber)
    }
  }
}

class QueryActor extends Actor {
  import Messages._
  override def receive: Receive = {
    case Start(actorRef) => {
      println("Asking for a random number")
      actorRef ! GenerateRandomNumber
    }
    case Done(randomNumber) => {
      println("Received a randomNumber " + randomNumber)
    }
  }
}

object ActorsCommunication extends App {
  import Messages._
  val actorSystem = ActorSystem("ActorSystem")
  val randomNumberGenerator =
    actorSystem.actorOf(Props[RandomNumberGenerator], "randomNumberGenerator")
  val queryActor = actorSystem.actorOf(Props[QueryActor], "queryActor")

  queryActor ! Start(randomNumberGenerator)

}

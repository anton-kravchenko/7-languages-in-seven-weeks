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
import scala.io._

object DomainMessages {
  case class Load(url: String)
  case class Done(url: String, size: Int, timeS: Double)
}

object PageLoaderApp extends App {
  implicit val timeout = Timeout(10 seconds)
  import DomainMessages._

  val actorSystem = ActorSystem("ActorSystem")
  val urls = List(
    "http://amazon.com/",
    "http://twitter.com/",
    "http://google.com/",
    "http://cnn.com/"
  )

  val actor = actorSystem.actorOf(Props[PageLoaderActor])

  urls.foreach(url => {
    val future = (actor ? Load(url)).mapTo[Done]
    var result = Await.result(future, 10 seconds)
    println(
      "Received response from "
        + result.url
        + ", size: "
        + result.size
        + ", took "
        + result.timeS
        + " seconds to load"
    )
  })

}

class PageLoaderActor extends Actor {
  import DomainMessages._
  override def receive: Receive = {
    case Load(url) => {
      val start = System.nanoTime
      val sourceLength = Source.fromURL(url).mkString.length
      val end = System.nanoTime

      sender ! Done(url, sourceLength, (end - start) / 1000000000.0)
    }
    case _ => println("Don't know what to do")
  }
}

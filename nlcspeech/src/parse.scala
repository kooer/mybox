import java.net._
import java.io._
import scala.xml._

object NetParse {
    import java.net.{URLConnection, URL}
    import scala.xml._

    def netParse(sUrl: String):Elem = {
        var url = new URL(sUrl);
        var connect = url.openConnection

        var text = connect.getInputStream
        println(text)
        XML.load(text)

    }

    def main(args: Array[String]) {
        println("hello, world!")
        netParse("http://g.cn")
    }
}

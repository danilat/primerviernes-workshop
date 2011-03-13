package example

class LoggingService {

    static exposes = ["jms"]
    def onMessage(msg) {
        println "Ha pasao algo!!"
        println msg
    }

}

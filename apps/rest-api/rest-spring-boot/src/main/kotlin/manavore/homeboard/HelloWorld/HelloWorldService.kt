package manavore.homeboard.HelloWorld

import org.springframework.stereotype.Service

@Service
class HelloWorldService {

    fun HelloWorld(): String{
        return "Hello World";
    }
}
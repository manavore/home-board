package manavore.homeboard.HelloWorld

import org.springframework.stereotype.Service

@Service
class HelloWorldService {

    /**
     * Test
     */
    fun HelloWorld(): String{
        return "Hello World";
    }
}
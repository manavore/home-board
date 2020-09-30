package manavore.homeboard.HelloWorld

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/")
class HelloWorldController @Autowired constructor(val hws:HelloWorldService){


    @GetMapping("/helloworld")
    fun getHelloWorld() : String{
        return hws.HelloWorld();
    }
}
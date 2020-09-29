package manavore.homeboard

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class HomeBoardApplication

fun main(args: Array<String>) {
	runApplication<HomeBoardApplication>(*args)
}

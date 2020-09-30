package manavore.homeboard.tasks

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.util.*

@RestController
@RequestMapping("/tasks")
class TaskController(private val repository: TaskRepository) {

    @GetMapping
    fun getTasks(): Iterable<Task> {
        return repository.findAllBy();
    }

    @GetMapping("/{id}")
    fun getTaskById(@PathVariable("id") id: UUID): Optional<Task> {
        return repository.findById(id);
    }
}
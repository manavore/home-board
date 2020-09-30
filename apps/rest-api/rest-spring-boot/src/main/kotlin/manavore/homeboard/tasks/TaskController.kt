package manavore.homeboard.tasks

import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.media.ArraySchema
import io.swagger.v3.oas.annotations.media.Content
import io.swagger.v3.oas.annotations.media.Schema
import io.swagger.v3.oas.annotations.responses.ApiResponse
import io.swagger.v3.oas.annotations.responses.ApiResponses
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.util.*

@RestController
@RequestMapping("/tasks")
class TaskController(private val repository: TaskRepository) {

    @Operation(summary = "Get the array of tasks")
    @ApiResponses(value = [
        ApiResponse(responseCode = "200", description = "Tasks found", content = [
            (Content(mediaType = "application/json", array = (
                    ArraySchema(schema = Schema(implementation = Task::class)))))
        ])
    ]
    )
    @GetMapping
    fun getTasks(): Iterable<Task> {
        return repository.findAllBy();
    }

    @Operation(summary = "Get a task by its id")
    @ApiResponses(value = [
        ApiResponse(responseCode = "200", description = "Task found", content = [
            (Content(mediaType = "application/json", schema = Schema(implementation = Task::class)))
        ])
    ]
    )
    @GetMapping("/{id}")
    fun getTaskById(@PathVariable("id") id: UUID): Optional<Task> {
        return repository.findById(id);
    }
}
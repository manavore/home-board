package manavore.homeboard.tasks

import org.springframework.data.repository.CrudRepository
import java.util.*

interface TaskRepository: CrudRepository<Task, UUID> {
    fun findAllBy(): Iterable<Task>
}
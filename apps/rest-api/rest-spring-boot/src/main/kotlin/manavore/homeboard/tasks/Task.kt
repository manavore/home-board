package manavore.homeboard.tasks

import java.util.*
import javax.persistence.*

@Entity
// @Table(name = "task")
class Task (
        @Id /*@Column(name = "idTask")*/ @GeneratedValue(strategy = GenerationType.AUTO) var idTask: UUID,
        @Column(name = "name") var name: String
)

package manavore.homeboard

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest

@SpringBootTest
class HomeBoardApplicationTests {

	@Test
	fun contextLoads() {
	}

	@Test fun `Assert hello world`() {
		assertThat(true).isEqualTo(false);
	}

}

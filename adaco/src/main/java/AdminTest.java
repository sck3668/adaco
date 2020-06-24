import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.adaco.dao.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class AdminTest {
	@Autowired
	AuthorityDao authorityDao;
	
	@Test
	public void authorityTest() {
		authorityDao.insert("sprng123", "ROLE_USER");
	}
}

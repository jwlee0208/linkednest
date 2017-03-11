/**
 * 1. FileName	: TestTwoController.java
 * 2. Package	: net.linkednest.teset2.web
 * 3. Comments	: 	
 * 4. Author	: leejinwon
 * 5. DateTime	: 2014. 6. 24. 오전 11:18:17
 * 6. History	:
 * -----------------------------------------------------------------
 *	Date		 |	Name			|	Comment
 * -------------  -----------------   ------------------------------
 * 2014. 6. 24.		 | leejinwon			|	최초작성
 * -----------------------------------------------------------------
 **/

package net.linkednest.testtwo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/test")
public class TestTwoController {
	@RequestMapping(value="/testtwo")
	public String test2(){
		return "test/testtwo";
	}
}



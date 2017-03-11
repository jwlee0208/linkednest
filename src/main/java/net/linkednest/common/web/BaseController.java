package net.linkednest.common.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;

@Controller
public class BaseController {
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	public void writelog() throws Exception {
		logger.info("[BaseController][writelog]");
	}
	
	/**
	 * makeJSONHttpHeaders
	 * @return
	 * @throws Exception 
	 */
	public HttpHeaders makeJSONHttpHeaders() throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-type", "text/json; charset=UTF-8");
        responseHeaders.add("Accept", "text/html,application/json;q=0.9,*/*;q=0.8");
        responseHeaders.add("Access-Control-Allow-Origin", "*");
        return responseHeaders;
	}
}

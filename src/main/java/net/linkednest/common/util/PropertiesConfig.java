package net.linkednest.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class PropertiesConfig {
	private static final String TRUE = "1";
	private static String serverconfig_resource = "config/uploadserver-config.properties";
	private Properties server_props = new Properties();
	private static PropertiesConfig config = null; 
			
	static {
		config = new PropertiesConfig();	
	}
	
	public boolean compareTrue(String value) {
		if(TRUE.equals(value)) {
			return true;
		}
		return false;
	}
	
	private PropertiesConfig() {	
		InputStream is = null;
		
		/**
		 * server
		 */		
		try {
			is = Resources.getResourceAsStream(serverconfig_resource);
			server_props.load(is);
		} catch (IOException io) {
			server_props = null;
			io.printStackTrace();		
		}
	}
	
	/**
	 * server
	 * @param key
	 * @return
	 */
	public String getServerConfig(String key) {
		if(key == null) return null;
		if(server_props == null) return null;
		if(!server_props.containsKey(key)) return null;
		return server_props.getProperty(key);
	}
		
	public Properties getConfigProperties() {
		return server_props;
	}
	
	public String toStringConfig(String key) {
		return server_props.toString();
	}
	
	public static PropertiesConfig getInstance() {
		return config;
	}
}
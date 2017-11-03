package net.linkednest.share.board.dao;

import javax.inject.Named;

@Named(value="BoardArticleRedisDao")
public class BoardArticleRedisDao {
	// jedis test
    /*
    private JedisPool pool = new JedisPool(new JedisPoolConfig(), "127.0.0.1");
	private Jedis	jedis = pool.getResource();
		
	public String set(String key, String value) throws Exception{
		return jedis.set(key, value);
	}
	
	public String get(String key) throws Exception{
		return jedis.get(key);
	}
	*/
}

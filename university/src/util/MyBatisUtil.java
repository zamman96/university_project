package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @author PC-13
 *	config�뿉 �엳�뒗 �뙆�씪�쓣 李얠븘�꽌
 *	sessionFactory瑜� �깮�꽦�븯�뒗 �겢�옒�뒪
 */
public class MyBatisUtil {
	private static SqlSessionFactory sqlSessionFactory = null;
	
	static {
		InputStream in = null;
		try {
			in = Resources.getResourceAsStream("mybatis/config/mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(in!=null)try {in.close();}catch(IOException e) {}
		}
	}

	// SqlSession媛앹껜瑜� 諛섑솚�븯�뒗 硫붿꽌�뱶
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}

	/**
	 * Sqlsession객체 제공하기 위한 메서드
	 * @param autoCommit 여부값
	 * @return
	 */
	public static SqlSession getSqlSession(boolean autoCommit) {
		
		return sqlSessionFactory.openSession(autoCommit);
	}
}

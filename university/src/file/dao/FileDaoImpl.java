package file.dao;


import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import file.vo.FileVO;
import util.MyBatisUtil;

public class FileDaoImpl implements IFileDao {

	private static FileDaoImpl dao;
	
	private FileDaoImpl() {}
	
	public static FileDaoImpl getInstance() {
		if(dao==null) dao = new FileDaoImpl();
		return dao;
	}
	
	/**
	 * �뙆�씪 �벑濡� 硫붿꽌�뱶
	 */
	@Override
	public int insertFile(FileVO vo) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			
			result = session.insert("file.insertFile", vo);
			
			if(result>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return result;
	}
	
	/**
	 * �뙆�씪 �궘�젣 硫붿꽌�뱶
	 */
	@Override
	public int deleteFile(String mem_id) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			
			result = session.delete("file.deleteFile",mem_id);
			
			if(result>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return result;
	}

	/**
	 * �쉶�썝 �씠誘몄�瑜� 媛��졇�삤�뒗 硫붿꽌�뱶
	 */
	@Override
	public List<FileVO> getUserImg(String mem_id) {
		List<FileVO> list = null;
		SqlSession session = null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			list = session.selectList("file.getUserImg", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public FileVO getFile(FileVO fileVO) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		try {
			fileVO = session.selectOne("File.getFile", fileVO);
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return fileVO;
		
	}

}

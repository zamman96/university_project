package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.vo.MemberVO;
import member.vo.StuChangeVO;
import util.MyBatisUtil;

public class StudentDaoImpl implements IStudentDao{
	private static StudentDaoImpl dao;
	
	private StudentDaoImpl() {
	}
	
	public static StudentDaoImpl getInstance(){
		if(dao==null) {
			dao = new StudentDaoImpl();
		}
		return dao;
		
	}
	
	
	@Override
	public List<MemberVO> getAllStudent() {
		SqlSession session = null;
		List<MemberVO> getAllList = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			getAllList = session.selectList("member.getAllStudent",getAllList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return getAllList;
	}

	
	// �븰�쟻蹂��룞 �떊泥�
	@Override
	public int insertStuChange(StuChangeVO scVo) {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.insert("member.insertStuChange", scVo);
			
			if(count>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
	
	// �벑濡앷툑 �궔遺��궡�뿭 議고쉶
	@Override
	public List<MemberVO> selectTuiList() {
		SqlSession session = null;
		List<MemberVO> tuiList = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			tuiList = session.selectList("member.selectTuiList", tuiList);
			
			if(tuiList!=null) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return tuiList;
	}

	@Override
	public int updateStuChange() {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			count = session.update("member.updateStuChange");
			if(count>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<MemberVO> selectTuiList2() {
		SqlSession session = null;
		List<MemberVO> tuiList2 = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			tuiList2 = session.selectList("member.selectTuiList2", tuiList2);
			
			if(tuiList2!=null) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return tuiList2;
	}


	// �븰�쟻議고쉶
	@Override
	public List<StuChangeVO> selectStuChange(String stu_id) {
		SqlSession session = null;
		List<StuChangeVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("member.selectStuChange", stu_id);
			
			if(list!=null) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<StuChangeVO> searchStuChangeList() {
		SqlSession session = null;
		List<StuChangeVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("member.searchStuChangeList", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<StuChangeVO> reg_typeChangeList() {
		
		SqlSession session = null;
		List<StuChangeVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("member.reg_typeChangeList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<StuChangeVO> reg_typeChangeList2() {
		SqlSession session = null;
		List<StuChangeVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("member.reg_typeChangeList2");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int reg_typeUpdate(String stuid) {
		SqlSession session = null;
		int result = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			result = session.update("member.reg_typeUpdate",stuid);
			
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

	

}

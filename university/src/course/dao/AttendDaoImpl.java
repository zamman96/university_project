package course.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import course.vo.AttendVO;
import util.MyBatisUtil;

public class AttendDaoImpl implements IAttendDao{
	private static AttendDaoImpl dao;
	
	private AttendDaoImpl() {
		
	}
	
	public static AttendDaoImpl getInstance() {
		if(dao==null) dao = new AttendDaoImpl();
		return dao;
	}
	

	@Override
	public List<AttendVO> attendList(AttendVO avo) {
		SqlSession session = null;
		List<AttendVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.stuList", avo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int attendInsert(AttendVO avo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.insert("course.attendInsert", avo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int attendUpdate(AttendVO avo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.update("course.attendUpdate", avo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<AttendVO> attendUpdateList(AttendVO avo) {
		SqlSession session = null;
		List<AttendVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.attendList", avo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		} 
		return list;
	}

	@Override
	public int attendDate(AttendVO avo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.selectOne("course.attendDate", avo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int attendDelete(AttendVO avo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.delete("course.deleteAttend", avo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

}

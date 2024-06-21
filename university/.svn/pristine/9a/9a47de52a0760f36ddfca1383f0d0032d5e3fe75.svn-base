package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.vo.MajorVO;
import member.vo.StudentVO;
import util.MyBatisUtil;

public class MajorDaoImpl implements IMajorDao {
	private static MajorDaoImpl dao;

	private MajorDaoImpl() {
		
	}
	
	public static MajorDaoImpl getInstance() {
		if(dao==null) dao = new MajorDaoImpl();
		return dao;
	}

	@Override
	public List<MajorVO> colleageList() {
		SqlSession session =null;
		List<MajorVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("major.colList");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<MajorVO> majorList(int col_id) {
		SqlSession session =null;
		List<MajorVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("major.majorList", col_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<StudentVO> majorStudentList(StudentVO svo) {
		SqlSession session = null;
		List<StudentVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("major.majorStudent", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public int majorStudentListCount(StudentVO svo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("major.majorStudentCount", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}
}

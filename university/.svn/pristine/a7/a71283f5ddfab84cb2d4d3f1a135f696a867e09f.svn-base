package lecture.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import lecture.vo.SubjectVO;
import util.MyBatisUtil;

public class SubjectDaoImpl implements ISubjectDao{
	private static SubjectDaoImpl dao;
	
	private SubjectDaoImpl() {
		
	}
	
	public static SubjectDaoImpl getInstance() {
		if(dao==null) dao = new SubjectDaoImpl();
		return dao;
	}
	
	@Override
	public int insertSubject(SubjectVO subVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("subject.insertSubject", subVo);
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
	public String createSubjectId(SubjectVO subVo) {
		SqlSession session = null;
		String subject_id = "";
		try {
			session = MyBatisUtil.getSqlSession();
			subject_id = session.selectOne("subject.createSubjectId", subVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return subject_id;
	}

	@Override
	public int updateSubject(SubjectVO subVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("subject.updateSubject", subVo);
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
	public int deleteSubject(String subject_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.delete("subject.deleteSubject", subject_id);
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
	public int countLecture(String subject_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("subject.countLecture", subject_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<SubjectVO> subjectList(Map<String, Object> map) {
		SqlSession session = null;
		List<SubjectVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("subject.subjectList", map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public SubjectVO subjectDetail(String subject_id) {
		SqlSession session = null;
		SubjectVO svo = null;
		try {
			session = MyBatisUtil.getSqlSession();
			svo = session.selectOne("subject.subjectDetail", subject_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return svo;
	}

	@Override
	public int subjectListCount(Map<String, Object> map) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("subject.subjectListCount", map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

}

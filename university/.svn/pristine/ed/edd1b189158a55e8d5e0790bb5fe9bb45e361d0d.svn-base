package lecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import course.vo.CourseVO;
import lecture.vo.LectureVO;
import lecture.vo.RoomVO;
import lecture.vo.SubjectVO;
import lecture.vo.TimeVO;
import member.vo.MemberVO;
import member.vo.ProfessorVO;
import sun.security.jca.GetInstance;
import util.MyBatisUtil;

public class LectureDaoImpl implements ILectureDao{
	private static LectureDaoImpl dao;
	
	private LectureDaoImpl() {
		
	}
	
	public static LectureDaoImpl getInstance() {
		if(dao==null) dao = new LectureDaoImpl();
		return dao;
	}

	@Override
	public LectureVO syllabus(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SubjectVO> subjectList(LectureVO lecVo) {
		SqlSession session = null;
		List<SubjectVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.subjectList", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<ProfessorVO> professorList(int major_id) {
		SqlSession session = null;
		List<ProfessorVO> list = null;
		try {
			session=MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.professorList", major_id);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<RoomVO> buildingList() {
		SqlSession session = null;
		List<RoomVO> list = null;
		try {
			session=MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.building");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<RoomVO> buildingNumList(String room_id) {
		SqlSession session = null;
		List<RoomVO> list = null;
		try {
			session=MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.roomnum", room_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<TimeVO> timeList(LectureVO lecVo) {
		SqlSession session = null;
		List<TimeVO> list = null;
		try {
			session=MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.timeList", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<TimeVO> lectureTime(String time_id) {
		SqlSession session = null;
		List<TimeVO> list = null;
		try {
			session=MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.timeStr", time_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int insertLecture(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.insert("lecture.lectureInsert", lecVo);
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
	public int insertLectureTime(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.insert("lecture.lectureTimeInsert", lecVo);
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
	public int updateLecture(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("lecture.updateLec", lecVo);
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
	public int deleteLecture(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.delete("lecture.deleteLec", lecVo);
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
	public int deleteLectureTime(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.delete("lecture.deleteLecTime", lecVo);
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
	public List<MemberVO> proUpdateList(LectureVO lecVo) {
		SqlSession session = null;
		List<MemberVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.proUpdateList", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<LectureVO> listLecture(LectureVO lecVo) {
		SqlSession session = null;
		List<LectureVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.lectureList", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int listLectureCount(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("lecture.lectureListCount", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public LectureVO DetailLecture(LectureVO lecVo) {
		SqlSession session = null;
		LectureVO vo = null;
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectOne("lecture.detailLecture", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<LectureVO> professorLectureList(LectureVO lecVo) {
		SqlSession session = null;
		List<LectureVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("lecture.professorLectureList", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int subjectListCount(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("lecture.subjectListCount", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return cnt;
	}

}

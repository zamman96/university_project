package course.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import course.vo.CourseVO;
import lecture.vo.LectureVO;
import member.vo.StudentVO;
import util.MyBatisUtil;

public class CourseDaoImpl implements ICourseDao{
	private static CourseDaoImpl dao;
	
	private CourseDaoImpl() {
		
	}
	
	public static CourseDaoImpl getInstance() {
		if(dao==null) dao = new CourseDaoImpl();
		return dao;
	}

	@Override
	public List<LectureVO> timeTable(CourseVO vo) {
		SqlSession session = null;
		List<LectureVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.timetable", vo);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<StudentVO> courseList(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LectureVO> lectureList(LectureVO lecVo) {
		SqlSession session = null;
		List<LectureVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.searchLecture", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int currentCount(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("course.currentCount", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<LectureVO> signUpLectureList(CourseVO coVo) {
		SqlSession session = null;
		List<LectureVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.courseList", coVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int signUpCredit(CourseVO coVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("course.creditSum", coVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<LectureVO> recommendLec(CourseVO coVo) {
		SqlSession session = null;
		List<LectureVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.recommend", coVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int insertCourse(CourseVO coVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("course.registcourse", coVo);
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
	public int deleteCourse(CourseVO coVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.delete("course.deletecourse",coVo);
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
	public int dulChk(CourseVO coVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("course.dulTimeChk",coVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<LectureVO> timeTablePro(LectureVO vo) {
		SqlSession session = null;
		List<LectureVO> list = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.lecturetable", vo);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<StudentVO> allCourseList(LectureVO lecVo) {
		SqlSession session = null;
		List<StudentVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("course.allCourseList", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int allCourseListCount(LectureVO lecVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("course.allCourseListCount", lecVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}


}

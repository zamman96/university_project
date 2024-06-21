package course.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import board.vo.PageVO;
import course.dao.CourseDaoImpl;
import course.dao.ICourseDao;
import course.vo.CourseVO;
import lecture.service.ILectureService;
import lecture.service.LectureServiceImpl;
import lecture.vo.LectureVO;
import member.vo.StudentVO;

public class CourseServiceImpl implements ICourseService {
	private static CourseServiceImpl service;
	private ICourseDao dao;
	private ILectureService lecSer;

	private CourseServiceImpl() {
		dao = CourseDaoImpl.getInstance();
		lecSer = LectureServiceImpl.getInstance();
	}

	public static CourseServiceImpl getInstance() {
		if (service == null)
			service = new CourseServiceImpl();
		return service;
	}

	@Override
	public List<LectureVO> timeTable(CourseVO vo) {
		return dao.timeTable(vo);
	}

	@Override
	public List<StudentVO> courseList(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.courseList(lecVo);
	}

	@Override
	public List<LectureVO> lectureList(LectureVO lecVo) {
		List<LectureVO> save = new ArrayList<LectureVO>();
		List<LectureVO> list = dao.lectureList(lecVo);

		for (LectureVO vo : list) {
			int currentCount = this.currentCount(vo);
			String time_id = vo.getTime_id();
			String timeStr = lecSer.lectureTime(time_id);
			vo.setCurrent_count(currentCount);
			vo.setTime_name(timeStr);
			save.add(vo);
		}

		return save;
	}

	@Override
	public List<LectureVO> recommendLec(CourseVO coVo) {
		List<LectureVO> save = new ArrayList<LectureVO>();
		List<LectureVO> list = dao.recommendLec(coVo);

		for (LectureVO vo : list) {
			int currentCount = this.currentCount(vo);
			String time_id = vo.getTime_id();
			String timeStr = lecSer.lectureTime(time_id);
			vo.setCurrent_count(currentCount);
			vo.setTime_name(timeStr);
			save.add(vo);
		}

		return save;
	}

	@Override
	public int currentCount(LectureVO lecVo) {
		return dao.currentCount(lecVo);
	}

	@Override
	public List<LectureVO> signUpLectureList(CourseVO coVo) {
		List<LectureVO> save = new ArrayList<LectureVO>();
		List<LectureVO> list = dao.signUpLectureList(coVo);

		for (LectureVO vo : list) {
//			int currentCount = this.currentCount(vo);
			String time_id = vo.getTime_id();
			String timeStr = lecSer.lectureTime(time_id);
//			vo.setCurrent_count(currentCount);
			vo.setTime_name(timeStr);
			save.add(vo);
		}

		return save;
	}

	@Override
	public int signUpCredit(CourseVO coVo) {
		// TODO Auto-generated method stub
		return dao.signUpCredit(coVo);
	}

	@Override
	public int insertCourse(CourseVO coVo) {
		return dao.insertCourse(coVo);
	}

	@Override
	public int deleteCourse(CourseVO coVo) {
		// TODO Auto-generated method stub
		return dao.deleteCourse(coVo);
	}

	@Override
	public int dulChk(CourseVO coVo) {
		// TODO Auto-generated method stub
		return dao.dulChk(coVo);
	}

	@Override
	public List<LectureVO> timeTablePro(LectureVO vo) {
		// TODO Auto-generated method stub
		return dao.timeTablePro(vo);
	}

	@Override
	public List<StudentVO> allCourseList(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.allCourseList(lecVo);
	}

	@Override
	public int allCourseListCount(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.allCourseListCount(lecVo);
	}

	@Override
	public PageVO allCoursePage(LectureVO lecVo) {
		// 전체글갯수 구하기
		int count = this.allCourseListCount(lecVo);

		// 전체 페이지수구하기
		int page = lecVo.getPage();

		// 페이지마다 출력될 것
		int perpage = 10;
		int perlist = 11; // 한페이지에 출력할 게시판 양
		int totalpage = (int) Math.ceil((double) count / perlist);

		// 스타트 앤드 구하기
		int start = (page - 1) * perlist + 1;// page기본값 1
		int end = start + perlist - 1;// page기본값 1이면 +5하고-1해서 1 2 3 4 5
		if (end > count) {
			end = count;
		}

		// 시작페이지 끝페이지 구하기
		int startpage = ((page - 1) / perpage * perpage) + 1;
		int endpage = startpage + perpage - 1;
		if (endpage > totalpage)
			endpage = totalpage;

		PageVO pvo = new PageVO();
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startpage);
		pvo.setEndPage(endpage);
		pvo.setTotalPage(totalpage);
		pvo.setPerPage(perpage);
		pvo.setPerList(perlist);

		System.out.println("start==>" + start);
		System.out.println("end==>" + end);
		System.out.println("startpage==>" + startpage);
		System.out.println("endpage==>" + endpage);
		System.out.println("totalpage==>" + totalpage);
		return pvo;
	}

}

package lecture.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;

import board.vo.PageVO;
import course.dao.CourseDaoImpl;
import course.dao.ICourseDao;
import course.service.CourseServiceImpl;
import course.service.ICourseService;
import course.vo.CourseVO;
import lecture.dao.ILectureDao;
import lecture.dao.LectureDaoImpl;
import lecture.vo.LectureVO;
import lecture.vo.RoomVO;
import lecture.vo.SubjectVO;
import lecture.vo.TimeVO;
import member.vo.MemberVO;
import member.vo.ProfessorVO;

public class LectureServiceImpl implements ILectureService{
	private static LectureServiceImpl service;
	private ILectureDao dao;
	private ICourseDao cdao;
	
	private LectureServiceImpl() {
		dao = LectureDaoImpl.getInstance();
		cdao = CourseDaoImpl.getInstance();
	}
	
	public static LectureServiceImpl getInstance() {
		if(service==null) service=new LectureServiceImpl();
		return service;
	}

	@Override
	public LectureVO syllabus(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SubjectVO> subjectList(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.subjectList(lecVo);
	}
	
	@Override
	public List<ProfessorVO> professorList(int major_id) {
		// TODO Auto-generated method stub
		return dao.professorList(major_id);
	}

	@Override
	public List<RoomVO> buildingList() {
		// TODO Auto-generated method stub
		return dao.buildingList();
	}

	@Override
	public List<RoomVO> buildingNumList(String room_id) {
		// TODO Auto-generated method stub
		return dao.buildingNumList(room_id);
	}

	@Override
	public List<TimeVO> timeList(LectureVO lecVo) {
		List<TimeVO> list = dao.timeList(lecVo);
		List<TimeVO> timeList = new ArrayList<TimeVO>();
		Map<String, String> map = new HashedMap<String, String>();
		
		for(TimeVO vo : list) {
			String time_id = vo.getTime_id();
			String time_str = this.lectureTime(time_id);
			if(!map.containsKey(time_id)) {
				TimeVO time = new TimeVO();
				time.setTime_id(time_id);
				time.setTime_str(time_str);
				timeList.add(time);
				map.put(time_id, time_id);
			}
		}
		// TODO Auto-generated method stub
		return timeList;
	}

	@Override
	public String lectureTime(String time_id) {
		List<TimeVO> list = dao.lectureTime(time_id);
		String str = "";
		Map<String, String> map = new HashedMap<String, String>();
		for(int i=0; i<list.size(); i++) {
			TimeVO vo = list.get(i);
			String week = vo.getTime_week();
			int classT = vo.getTime_class();
			if(!map.containsKey(week)) {
				if(i!=0) {
					str += "/ ";
				} 
				str += week + " " + classT + " ";
				map.put(week, week);
			} else {
				str += classT + " ";
			}
		}
		return str;
	}
	
	@Override
	public int insertLecture(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.insertLecture(lecVo);
	}

	@Override
	public int insertLectureTime(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.insertLectureTime(lecVo);
	}

	@Override
	public int updateLecture(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.updateLecture(lecVo);
	}

	@Override
	public int deleteLecture(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.deleteLecture(lecVo);
	}

	@Override
	public int deleteLectureTime(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.deleteLectureTime(lecVo);
	}

	@Override
	public List<MemberVO> proUpdateList(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.proUpdateList(lecVo);
	}

	@Override
	public List<LectureVO> listLecture(LectureVO lecVo) {
		List<LectureVO> save = new ArrayList<LectureVO>();
		List<LectureVO> list = dao.listLecture(lecVo);
		for(LectureVO vo : list) {
			int curretCount = cdao.currentCount(vo);
			String time_id = vo.getTime_id();
			String timeStr = this.lectureTime(time_id);
			vo.setCurrent_count(curretCount);
			vo.setTime_name(timeStr);
			save.add(vo);
		}
		return save;
	}

	@Override
	public int listLectureCount(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.listLectureCount(lecVo);
	}

	@Override
	public PageVO pageInfoLecture(LectureVO lecVo) {
		//전체글갯수 구하기
				int count=this.listLectureCount(lecVo);
				int page = lecVo.getPage();
				//전체 페이지수구하기
				
				// 페이지마다 출력될 것
				int perpage = 10;
				int perlist= 8;	// 한페이지에 출력할 게시판 양
				int totalpage=(int)Math.ceil((double)count/perlist);
				
				//스타트 앤드 구하기
				int start=(page-1)*perlist+1;//page기본값 1
				int end=start+perlist-1;//page기본값 1이면 +5하고-1해서 1 2 3 4 5 
				if(end>count) {
					end=count;
				}
				
				//시작페이지 끝페이지 구하기
				int startpage=((page-1)/perpage*perpage)+1;
				int endpage=startpage+perpage-1;
				if(endpage>totalpage)endpage=totalpage;
				
				PageVO pvo=new PageVO();
				pvo.setStart(start);
				pvo.setEnd(end);
				pvo.setStartPage(startpage);
				pvo.setEndPage(endpage);
				pvo.setTotalPage(totalpage);
				pvo.setPerPage(perpage);
				pvo.setPerList(perlist);
				
				System.out.println("start==>"+start);
				System.out.println("end==>"+end);
				System.out.println("startpage==>"+startpage);
				System.out.println("endpage==>"+endpage);
				System.out.println("totalpage==>"+totalpage);
				return pvo;
	}

	@Override
	public LectureVO DetailLecture(LectureVO lecVo) {
		LectureVO vo =  dao.DetailLecture(lecVo);
		int curretCount = cdao.currentCount(vo);
		String time_id = vo.getTime_id();
		String timeStr = this.lectureTime(time_id);
		vo.setCurrent_count(curretCount);
		vo.setTime_name(timeStr);
		return vo;
	}

	@Override
	public List<LectureVO> professorLectureList(LectureVO lecVo) {
		List<LectureVO> save = new ArrayList<LectureVO>();
		List<LectureVO> list = dao.professorLectureList(lecVo);
		for(LectureVO vo : list) {
			int curretCount = cdao.currentCount(vo);
			String time_id = vo.getTime_id();
			String timeStr = this.lectureTime(time_id);
			vo.setCurrent_count(curretCount);
			vo.setTime_name(timeStr);
			save.add(vo);
		}
		return save;
	}

	@Override
	public int subjectListCount(LectureVO lecVo) {
		// TODO Auto-generated method stub
		return dao.subjectListCount(lecVo);
	}

	@Override
	public PageVO subjectPage(LectureVO lecVo) {
		//전체글갯수 구하기
		int count=this.subjectListCount(lecVo);
		int page = lecVo.getPage();
		//전체 페이지수구하기
		
		// 페이지마다 출력될 것
		int perpage = 10;
		int perlist= 8;	// 한페이지에 출력할 게시판 양
		int totalpage=(int)Math.ceil((double)count/perlist);
		
		//스타트 앤드 구하기
		int start=(page-1)*perlist+1;//page기본값 1
		int end=start+perlist-1;//page기본값 1이면 +5하고-1해서 1 2 3 4 5 
		if(end>count) {
			end=count;
		}
		
		//시작페이지 끝페이지 구하기
		int startpage=((page-1)/perpage*perpage)+1;
		int endpage=startpage+perpage-1;
		if(endpage>totalpage)endpage=totalpage;
		
		PageVO pvo=new PageVO();
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startpage);
		pvo.setEndPage(endpage);
		pvo.setTotalPage(totalpage);
		pvo.setPerPage(perpage);
		pvo.setPerList(perlist);
		
		System.out.println("start==>"+start);
		System.out.println("end==>"+end);
		System.out.println("startpage==>"+startpage);
		System.out.println("endpage==>"+endpage);
		System.out.println("totalpage==>"+totalpage);
		return pvo;
	}

}

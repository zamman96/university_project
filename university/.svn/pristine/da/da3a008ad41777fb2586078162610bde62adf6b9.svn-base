package lecture.service;

import java.util.List;
import java.util.Map;

import board.vo.PageVO;
import lecture.dao.ISubjectDao;
import lecture.dao.SubjectDaoImpl;
import lecture.vo.SubjectVO;

public class SubjectServiceImpl implements ISubjectService{
	private static SubjectServiceImpl service;
	private ISubjectDao dao;
	
	private SubjectServiceImpl() {
		dao = SubjectDaoImpl.getInstance();
	}
	
	public static SubjectServiceImpl getInstance() {
		if(service==null) service = new SubjectServiceImpl();
		return service;
	}

	@Override
	public int insertSubject(SubjectVO subVo) {
		// TODO Auto-generated method stub
		return dao.insertSubject(subVo);
	}

	@Override
	public String createSubjectId(SubjectVO subVo) {
		// TODO Auto-generated method stub
		return dao.createSubjectId(subVo);
	}

	@Override
	public int updateSubject(SubjectVO subVo) {
		// TODO Auto-generated method stub
		return dao.updateSubject(subVo);
	}

	@Override
	public int deleteSubject(String subject_id) {
		// TODO Auto-generated method stub
		return dao.deleteSubject(subject_id);
	}

	@Override
	public int countLecture(String subject_id) {
		// TODO Auto-generated method stub
		return dao.countLecture(subject_id);
	}

	@Override
	public List<SubjectVO> subjectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.subjectList(map);
	}

	@Override
	public int subjectListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.subjectListCount(map);
	}

	@Override
	public PageVO pageInfo(int page, Map<String, Object> map) {
		//전체글갯수 구하기
		int count=this.subjectListCount(map);
		
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
	public SubjectVO subjectDetail(String subject_id) {
		// TODO Auto-generated method stub
		return dao.subjectDetail(subject_id);
	}
}

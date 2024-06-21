package member.service;

import java.util.ArrayList;
import java.util.List;

import board.vo.PageVO;
import member.dao.IMajorDao;
import member.dao.MajorDaoImpl;
import member.vo.MajorVO;
import member.vo.StudentVO;

public class MajorServiceImpl implements IMajorService{
	private static MajorServiceImpl service;
	private IMajorDao dao;
	
	private MajorServiceImpl() {
		dao = MajorDaoImpl.getInstance();
	}
	
	public static MajorServiceImpl getInstance() {
		if(service==null) service = new MajorServiceImpl();
		return service;
	}

	@Override
	public List<MajorVO> colleageList() {
		// TODO Auto-generated method stub
		return dao.colleageList();
	}

	@Override
	public List<MajorVO> majorList(int col_id) {
		// TODO Auto-generated method stub
		return dao.majorList(col_id);
	}

	@Override
	public List<StudentVO> majorStudentList(StudentVO svo) {
		return dao.majorStudentList(svo);
	}

	@Override
	public int majorStudentListCount(StudentVO svo) {
		// TODO Auto-generated method stub
		return dao.majorStudentListCount(svo);
	}

	@Override
	public PageVO pageMajorStuList(StudentVO svo) {
		//전체글갯수 구하기
				int count=this.majorStudentListCount(svo);
				
				//전체 페이지수구하기
				int page = svo.getPage();
				
				// 페이지마다 출력될 것
				int perpage = 10;
				int perlist= 11;	// 한페이지에 출력할 게시판 양
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

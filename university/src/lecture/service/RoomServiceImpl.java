package lecture.service;

import java.util.List;

import board.vo.PageVO;
import lecture.dao.IRoomDao;
import lecture.dao.RoomDaoImpl;
import lecture.vo.RoomVO;

public class RoomServiceImpl implements IRoomService{
	private static RoomServiceImpl service;
	private IRoomDao dao;
	
	private RoomServiceImpl() {
		dao = RoomDaoImpl.getInstance();
	}
	
	public static RoomServiceImpl getInstance() {
		if(service==null) service = new RoomServiceImpl();
		return service;
	}
	
	@Override
	public List<RoomVO> roomList(RoomVO rvo) {
		// TODO Auto-generated method stub
		return dao.roomList(rvo);
	}

	@Override
	public int insertRoom(RoomVO rvo) {
		// TODO Auto-generated method stub
		return dao.insertRoom(rvo);
	}

	@Override
	public int updateRoom(RoomVO rvo) {
		// TODO Auto-generated method stub
		return dao.updateRoom(rvo);
	}

	@Override
	public int deleteRoom(RoomVO rvo) {
		// TODO Auto-generated method stub
		return dao.deleteRoom(rvo);
	}

	@Override
	public List<RoomVO> buildingList() {
		// TODO Auto-generated method stub
		return dao.buildingList();
	}

	@Override
	public PageVO roomListPage(RoomVO rvo) {
		//전체글갯수 구하기
		int count=this.roomListCount(rvo);
		int page = rvo.getPage();
		//전체 페이지수구하기
		
		// 페이지마다 출력될 것
		int perpage = 10;
		int perlist= 12;	// 한페이지에 출력할 게시판 양
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
	public int roomListCount(RoomVO rvo) {
		// TODO Auto-generated method stub
		return dao.roomListCount(rvo);
	}

	@Override
	public int deleteChk(RoomVO rvo) {
		// TODO Auto-generated method stub
		return dao.deleteChk(rvo);
	}

	@Override
	public List<RoomVO> roomNumList(String room_id) {
		// TODO Auto-generated method stub
		return dao.roomNumList(room_id);
	}
	

}

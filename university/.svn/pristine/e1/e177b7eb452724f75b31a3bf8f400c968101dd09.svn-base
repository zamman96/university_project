package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.dao.BoardDaoImpl;
import board.dao.IBoardDao;
import board.vo.BoardVO;
import board.vo.PageVO;
import board.vo.ReplyVO;


public class BoardServiceImpl implements IBoardService {

	
	private IBoardDao dao;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	
	

	private  static IBoardService  service;
	

	public static IBoardService getService() {
		if(service == null)  service = new BoardServiceImpl();
		
		return service;
		
	}


	@Override
	public List<BoardVO> selectByPage(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.selectByPage(vo);
	}


	@Override
	public int insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBoard(vo);
	}


	@Override
	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBoard(vo);
	}


	@Override
	public int deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(vo);
	}


	@Override
	public int getTotalCount(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.getTotalCount(vo);
	}


	@Override
	public PageVO pageInfo(BoardVO bvo) {
		int count=this.getTotalCount(bvo);
		
		int page = bvo.getPage();
		
		//전체 페이지수구하기
		int perpage =PageVO.getPerPage();//5
		int perlist=PageVO.getPerList();//8
		int totalpage=(int)Math.ceil((double)count/perlist);//26/8
		
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
		
		System.out.println("start==>"+start);
		System.out.println("end==>"+end);
		System.out.println("startpage==>"+startpage);
		System.out.println("endpage==>"+endpage);
		System.out.println("totalpage==>"+totalpage);
		return pvo;
	}


	// 240615 정기쁨 추가 시작
	/**
	 * 메인의 공지사항 및 문의 게시판에 타이틀과 조회수를 출력하는 메서드
	 */
	@Override
	public List<BoardVO> selectNotiBoard() {
		// TODO Auto-generated method stub
		return dao.selectNotiBoard();
	}
	@Override
	public List<BoardVO> selectQuestBoard() {
		// TODO Auto-generated method stub
		return dao.selectQuestBoard();
	}
	// 240615 정기쁨 추가 끝


	@Override
	public BoardVO detailBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.detailBoard(vo);
	}


	@Override
	public int updateHit(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.updateHit(vo);
	}


	@Override
	public int insertBoardFile(BoardVO bvo) {
		// TODO Auto-generated method stub
		return dao.insertBoardFile(bvo);
	}


	@Override
	public int insertReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.insertReply(vo);
	}


	@Override
	public int deleteBoardFile(BoardVO bvo) {
		// TODO Auto-generated method stub
		return dao.deleteBoardFile(bvo);
	}


	@Override
	public int updateReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.updateReply(vo);
	}


	@Override
	public int deleteReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteReply(vo);
	}


	@Override
	public List<ReplyVO> selectReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.selectReply(vo);
	}	
	

}

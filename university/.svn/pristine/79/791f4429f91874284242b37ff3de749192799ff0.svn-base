package board.service;

import java.util.List;
import java.util.Map;

import board.vo.BoardVO;
import board.vo.PageVO;
import board.vo.ReplyVO;

public interface IBoardService {
	
	public List<BoardVO> selectByPage(BoardVO vo);
	
	//글쓰기
	public int  insertBoard(BoardVO vo);
	
	public int updateBoard(BoardVO vo);
	//글삭제
	public int deleteBoard(BoardVO vo);
	
	public int getTotalCount(BoardVO vo);
	
	public  PageVO pageInfo(BoardVO bvo);
	
	// 240615 정기쁨 추가 시작
	/**
	 * 메인의 공지사항 및 문의 게시판에 타이틀과 조회수를 출력하는 메서드
	 * @return
	 */
	public List<BoardVO> selectNotiBoard();
	public List<BoardVO> selectQuestBoard();
	
	// 240615 정기쁨 추가 끝	
	
	public int deleteBoardFile(BoardVO bvo);
	
	public BoardVO detailBoard (BoardVO vo);
	
	public int updateHit(BoardVO vo);
	
	public int insertBoardFile(BoardVO bvo);
	
	public int insertReply(ReplyVO vo);
	
	public int updateReply(ReplyVO vo);
	
	public int deleteReply(ReplyVO vo);
	
	public List<ReplyVO> selectReply(ReplyVO vo);
	
}

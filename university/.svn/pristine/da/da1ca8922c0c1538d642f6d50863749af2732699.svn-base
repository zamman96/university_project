package board.dao;

import java.util.List;
import java.util.Map;

import board.vo.BoardVO;
import board.vo.ReplyVO;

public interface IBoardDao {

	public List<BoardVO> selectByPage(BoardVO bvo);
	
	public int updateBoard(BoardVO vo);
	//글쓰기
	public int  insertBoard(BoardVO vo);
	
	//글삭제
	public int deleteBoard(BoardVO vo);
	
	public int getTotalCount(BoardVO bvo);
	
	// 240615 정기쁨 추가 시작
	/**
	 * 메인의 공지사항 및 문의 게시판에 타이틀과 조회수를 출력하는 메서드
	 * @return
	 */
	public List<BoardVO> selectNotiBoard();
	public List<BoardVO> selectQuestBoard();
	
	// 240615 정기쁨 추가 끝	
	
	//240615신지시작
	public BoardVO detailBoard (BoardVO bvo);
	
	public int updateHit(BoardVO bvo);
	
	public int insertBoardFile(BoardVO bvo);
	
	public int deleteBoardFile(BoardVO bvo);
	
	public int insertReply(ReplyVO vo);
	
	public int updateReply(ReplyVO vo);
	
	public int deleteReply(ReplyVO vo);
	
	public List<ReplyVO> selectReply(ReplyVO vo);
	
}

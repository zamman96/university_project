package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.vo.BoardVO;
import board.vo.ReplyVO;
import util.MyBatisUtil;


public class BoardDaoImpl implements IBoardDao {

	private BoardDaoImpl() { }
	
	private  static IBoardDao   dao  ;
	public static IBoardDao  getDao() {
		if(dao == null) dao = new BoardDaoImpl();
		
		return dao;
	}
	
	@Override
	public int insertBoard(BoardVO vo) {
		int result=0;
		SqlSession session=null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			result=session.insert("board.insertBoard",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				session.commit();
				session.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public List<BoardVO> selectByPage(BoardVO bvo) {
		List<BoardVO>list=null;
		SqlSession session=null;
		try {
			session=MyBatisUtil.getSqlSession();
			list=session.selectList("board.selectByPage",bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getTotalCount(BoardVO bvo) {
		int result=0;
		SqlSession session=null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			result=session.selectOne("board.selectByPageCount",bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return result;
	}

	// 240615 정기쁨 추가 시작
	/**
	 * 메인의 공지사항 및 문의 게시판에 타이틀과 조회수를 출력하는 메서드
	 */
	@Override
	public List<BoardVO> selectNotiBoard() {
		List<BoardVO>list=null;
		SqlSession session=null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			list=session.selectList("board.selectNotiBoard");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return list;
	}
	
	@Override
	public List<BoardVO> selectQuestBoard() {
		List<BoardVO>list=null;
		SqlSession session=null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			list=session.selectList("board.selectQuestBoard");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return list;
	}
	// 240615 정기쁨 추가 끝

	@Override
	public int deleteBoard(BoardVO bvo) {
		SqlSession session=null;
		int result= 0;
		try {
			session=MyBatisUtil.getSqlSession();
			result=session.delete("board.deleteReply", bvo);
			result=session.delete("board.DeleteBoard",bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return result;
	}

	@Override
	public BoardVO detailBoard(BoardVO bvo) {
		BoardVO vo=null;
		SqlSession session=null;
		try {
			session = MyBatisUtil.getSqlSession();
			vo=session.selectOne("board.detail", bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		
		return vo;
	}

	@Override
	public int updateHit(BoardVO bvo) {
		int result=0;
		SqlSession session=null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			result=session.update("board.updateHit",bvo);
		}  catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return result;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		int result=0;
		SqlSession session=null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			result=session.update("board.updateBoard",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return result;
	}

	@Override
	public int insertBoardFile(BoardVO bvo) {
		int result=0;
		SqlSession session=null;
		try {
			session=MyBatisUtil.getSqlSession();
			result=session.insert("board.insertBoardFile", bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return result;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		int result=0;
		SqlSession session=null;
		
		try {
			session=MyBatisUtil.getSqlSession();
			result=session.insert("board.insertReply",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return result;
	}

	@Override
	public int deleteBoardFile(BoardVO bvo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt=session.delete("board.deleteBoardFile", bvo);
			cnt=session.delete("board.deleteAttachFile", bvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateReply(ReplyVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("board.updateReply", vo);
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
	public int deleteReply(ReplyVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.delete("board.deleteReplyPart", vo);
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
	public List<ReplyVO> selectReply(ReplyVO vo) {
		SqlSession session = null;
		List<ReplyVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("board.selectReply", vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

}

package course.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import course.vo.ScoreVO;
import util.MyBatisUtil;

public class ScoreDaoImpl implements IScoreDao{
private static ScoreDaoImpl dao;
	
	private ScoreDaoImpl() {
		
	}
	
	public static ScoreDaoImpl getInstance() {
		if(dao==null) dao = new ScoreDaoImpl();
		return dao;
	}

	@Override
	public List<ScoreVO> scoreList(ScoreVO svo) {
		SqlSession session = null;
		List<ScoreVO> list = null;
		try {
			session=MyBatisUtil.getSqlSession();
			list = session.selectList("course.scoreList", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int attendCnt(ScoreVO svo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.selectOne("course.absentStu", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertScore(ScoreVO svo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.insert("course.insertScore", svo);
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
	public int updateScore(ScoreVO svo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.update("course.updateScore", svo);
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
	public int scoreListChk(ScoreVO svo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.selectOne("course.scoreChk", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<ScoreVO> courseListYear(String stu_id) {
		SqlSession session = null;
		List<ScoreVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("score.yearTerm", stu_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int countCredit(ScoreVO svo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session=MyBatisUtil.getSqlSession();
			cnt = session.selectOne("score.countCredit", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public ScoreVO scoreCal(ScoreVO svo) {
		SqlSession session = null;
		ScoreVO vo = null;
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectOne("score.scoreCal", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}

	@Override
	public List<ScoreVO> scoreStuList(ScoreVO svo) {
		SqlSession session = null;
		List<ScoreVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("score.scoreStuList", svo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
}

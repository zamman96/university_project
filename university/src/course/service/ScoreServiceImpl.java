package course.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import course.dao.IScoreDao;
import course.dao.ScoreDaoImpl;
import course.vo.ScoreVO;
import javafx.print.Collation;

public class ScoreServiceImpl implements IScoreService {
	private static ScoreServiceImpl service;
	private IScoreDao dao;

	private ScoreServiceImpl() {
		dao = ScoreDaoImpl.getInstance();
	}

	public static ScoreServiceImpl getInstance() {
		if (service == null)
			service = new ScoreServiceImpl();
		return service;
	}

	@Override
	public List<ScoreVO> scoreList(ScoreVO svo) {
		List<ScoreVO> list = dao.scoreList(svo);
		List<ScoreVO> save = new ArrayList<ScoreVO>();
		for (ScoreVO vo : list) {
			vo.setAttend_type(0);
			int absent = this.attendCnt(vo);
			if (absent >= 4) {
				vo.setAttend_score(0);
			} else {
				vo.setAttend_score((10 - 3 * absent));
			}
			save.add(vo);
		}
		return save;
	}

	@Override
	public int attendCnt(ScoreVO svo) {
		// TODO Auto-generated method stub
		return dao.attendCnt(svo);
	}

	@Override
	public int insertScore(ScoreVO svo) {
		// TODO Auto-generated method stub
		return dao.insertScore(svo);
	}

	@Override
	public int updateScore(ScoreVO svo) {
		// TODO Auto-generated method stub
		return dao.updateScore(svo);
	}

	@Override
	public int scoreListChk(ScoreVO svo) {
		// TODO Auto-generated method stub
		return dao.scoreListChk(svo);
	}

	@Override
	public List<ScoreVO> rankScore(List<ScoreVO> listsvo) {
		List<ScoreVO> list = new ArrayList<ScoreVO>();
		Collections.sort(listsvo);
		int cnt = listsvo.size();
		double[] gradeRatios = { 0.1, 0.20, 0.20, 0.20, 0.15, 0.05, 0.05, 0.03, 0.02 };
		String[] grades = { "4.5", "4", "3.5", "3", "2.5", "2", "1.5", "1", "0" };
		int[] gradeCounts = new int[gradeRatios.length];
		Arrays.fill(gradeCounts, 0); // 배열 초기화

		// 비율에 따라 학년별 인원 할당
		for (int i = 0; i < gradeRatios.length; i++) {
			gradeCounts[i] = (int) Math.round(gradeRatios[i] * cnt);
		}
		int start = 0;
		int end = 0;
		boolean exit = false;
		
		for (int j = 0; j < gradeCounts.length; j++) {
			end += gradeCounts[j];
		if(end>cnt) {
			end = cnt;
			exit = true;
		}
			for (int i = start; i < end; i++) {
				ScoreVO svo = listsvo.get(i);
				svo.setAll_score(grades[j]);
				list.add(svo);
			}
			if(exit) {
				break;
			}
			start += gradeCounts[j];
		}
		return list;
	}

	@Override
	public List<ScoreVO> courseListYear(String stu_id) {
		// TODO Auto-generated method stub
		return dao.courseListYear(stu_id);
	}

	@Override
	public int countCredit(ScoreVO svo) {
		// TODO Auto-generated method stub
		return dao.countCredit(svo);
	}

	@Override
	public ScoreVO scoreCal(ScoreVO svo) {
		// TODO Auto-generated method stub
		return dao.scoreCal(svo);
	}

	@Override
	public List<ScoreVO> scoreStuList(ScoreVO svo) {
		// TODO Auto-generated method stub
		return dao.scoreStuList(svo);
	}

	@Override
	public ScoreVO tableSum(ScoreVO svo) {
		// sum, avg
		ScoreVO score = this.scoreCal(svo);
		
		String subject_type = "";
		// cre
		int cre = this.countCredit(svo);
		score.setCre(cre);
		
		// grs
		subject_type = "교양(필수)";
		svo.setSubject_type(subject_type);
		int grs=this.countCredit(svo);
		score.setGrs(grs);
				
		// gss
		subject_type = "교양(선택)";
		svo.setSubject_type(subject_type);
		int gss = this.countCredit(svo);
		score.setGss(gss);
		
		// mrs
		subject_type = "전공(필수)";
		svo.setSubject_type(subject_type);
		int mrs = this.countCredit(svo);
		score.setMrs(mrs);
		
		// mss
		subject_type = "전공(선택)";
		svo.setSubject_type(subject_type);
		int mss = this.countCredit(svo);
		score.setMss(mss);
		
		// tes
		subject_type = "교직";
		svo.setSubject_type(subject_type);
		int tes = this.countCredit(svo);
		score.setTes(tes);
		
		return score;
	}

}

package course.dao;

import java.util.List;

import course.vo.ScoreVO;

public interface IScoreDao {
	/**
	 * @param svo year term subject_id
	 * @return 해당과목을 수강하는 학생들의 성적 리스트 만약에 null 일경우 공백으로 가져올 것
	 */
	public List<ScoreVO> scoreList(ScoreVO svo);
	
	/**
	 * service에서 성적점수 계산하는 용도로 사용 될것
	 * 출석 점수 총 점 10점으로 할 때
	 * 1번 7점
	 * 2번 4점 
	 * 3번 1점
	 * 4번 0점 ( all_score 점수 0로 들어갈 것 )
	 * @param svo year term subject_id stu_id
	 * @return 학생들의 결석횟수
	 */
	public int attendCnt(ScoreVO svo);
	
	/**추가
	 * @param svo
	 * @return 
	 */
	public int insertScore(ScoreVO svo);
	
	/**업데이트
	 * @param svo
	 * @return
	 */
	public int updateScore(ScoreVO svo);
	
	/**
	 * score가 이미 insert되었는 지 확인
	 * @param svo 
	 * @return
	 */
	public int scoreListChk(ScoreVO svo);
	
// 학생 성적 조회
	
	/**
	 * 학생이 수강한 년도 학기 (course_term)
	 * @param stu_id
	 * @return
	 */
	public List<ScoreVO> courseListYear(String stu_id);
	
	/**
	 * @param svo
	 * @return 기본으로 넣을 값 stu_id
	 * year term
	 * type
	 */
	public int countCredit(ScoreVO svo);
	
	/**
	 * @param svo (avg, sum)
	 * @return stu_id
	 * year term
	 */
	public ScoreVO scoreCal(ScoreVO svo);
	
	/**
	 * 과목별 성적 조회
	 * @param svo
	 * @return 
	 */
	public List<ScoreVO> scoreStuList(ScoreVO svo);
}

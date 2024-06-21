package lecture.dao;

import java.util.List;

import course.vo.CourseVO;
import lecture.vo.LectureVO;

/**
 * @author PC-13
 *	강의평을 작성하고 조회할 수 있는 Dao
 */
public interface IReviewDao {
	/**
	 * 학생이 성적확인 시 강의평가를 입력하여
	 * insert시키는 메서드
	 * 수정이나 삭제가 불가능하다는 알림을 띄워서 수정 삭제하지 않게 하기
	 * @param cVo 전체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertReview(CourseVO cVo);
	
	/**
	 * <<<<<만약 교수 정보나 과목정보같은 것도 본다면 return 타입을 새로운 VO객체를 만들어 넣어야됨>>>>
	 * 교수나 관리자가 강의 평가를 볼 수 있는 곳
	 * @param cVo (year, term, subject_id)
	 * @return 과목당 강의평가 리스트
	 */
	public List<CourseVO> reviewList(LectureVO lecVo);
}

package lecture.dao;

import java.util.List;

import course.vo.AttendVO;
import lecture.vo.LectureVO;
import member.vo.StudentVO;

/**
 * @author PC-13
 *	출석부를 작성하거나
 *	전체 출석리스트를 볼 수 있는 Dao
 */
public interface IAttendanceDao {
	
	// course 정보는 courseDao에 있는 courseList메서드 이용
	// 가져온 정보를 토대로 출석부 생성할 것
	
	/**
	 * 출석부를 체크한 토대로 
	 * getParameterValues를 통해 나온 배열을
	 * 서블릿에서 AttendVO 객체를 list화 시켜서
	 * 해당 insert작업을 수행한다
	 * 
	 * @param list 모든 ATTEND_LIST 테이블 
	 * @return 작업 성공 : 1이상, 작업 실패 : 0
	 */
	public int insertAttend(List<AttendVO> list);
	
	/**
	 * 출석부를 체크한 토대로 
	 * getParameterValues를 통해 나온 배열을
	 * 서블릿에서 AttendVO 객체를 list화 시켜서
	 * 해당 update작업을 수행한다
	 * 
	 * 변경되는 것은 
	 * ATTEND_TYPE
	 * ATTEND_REMARK (선택사항)
	 * 
	 * @param list(선택한 날짜의 출석날짜에 해당하는 학생 리스트의 출석 상황)
	 * @return
	 */
	public int updateAttend(List<AttendVO> list);
	
	// 출석 삭제는 X
}

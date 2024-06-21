package course.service;

import java.util.List;

import course.vo.AttendVO;

public interface IAttendService {

	/**
	 * @param avo subject_id, year, term
	 * @return 해당 과목을 수강하고 있는 학생 조회
	 */
	public List<AttendVO> attendList(AttendVO avo); 

	/**
	 * @param avo attend_date, year, term, subject_id, attend_type, attend_remark
	 * @return 작업성공 : 1 , 작업 실패 0
	 */
	public int attendInsert(AttendVO avo);
	
	/**
	 * @param avo year, term, subject_id, attend_date
	 * @return
	 */
	public int attendUpdate(AttendVO avo);
	
	/**
	 * @param avo attend_type, attend_remark, year, term, stu_id
	 * @return
	 */
	public List<AttendVO> attendUpdateList(AttendVO avo);
	
	/**
	 * 현재 날짜에 출석부가 존재하는지 찾는 메서드
	 * @param avo  year, term, subject_id, attend_date
	 * @return
	 */
	public int attendDate(AttendVO avo);

	/**해당 날짜의 출석부를 삭제하는 메서드
	 * @param avo 
	 * @return 작업 성공 1
	 */
	public int attendDelete(AttendVO avo);
}

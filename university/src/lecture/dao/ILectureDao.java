package lecture.dao;

import java.util.List;

import course.vo.CourseVO;
import lecture.vo.LectureVO;
import lecture.vo.RoomVO;
import lecture.vo.SubjectVO;
import lecture.vo.TimeVO;
import member.vo.MemberVO;
import member.vo.ProfessorVO;

/**
 * @author PC-13
 *	강의 계획서
 *	강의 추가 수정 삭제와 관련된 dao
 */
public interface ILectureDao {
	
	/**
	 * @param lecVo (year, term, subject_id)
	 * @return 강의계획서 내용 보기
	 * 필수 내용
	 * subject_id, subject_name, subject_type, major_name
	 * mem_name, mem_mail, mem_tel
	 * subject_grade, subject_credit,
	 * subject_theory, subject_training
	 * room_id || room_num, time_name;
	 *  
	 * subject_outline, subject_target, 
	 * subject_t_book, subject_s_book
	 * subject_r_file, subject_p_file
	 * 
	 * 
	 * time_name은 
	 * CourseDao에 있는
	 * lectureTime(String time_id) 메서드를 가져와서 service에서 넣어주기?
	 */
	public LectureVO syllabus(LectureVO lecVo);
	
	// 강의 계획서 다운 메서드
	
	//------------------------------------------------------

	
	// 강의 추가 메서드 insertLecture과 insertLectureTime과 함께 실행
	// Service에서 통합할것
	// 강의 추가 과정 : 과목 >> 교수 >> 강의실 >> 시간 선택 이후 아무렇게나 입력하기

	
	/**
	 * @param lecVo year, term, pro_id
	 * @return 해당 년도와 학기에 해당 교수가 강의하는 과목 리스트
	 */
	public List<LectureVO> professorLectureList(LectureVO lecVo);
	
	/**
	 * 해당 학기와 일치하는 과목 전체 리스트(+검색)
	 * @param lecVo(major_name, subject_creadit, subject_grade, subject_term, subject_type)
	 * @return 검색 조건에 따른 과목 리스트
	 */
	public List<SubjectVO> subjectList(LectureVO lecVo);
	
	/**
	 * @param lecVo
	 * @return 위의 전체 결과 갯수
	 */
	public int subjectListCount(LectureVO lecVo);
	
	/**
	 * @param 학과 번호를 넣으면 해당하는 교수의 정보를 가져다주는 리스트
	 * @return 해당 학과의 교수
	 */
	public List<ProfessorVO> professorList(int major_id);
	
	/**
	 * room_available=1(사용가능한) 조건의 building리스트
	 * @return 건물 번호 리스트
	 */
	public List<RoomVO> buildingList();
	
	/**
	 * room_available=1(사용가능한)
	 * 선택한 해당 건물의 호수
	 * @param room_id 
	 * @return 건물의 호수
	 */
	public List<RoomVO> buildingNumList(String room_id);
	
	// 강의실 추가 후 (강의실과 교수 시간에 맞는) 해당하는 시간대를 찾는 메서드
	/**
	 * 강의의 Time을 선택하기 위해서
	 * 해당 학점에 해당하는 시간에
	 * 선택한 교수와 선택한 강의실 모두 가능한 시간
	 * 리스트를 출력하는 메서드
	 << mapper 되는지 테스트 필요 >>
    
     * @param lecVo(room_id, room_num, subject_credit)
	 * @return 학점에 해당하는 시간 요일과 교시를 반환 > 해당 번호는 값으로 가져올 것
	 */
	public List<TimeVO> timeList(LectureVO lecVo);
	
	/**
	 * 강의를 추가 insertLectureTime과 함께 수행
	 * @param lecVo (year, term, subject_id, lec_count, pro_id)
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertLecture(LectureVO lecVo);
	
	/**
	 * 시간 번호를 입력하면 강의 시간을 출력해주는 메서드
	 * 예시)
	 * 월 1교시, 화요일 4교시, 화요일 5교시 수업일 경우
	 * 월1/화4,5 로 출력해주는 메서드 service에서 처리
	 * @param time_id 
	 * @return 강의시간 
	 * 			이후 lecVo에서 time_name으로 들어갈 예정
	 */
	public List<TimeVO> lectureTime(String time_id);
	
	/**
	 * LEC_TIME테이블 insert하는 메서드
	 * @param lecVo 
	 * (time_id, year, term, subject_id, room_id, room_num)
	 * 
	insert into lec_time
	select time_id, time_week, time_class, #{year}, #{term}, #{subject_id}, #{room_id}, #{room_num}
	from time
	where time_id = #{time_id}
	 * @return 작업 성공 : 1이상, 작업 실패 : 0
	 */
	public int insertLectureTime(LectureVO lecVo);
	
	// -------------------------------------------------------------------
	// 업데이트 ( 수강신청 인원 수만 변경 가능)
	// 다른 것을 변경하고 싶다면 삭제하고 새로 추가할 것
	/**
	 * 수강가능 인원 수 변경하는 메서드  
	 * @param lecVo(year, term, subject_id, lec_count)
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int updateLecture(LectureVO lecVo);
	
	/**
	 * @param lecVo year term time_id major_id
	 * @return 교수 변경시 교수 선택할 떄 시간이 겹치지 않은 해당 학과의 교수남 조회
	 */
	public List<MemberVO> proUpdateList(LectureVO lecVo);
	
	// ----------------------------------------------------------------------
	// 삭제 반드시 deleteLecture와 deleteLectureTime을 함께 할 것 
	// Service에서 통합하기
	
	/**
	 * 강의 삭제 deleteLectureTime과 함께 실행
	 * 수강하는 학생이 있을 경우 삭제 불가능 (countCourse)
	 * @param lecVo(year, term, subject_id)
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteLecture(LectureVO lecVo);
	
	/**
	 * 강의 시간, 강의실 배정 삭제 
	 * 수강하는 학생이 있을 경우 삭제 불가능 (countCourse)
	 * @param lecVo(year, term, subject_id)
	 * @return 작업 성공 : 1이상, 작업 실패 : 0
	 */
	public int deleteLectureTime(LectureVO lecVo);
	
	/**
	 * @param lecVo 더 자세한 조회를 위한 페이징 처리
	 * @return
	 */
	public List<LectureVO> listLecture(LectureVO lecVo);
	
	/**
	 * @param lecVo 페이징 처리를 위한 전체 숫자
	 * @return
	 */
	public int listLectureCount(LectureVO lecVo);
	
	/**
	 * @param lecVo
	 * @return 하나의 강의 개설 정보
	 */
	public LectureVO DetailLecture(LectureVO lecVo);
}

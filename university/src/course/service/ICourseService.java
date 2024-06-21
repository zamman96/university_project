package course.service;

import java.util.List;
import java.util.Map;

import board.vo.PageVO;
import course.vo.CourseVO;
import lecture.vo.LectureVO;
import member.vo.StudentVO;

public interface ICourseService {
	/**
	 * @param vo (year, term, stu_id)
	 * @return 해당 subject name, time_id, time_class, time_week
	 */
	public List<LectureVO> timeTable(CourseVO vo);
	
	
	/**
	 * 년도, 학기, 과목번호 토대로 course에 있는 학생들의 정보를 가져옴
	 * course, student, member (+major, colleage) 조인 할 것
	 * @param lecVo(year, term, subject_id)것
	 * @return 학생 정보
	 */
	public List<StudentVO> courseList(LectureVO lecVo);
	
	/**
	 * @param vo (year, term, pro_id) - 교수 시간표
	 * @return 해당 subject name, time_id, time_class, time_week
	 */
	public List<LectureVO> timeTablePro(LectureVO vo);
	
	// 수강신청---------------------------------------------------------
	/**
	 * 수강 과목 리스트 조회
	 * 검색 결과에 따라 
	 * @param 
	 * @return (검색된) 수강 과목 리스트
	 * 반드시 포함할 내용
	 * subject_type, subject_id, subject_name, subject_credit, mem_name(교수명), 
	 * room_id || room_num, time_week, lec_time, lec_count, current_count
	 */
	public List<LectureVO> lectureList(LectureVO lecVo);
	// 시간은 time_id를 가져오면 lectureTime메서드에서 출력
	// current_count는 currentCount메서드에서 set하여 출력
	
	/**
	 * 현재 신청 인원
	 * @param lecVo ( year, term, subject_id 필수 포함 )
	 * @return 현재 수강 신청한 인원을 가져옴
	 * 			이후 lecVo에서  current_count으로 들어갈 예정
	 */
	public int currentCount(LectureVO lecVo);
	
	/**
	 * @param coVo 필수 데이터(year, term, stu_id)
	 * @return 현재 학생이 수강신청한 리스트
	 * 반드시 포함할 내용
	 * subject_type, subject_id, subject_name, subject_credit, mem_name(교수명), 
	 * room_id || room_num, time_week, lec_time
	 */
	public List<LectureVO> signUpLectureList(CourseVO coVo);
	
	/**
	 * 현재 학생이 수강신청한 총 학점
	 * @param coVo 필수 데이터(year, term, stu_id)
	 * @return 계산된 총 학점
	 */
	public int signUpCredit(CourseVO coVo);
	
	/**
	 * @param coVo 필수 데이터(year, term, stu_id)
	 * @return 수강신청 초기화면 (메인) 학점, 학과에 따른 추천
	 */
	public List<LectureVO> recommendLec(CourseVO coVo);
	
	/**
	 * 수강신청한 결과로 insert하는 메서드
	 * 해당 수강신청 버튼에 있는 subject_id번호를 받아서 insert한다
	 * @param coVo 필수 데이터(year, term, stu_id, subject_id)
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertCourse(CourseVO coVo);
	
	/**
	 * 중복된 시간이 있는 지 검색
	 * @param coVo 필수 데이터(year, term, stu_id, subject_id)
	 * @return 중복된 시간 숫자
	 */
	public int dulChk(CourseVO coVo);
	
	/**
	 * 수강취소한 결과를 delete하는 메서드
	 * 해당 수강신청삭제 버튼에 있는 subject_id번호를 받아서 delete한다
	 * @param coVo
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteCourse(CourseVO coVo);
	

	/**
	 * 해당 교수가 수업하는 학생조회
	 * @param lecVo
	 * @return
	 */
	public List<StudentVO> allCourseList(LectureVO lecVo);
	
	/**
	 * 조회 카운트
	 * @param lecVo
	 * @return
	 */
	public int allCourseListCount(LectureVO lecVo);

	/**
	 * 페이징 처리
	 * @param lecVo
	 * @return
	 */
	public PageVO allCoursePage(LectureVO lecVo);
}


package lecture.service;

import java.util.List;
import java.util.Map;

import board.vo.PageVO;
import lecture.vo.SubjectVO;

public interface ISubjectService {
	/**
	 * 관리자 - 과목 추가
	 * @param lecVo 필수
	 * (subject_id, major_id, subject_name, 
	 * 	subject_credit, subject_term, subject_theory, 
	 * 	subject_training, subject_type)
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 * 
	 * 과목번호는 Service에서 처리
	 */
	public int insertSubject(SubjectVO subVo);
	
	/**
	 * 과목번호 생성기
	 * while(major_id.length()<=3){
	 * 	major_id = "0"+major_id
	 * }
	 * subject_grade + substring(subject_term,0,1) + major_id + "_";
	 * 
	 * sql에서 같은 subject_grade, subject_term, major_id를 찾아서
	 * 	TO_NUMBER(SUBSTR(subject_id, 7, 3))를 통해 MAX로 젤 큰 숫자에서 +1하여
	 * 	Major처럼 3글자로 생성할 것
	 * @param subVo
	 * @return
	 */
	public String createSubjectId(SubjectVO subVo);
	
	/**
	 * 관리자, 교수 - 과목 수정
	 * @param lecVo
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 * 실패할 경우 입력한 데이터가 사라지지않고 현재 페이지에서 필수 데이터가 빠졌다고 경고창
	 */
	public int updateSubject(SubjectVO subVo);
	
	/**
	 * 관리자
	 * 개설된 강좌(lecture테이블)가 없을 경우에만 삭제 가능 
	 * (Service에서 countLecture메서드와 함께 처리)
	 * @param subject_id 지울 과목번호
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteSubject(String subject_id);
	
	/**
	 * (deleteSubject조건)
	 * deleteSubject를 할 수 있는지 lecture테이블에 해당 과목번호가 있는지 count
	 * @param subject_id
	 * @return lecture테이블에 있는 subject_id를 가지고 있는 데이터의 수
	 */
	public int countLecture(String subject_id);
	
	/**
	 * @param map (major_id, col_id, subject_credit, subject_grade, subject_type, start, end)
	 * @return 검색조건에 따른 과목 리스트
	 */
	public List<SubjectVO> subjectList(Map<String, Object> map);
	
	/**
	 * 위의 페이징 처리를 위해 전체 갯수를 가져오는 count
	 * @param map
	 * @return
	 */
	public int subjectListCount(Map<String, Object> map);
	
	/**
	 * 페이징 처리
	 * @param page
	 * @param map
	 * @return
	 */
	public PageVO pageInfo(int page, Map<String, Object> map);
	
	/**
	 * @param subject_id
	 * @return 해당하는 과목번호 상세 조회
	 */
	public SubjectVO subjectDetail(String subject_id);
	
}

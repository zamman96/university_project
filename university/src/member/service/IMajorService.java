package member.service;

import java.util.List;

import board.vo.PageVO;
import member.vo.MajorVO;
import member.vo.StudentVO;

public interface IMajorService {
	/**
	 * 전체 단과대를 중복없이 출력하는 메서드
	 * 분류를 위해 사용 
	 * @return
	 */
	public List<MajorVO> colleageList();
	
	/**
	 * @param mVo (col_id가 들어가거나 안들어가거나)
	 * @return 해당 단과대의 학과
	 */
	public List<MajorVO> majorList(int col_id);
	
	/**
	 * 해당 학과의 학생 리스트
	 * @param svo
	 * @return
	 */
	public List<StudentVO> majorStudentList(StudentVO svo);
	
	/**
	 * 해당 학과의 학생 수
	 * @param svo
	 * @return
	 */
	public int majorStudentListCount(StudentVO svo);
	
	/**
	 * 페이징 처리
	 * @param svo
	 * @return
	 */
	public PageVO pageMajorStuList(StudentVO svo);
}

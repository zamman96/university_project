package member.dao;

import java.util.List;

import member.vo.MemberVO;
import member.vo.StuChangeVO;

/**
 * @author PC-13
 *	학생 조회
 *	학적 조회관련
 */
public interface IStudentDao {

	// 학적조회
	public List<StuChangeVO> selectStuChange(String stu_id);
	
	// 학생 학적 변동신청
		/**
		 * @param scVo
		 * @return
		 */
	public int insertStuChange(StuChangeVO scVo);
		
		// 해당년도 학생 전체리스트 조회
	public List<MemberVO> getAllStudent();
		
		// 등록금 납부 학생 조회
	public List<MemberVO> selectTuiList();

		// 등록금 미납 학생 조회
	public List<MemberVO> selectTuiList2();
		
		// 학생 학적변경
	public int updateStuChange();

	// 학적변경 신청학생 조회
	public List<StuChangeVO> searchStuChangeList();
	
	// 휴학 신청 학생조회
	public List<StuChangeVO> reg_typeChangeList();

	// 복학 신청 학생조회
	public List<StuChangeVO> reg_typeChangeList2();
	
	// 휴학신청 승인
	public int reg_typeUpdate(String stuid);
		
		

}

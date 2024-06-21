package member.service;

import java.util.List;

import member.vo.MemberVO;
import member.vo.StuChangeVO;

public interface IStudentService {
	
	// 해당년도 학생 전체리스트 조회
	public List<MemberVO> getAllStudent();
	
	// 학적조회
	public List<StuChangeVO> selectStuChange(String stu_id);
	
	public int inserStuChange(StuChangeVO scVo);
	
	public List<MemberVO> selectTuiList();
	
	public int updateStuChange();
	
	public List<MemberVO> selectTuiList2();
	
	// 학적변경 신청학생 조회
	public List<StuChangeVO> searchStuChangeList();
	
	// 휴/복학 신청 학생조회
	public List<StuChangeVO> reg_typeChangeList();

	// 휴/복학 신청 학생조회
	public List<StuChangeVO> reg_typeChangeList2();
	
	// 휴학신청 승인
	public int reg_typeUpdate(String stuid);

}

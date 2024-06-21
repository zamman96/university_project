package member.dao;

import java.util.List;
import java.util.Map;

import member.vo.MemberVO;
import member.vo.StuChangeVO;

/**
 * @author PC-13
 *	회원 추가와 로그인 관련된 Dao
 */
public interface IMemberDao {
	
	/**
	 * 관리자 메인의 학적변동 알림
	 * @return
	 */
	public List<StuChangeVO> alarmSelect();
	
	/**
	 * 회원 정보를 변경하는 메서드
	 * @param memVo (mem_id,  mem_pass)
	 * @return
	 */
	public int memPwChange(MemberVO memVo);
	
	/**
	 * 회원 비밀번호를 조회하는 메서드
	 * @param memVo (mem_id, mem_pass)
	 * @return
	 */
	public String pwChk(MemberVO memVo);
	
	/**
	 * 회원 정보를 변경하는 메서드
	 * @param memVo (mem_id, mem_tel, mem_mail, mem_add)
	 * @return
	 */
	public int memInfoChange(MemberVO memVo);

	/**
	 * 아이디와 비밀번호 일치 여부하는 지 확인
	 * 일치 여부에 따라 mem_grantno로 해당하는 메인 페이지로 이동
	 * @param memVo(mem_id, mem_pass)
	 * @return 해당하는 회원
	 */
	public MemberVO login(MemberVO memVo);
	
	/**
	 * @param map (year : year) (major_id : )
	 * @return 생성된 높은 학번값을 찾아서 다음 값을 insert시키는 메서드
	 */
	public String stuIdCreate(Map<String, Object> map);
	
	/**
	 * 교수 사번 생성
	 * @param memVo (major_id)
	 * @return
	 */
	public String proIdCreate(MemberVO memVo);
	
	/**
	 * 관리자 사번 생성
	 * @param mem_mail
	 * @return
	 */
	public String admIdCreate(String mem_mail);
	
	// 아이디찾기 일치 여부
	
//	// 비밀번호 찾기 일치 여부
//	public String findLogfin(MemberVO memVo);

	// 임시비밀번호 변경
	
	// 회원 추가
	public int insertMember(MemberVO memVo);
	
	// 학생 추가시
	public int insertStudent(MemberVO memVo);
	
	// 교수 추가시
	public int insertProfessor(MemberVO memVo);
	
	// 관리자 추가시
	public int insertAdmin(MemberVO memVo);

	//비밀번호 찾기
	public MemberVO mbGet(String mbid);

	public void updatePassword(String string, String tempPassword);

	public String findPw(Map<String, Object> map);
	
//	public String findMail(Map<String, Object> map);
	
	public MemberVO getMember(String uId);
//
//	public MemberVO findMail(String mail);


	 public int updatePassword(Map<String, Object> map);

	public String findMail(Map<String, Object> map);











	
	
}

package member.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.MemberVO;
import member.vo.StuChangeVO;

public class MemberServiceImpl implements IMemberService{
	private static MemberServiceImpl service;
	private IMemberDao dao;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberServiceImpl getInstance() {
		if(service==null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public MemberVO login(MemberVO memVo) {
		return dao.login(memVo);
	}

	@Override
	public List<MemberVO> studentIdCreate(List<MemberVO> list, String year) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberVO> save = new ArrayList<MemberVO>();
		map.put("year", year);
		int major_id = list.get(0).getMajor_id();
		map.put("major_id", major_id);
		
		String stu_id = dao.stuIdCreate(map);
		String id_s = stu_id.substring(0,7);
		int num = Integer.parseInt(stu_id.substring(7));
		
		for(MemberVO memvo : list) {
			String bir = memvo.getMem_bir();
			
			// 연도 뒤 두 자리 + 월 + 일
	        String pw = bir.substring(2, 4) + bir.substring(5, 7) + bir.substring(8, 10);
	        
	        String numStr = ""+num++;
	        while(numStr.length()<3) {
	        	numStr= "0"+numStr;
	        }
	        memvo.setMem_id(id_s+numStr);
	        memvo.setMem_pass(pw);
			save.add(memvo);
		}
		
		return save;
	}

	@Override
	public int insertMember(MemberVO memVo) {
		// TODO Auto-generated method stub
		return dao.insertMember(memVo);
	}

	@Override
	public int insertStudent(MemberVO memVo) {
		// TODO Auto-generated method stub
		return dao.insertStudent(memVo);
	}

	@Override
	public String stuIdCreate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.stuIdCreate(map);
	}

	@Override
	public String proIdCreate(MemberVO memVo) {
		// TODO Auto-generated method stub
		return dao.proIdCreate(memVo);
	}

	@Override
	public String admIdCreate(String mem_mail) {
		// TODO Auto-generated method stub
		return dao.admIdCreate(mem_mail);
	}

	@Override
	public int insertProfessor(MemberVO memVo) {
		// TODO Auto-generated method stub
		return dao.insertProfessor(memVo);
	}

	@Override
	public int insertAdmin(MemberVO memVo) {
		// TODO Auto-generated method stub
		return dao.insertAdmin(memVo);
	}

	@Override
	public int memInfoChange(MemberVO memVo) {
		return dao.memInfoChange(memVo);
	}

	@Override
	public String pwChk(MemberVO memVo) {
		return dao.pwChk(memVo);
	}

	@Override
	public int memPwChange(MemberVO memVo) {
		return dao.memPwChange(memVo);
	}

	/**
	 * 관리자 메인의 학적변동 알림
	 * @return
	 */
	   @Override
	   public List<StuChangeVO> alarmSelect() {
	      return dao.alarmSelect();
	   }


	@Override
	public MemberVO mbGet(String mbid) {
		// TODO Auto-generated method stub
		return dao.mbGet(mbid);
	}
	
	@Override
	public String findPw(Map<String, Object> map) {
		// 아이디 와 주민등록번호로 회원을 찾음
		//MemberVO member = dao.mbGet(map.get("uId").toString());
		
		//db의 pass가져오기 
		String pass =  dao.findPw(map);
		
		
		
		 // 회원이 존재하지 않는 경우 if(member == null) { return "등록되지 않은 회원입니다."; }
		 
		 //임시 비밀번호 생성
		 String tempPassword = generateTempPassword();
	     
	    // 비밀번호 변경 
		// dao.updatePassword(map.get("uId").toString(), tempPassword);
		 
		 // 생성된 임시 비밀번호 반환
		 return tempPassword;
		
	} 

	


   public int updatePassword(Map<String, Object> map) {
	   
	  return  dao.updatePassword(map);
	   
   }
	
   
	public String generateTempPassword() {
		// 대문자, 소문자, 숫자, 특수문자를 모두 포함하는 문자열을 정의.
		String upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerChars = "abcdefghijklmnopqrstuvwxyz";
		String numberChars = "0123456789";
		String specialChars = "!@#$%^&*()-_=+[]{}|;:,.<>?";
		
		// 임시 비밀번호를 담을 StringBuilder 객체를 생성.
		StringBuilder tempPassword = new StringBuilder();
		
		// 랜덤 객체를 생성.
		Random rnd = new Random();
		
		// 대문자를 하나 추가.
		tempPassword.append(upperChars.charAt(rnd.nextInt(upperChars.length())));
		
		// 특수문자를 하나 추가.
		tempPassword.append(specialChars.charAt(rnd.nextInt(specialChars.length())));
		
		// 나머지 6자는 소문자와 숫자를 랜덤하게 선택하여 추가.
		for(int i=0; i < 6; i++) {
			// 소문자 또는 숫자를 랜덤하게 선택하여 tempPassword에 추가.
			String candidateChars = lowerChars + numberChars;
			tempPassword.append(candidateChars.charAt(rnd.nextInt(candidateChars.length())));
		}
		
		// 생성된 임시 비밀번호를 섞기.
		char[] passwordChars = tempPassword.toString().toCharArray();
		for(int i = 0; i < passwordChars.length; i++) {
			int randomIndex = rnd.nextInt(passwordChars.length);
			char temp = passwordChars[i];
			passwordChars[i] = passwordChars[randomIndex];
			passwordChars[randomIndex] = temp;
		}
		
		tempPassword = new StringBuilder(String.valueOf(passwordChars));
		
		// 생성된 임시 비밀번호를 반환.
		return tempPassword.toString();
	}

//	@Override
//	public String findMail(Map<String, Object> map) {
//
//		//db의 pass가져오기 
//		String mail =  dao.findMail(map);
//		
//
//		 // 메일
//		 return mail;
//		
//	} 
	@Override
	public MemberVO getMember(String uId) {
		return dao.getMember(uId);
	}



	@Override
	public String findMail(Map<String, Object> map) {
		
		// 아이디 와 주민등록번호로 회원을 찾음
		MemberVO member = dao.mbGet(map.get("uId").toString());
		
		//db의 pass가져오기 
		String mail =  dao.findMail(map);
		

	     
	    // 비밀번호 변경 
		// dao.updatePassword(map.get("uId").toString(), tempPassword);
		 
		 // 생성된 임시 비밀번호 반환
		 return mail;
//		return dao.findMail(memVo);
	}
	
	
//	@Override
//	public MemberVO findMail(String mail) {
//		return dao.findMail(mail);
//	}




//	@Override
//	public MemberVO findLogin(MemberVO memVo) {
//		// TODO Auto-generated method stub
//		return null;
//	}




}

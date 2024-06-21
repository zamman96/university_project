package member.dao;



import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import member.vo.MemberVO;
import member.vo.StuChangeVO;
import util.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao{
	private static MemberDaoImpl dao;

	private MemberDaoImpl() {
		
	}
	
	public static MemberDaoImpl getInstance() {
		if(dao==null) dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public MemberVO login(MemberVO memVo) {
		SqlSession session = null;
		MemberVO memInfo = null;
		try {
			session = MyBatisUtil.getSqlSession();
			String id = memVo.getMem_id().substring(0, 1);
			if(id.equals("p")) {
				memInfo = session.selectOne("member.loginPro", memVo);
			} else if(id.equals("a")) {
				memInfo = session.selectOne("member.loginAdm", memVo);
			} else {
				memInfo = session.selectOne("member.loginStu", memVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(session!=null)try{session.close();}catch(Exception e) {e.printStackTrace();}
		}
		return memInfo;
	}

	@Override
	public String stuIdCreate(Map<String, Object> map) {
		SqlSession session = null;
		String stu_id = null;
		try {
			session = MyBatisUtil.getSqlSession();
			stu_id = session.selectOne("member.stu_id", map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(session!=null)try{session.close();}catch(Exception e) {e.printStackTrace();}
		}
		return stu_id;
	}

	
	@Override
	public int insertMember(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("member.signUp", memVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertStudent(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("member.stuSignUp", memVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public String proIdCreate(MemberVO memVo) {
		SqlSession session = null;
		String pro_id = null;
		try {
			session = MyBatisUtil.getSqlSession();
			pro_id = session.selectOne("member.pro_id", memVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(session!=null)try{session.close();}catch(Exception e) {e.printStackTrace();}
		}
		return pro_id;
	}

	@Override
	public String admIdCreate(String mem_mail) {
		SqlSession session = null;
		String adm_id = null;
		try {
			session = MyBatisUtil.getSqlSession();
			adm_id = session.selectOne("member.adm_id", mem_mail);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(session!=null)try{session.close();}catch(Exception e) {e.printStackTrace();}
		}
		return adm_id;
	}

	@Override
	public int insertProfessor(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("member.proSignUp", memVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertAdmin(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("member.admSignUp", memVo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	/**
	 * 회원 정보를 변경하는 메서드 memVo (mem_tel, mem_mail, mem_add)
	 */
	@Override
	public int memInfoChange(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("member.memInfoChange", memVo);
			if(cnt > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	/**
	 * 회원 비밀번호를 확인하는 메서드
	 */
	@Override
	public String pwChk(MemberVO memVo) {
		SqlSession session = null;
		String result = "";
		try {
			session = MyBatisUtil.getSqlSession();
			result = session.selectOne("member.pwChk", memVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	/**
	 * 회원 정보를 변경하는 메서드
	 * @param memVo (mem_id,  mem_pass)
	 * @return
	 */
	@Override
	public int memPwChange(MemberVO memVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("member.memPwChange", memVo);
			if(cnt > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}


	/**
	 * 관리자 메인 학적변동 알림
	 */
	@Override
	public List<StuChangeVO> alarmSelect() {
		SqlSession session = null;
		List<StuChangeVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("member.alarmSelect");
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}


//	//아이디랑 생년월일 확인 후 메일 출력 메서드
//	@Override
//	public String findLogfin(MemberVO memVo) {
//		SqlSession session = null;
//		MemberVO find = null;
//		try {
//			session = MyBatisUtil.getSqlSession();
//			String id = memVo.getMem_id().substring(0, 1);
//			if(id.equals("p")) {
//				find = session.selectOne("member.loginPro", memVo);
//			} else if(id.equals("a")) {
//				find = session.selectOne("member.loginAdm", memVo);
//			} else {
//				find = session.selectOne("member.loginStu", memVo);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		} finally {
//			if(session!=null)try{session.close();}catch(Exception e) {e.printStackTrace();}
//		}
//		return memInfo;
//	}

	@Override
	public void updatePassword(String uId, String tempPassword) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		try {
			Map<String, Object>paramMap = new HashMap<>();
			paramMap.put("uId", uId);
			paramMap.put("tempPassword", tempPassword);
			
			
			sqlSession.update("member.updatePassword", paramMap);
			sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
	   
	}

	@Override
	public String findPw(Map<String, Object> map) {
		String fpw = null;
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		try {
			 fpw  = sqlSession.selectOne("member.findPw", map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		//비밀번호 를 리턴 
		return fpw;
	}
//	@Override
//	public String findMail(Map<String, Object> map) {
//		String mail = null;
//		SqlSession sqlSession = MyBatisUtil.getSqlSession();
//		
//		try {
//			mail  = sqlSession.selectOne("member.findMail", map);
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			sqlSession.close();
//		}
//		//비밀번호 를 리턴 
//		return mail;
//	}


	@Override
	public MemberVO mbGet(String mbId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		MemberVO member = null;
		
		try {
			member = sqlSession.selectOne("member.getMember", mbId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return member;
	}

	@Override
	public MemberVO getMember(String uId) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		MemberVO mv = null;
		
		try {
			
			mv= session.selectOne("member.getMember",uId);
			
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return mv;
	}

	@Override
	public int updatePassword(Map<String, Object> map) {
		// TODO Auto-generated method stub
			SqlSession session = MyBatisUtil.getSqlSession();
		
			int  res = 0;
		
		try {
			
			res= session.update("member.updatePassword",map);
			if(res==1) {
				session.commit();
			}
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public String findMail(Map<String, Object> map) {
		String mail = null;
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		try {
			 mail  = sqlSession.selectOne("member.findMail", map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		//비밀번호 를 리턴 
		return mail;
		
	}

//	@Override
//	public MemberVO findMail(String mail) {
//	SqlSession session = MyBatisUtil.getSqlSession();
//		
//		MemberVO findMail = null;
//		
//		try {
//			
//			findMail= session.selectOne("member.findMail", mail);
//			
//			
//		} catch (PersistenceException ex) {
//			ex.printStackTrace();
//		} finally {
//			session.close();
//		}
//		return findMail;
//	}

}

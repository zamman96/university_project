package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.vo.MemberVO;
import member.vo.ProfessorVO;
import util.MyBatisUtil;

public class ProfessorDaoImpl implements IProfessorDao {
	private static ProfessorDaoImpl dao;
	
	private ProfessorDaoImpl() { }
	
	public static ProfessorDaoImpl getInstance() {
		
		if(dao==null) {
			dao = new ProfessorDaoImpl();
		}
		
		return dao;
		
	}


	@Override
	public MemberVO selectProfessor(String memName) {
		SqlSession session = null;
		MemberVO memVo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			memVo = session.selectOne("member.detailProfesseor",memName);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return memVo;
	}

	@Override
	public List<ProfessorVO> professorAllList() {
		SqlSession session = null;
		List<ProfessorVO> vo = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			vo = session.selectList("member.professorAllList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	
	}

	@Override
	public int updatePro_type(ProfessorVO proVo) {
		SqlSession session = null;
		int result = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			result = session.update("member.updatePro_type", proVo);
			if(result>1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

}

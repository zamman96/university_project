package member.service;

import java.util.List;

import member.dao.IProfessorDao;
import member.dao.ProfessorDaoImpl;
import member.vo.MemberVO;
import member.vo.ProfessorVO;

public class ProfessorServiceImpl implements IProfessorService {

	private IProfessorDao dao;
	
	private static ProfessorServiceImpl service;
	
	private ProfessorServiceImpl() {
		dao = ProfessorDaoImpl.getInstance();
	}
	
	public static ProfessorServiceImpl getInstance(){
		
		if(service==null) {
			service = new ProfessorServiceImpl();
		}
		return service;
	}

	@Override
	public MemberVO selectProfessor(String memName) {
		
		return dao.selectProfessor(memName);
	}

	@Override
	public List<ProfessorVO> professorAllList() {
		return dao.professorAllList();
	}

	@Override
	public int updatePro_type(ProfessorVO proVo) {
		
		return dao.updatePro_type(proVo);
	}

}

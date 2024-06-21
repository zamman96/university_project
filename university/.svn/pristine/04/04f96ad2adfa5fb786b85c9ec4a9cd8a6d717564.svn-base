package course.service;

import java.util.ArrayList;
import java.util.List;

import course.dao.AttendDaoImpl;
import course.dao.IAttendDao;
import course.dao.IScoreDao;
import course.dao.ScoreDaoImpl;
import course.vo.AttendVO;
import course.vo.ScoreVO;

public class AttendServiceImpl implements IAttendService{
	private static AttendServiceImpl service;
	private IAttendDao dao;
	private IScoreDao sao;
	
	private AttendServiceImpl() {
		dao = AttendDaoImpl.getInstance();
		sao = ScoreDaoImpl.getInstance();
	}
	
	public static AttendServiceImpl getInstance() {
		if(service==null) service=new AttendServiceImpl();
		return service;
	}

	@Override
	public List<AttendVO> attendList(AttendVO avo) {
		List<AttendVO> list = dao.attendList(avo);
		List<AttendVO> save = new ArrayList<AttendVO>();
		for(AttendVO vo : list) {
			vo.setAttend_type(0);
			ScoreVO svo = new ScoreVO();
			svo.setYear(vo.getYear());
			svo.setTerm(vo.getTerm());
			svo.setSubject_id(vo.getSubject_id());
			svo.setStu_id(vo.getStu_id());
			svo.setAttend_type(0);
			int absent = sao.attendCnt(svo);
			svo.setAttend_type(2);
			int tardy = sao.attendCnt(svo);
			svo.setAttend_type(1);
			int attend = sao.attendCnt(svo);
			
			vo.setAbsent_cnt(absent);
			vo.setAttend_cnt(attend);
			vo.setTardy_cnt(tardy);
			
			save.add(vo);
		}
		return save;
	}

	@Override
	public int attendInsert(AttendVO avo) {
		// TODO Auto-generated method stub
		return dao.attendInsert(avo);
	}

	@Override
	public int attendUpdate(AttendVO avo) {
		// TODO Auto-generated method stub
		return dao.attendUpdate(avo);
	}

	@Override
	public List<AttendVO> attendUpdateList(AttendVO avo) {
		// TODO Auto-generated method stub
		return dao.attendUpdateList(avo);
	}

	@Override
	public int attendDate(AttendVO avo) {
		// TODO Auto-generated method stub
		return dao.attendDate(avo);
	}

	@Override
	public int attendDelete(AttendVO avo) {
		// TODO Auto-generated method stub
		return dao.attendDelete(avo);
	}
}

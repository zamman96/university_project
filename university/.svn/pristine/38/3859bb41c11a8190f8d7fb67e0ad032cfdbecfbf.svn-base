package member.service;

import java.util.List;

import member.dao.IStudentDao;
import member.dao.StudentDaoImpl;
import member.vo.MemberVO;
import member.vo.StuChangeVO;

public class StudentServiceImpl implements IStudentService {
	private IStudentDao dao;
	
	private static StudentServiceImpl service;
	
	private StudentServiceImpl() {
		dao = StudentDaoImpl.getInstance();
	}
	
	public static StudentServiceImpl getInstance() {
		if(service == null) {
			service = new StudentServiceImpl();
		}
		return service;
	}
	

	@Override
	public int inserStuChange(StuChangeVO scVo) {
		return dao.insertStuChange(scVo);
	}

	@Override
	public List<MemberVO> selectTuiList() {
		return dao.selectTuiList();
	}

	@Override
	public int updateStuChange() {
		// TODO Auto-generated method stub
		return dao.updateStuChange();
	}


	@Override
	public List<MemberVO> getAllStudent() {
		return dao.getAllStudent();
	}

	@Override
	public List<MemberVO> selectTuiList2() {
		return dao.selectTuiList2();
	}


	@Override
	public List<StuChangeVO> selectStuChange(String stu_id) {
		return dao.selectStuChange(stu_id);
	}

	@Override
	public List<StuChangeVO> searchStuChangeList() {
		
		return dao.searchStuChangeList();
	}

	@Override
	public List<StuChangeVO> reg_typeChangeList() {
		// TODO Auto-generated method stub
		return dao.reg_typeChangeList();
	}

	@Override
	public List<StuChangeVO> reg_typeChangeList2() {
		// TODO Auto-generated method stub
		return dao.reg_typeChangeList2();
	}

	@Override
	public int reg_typeUpdate(String stuid) {
		// TODO Auto-generated method stub
		return dao.reg_typeUpdate(stuid);
	}


}

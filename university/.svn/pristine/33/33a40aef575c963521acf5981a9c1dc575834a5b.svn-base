package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IStudentService;
import member.service.StudentServiceImpl;
import member.vo.StuChangeVO;

@WebServlet("/reg_typeChangeList2.do")
public class Reg_typeChangeList2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		String reg_type = request.getParameter("reg_type");
		IStudentService service = StudentServiceImpl.getInstance();
//		StuChangeVO vo = new StuChangeVO();
//		vo.setReg_type("휴학");
		
		List<StuChangeVO> tcList = service.reg_typeChangeList2();
		
		request.setAttribute("tcList", tcList);
		
		request.getRequestDispatcher("/admin/student/reg_typeChangeList2.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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
import member.vo.MemberVO;

@WebServlet("/getAllStudent.do")
public class GetAllStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IStudentService service = StudentServiceImpl.getInstance();
		List<MemberVO> stuList = service.getAllStudent();
		
		request.setAttribute("stuList", stuList);
		
		request.getRequestDispatcher("/admin/student/studentList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

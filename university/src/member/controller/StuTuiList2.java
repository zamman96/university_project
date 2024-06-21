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

@WebServlet("/stuTuiList2.do")
public class StuTuiList2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	IStudentService service = StudentServiceImpl.getInstance();
		
		List<MemberVO> tuiList2 = service.selectTuiList2();
		
//		System.out.println("확인용 tuiList : "+tuiList);
		request.setAttribute("tuiList2", tuiList2);
		
		request.getRequestDispatcher("/admin/student/stuTuiList2.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

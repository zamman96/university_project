package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.dao.StudentDaoImpl;
import member.service.IStudentService;
import member.service.StudentServiceImpl;
import member.vo.MemberVO;
import member.vo.StuChangeVO;

@WebServlet("/reg_typeUpdate2.do")
public class Reg_typeUpdate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String stuid = request.getParameter("stu_id");
		
//		PrintWriter out = response.getWriter();
		System.out.println("stuid ==========>>>>> "+stuid);
		if(stuid==null) {
			response.sendRedirect("http://localhost/student/searchStuChange.jsp"); 
			return;
		}
			
		
		
		IStudentService service = StudentServiceImpl.getInstance();
		
//		Gson gson = new Gson();
//		vo = gson.fromJson(vo.getStu_id(), StuChangeVO.class);
//		vo = gson.fromJson(vo.getStu_id(), MemberVO.class);
//		vo.setStu_id(vo.getStu_id());
//		if(stuChangeVo!=null) {
//			session.setAttribute("writer", stuChangeVo);
//			session.setMaxInactiveInterval(0);
//			out.println(stuChangeVo.getStu_id());
//			
//		}
		
		int result = service.reg_typeUpdate(stuid);
		
//		request.setAttribute("result", result);
//		
//		request.getRequestDispatcher("/admin/student/reg_typeUpdate.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/reg_typeChangeList.do");
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

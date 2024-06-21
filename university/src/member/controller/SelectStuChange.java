package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.service.IStudentService;
import member.service.StudentServiceImpl;
import member.vo.StuChangeVO;
import util.StreamData;

@WebServlet("/selectStuChange.do")
public class SelectStuChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String stu_id = request.getParameter("stu_id");
		
		IStudentService service = StudentServiceImpl.getInstance();
		List<StuChangeVO> list = service.selectStuChange(stu_id);
	
		request.setAttribute("list", list);
		request.getRequestDispatcher("/student/jsp/stuchangelist.jsp").forward(request, response);
	}

}

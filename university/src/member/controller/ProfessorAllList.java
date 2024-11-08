package member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IProfessorService;
import member.service.ProfessorServiceImpl;
import member.vo.ProfessorVO;

@WebServlet("/professorAllList.do")
public class ProfessorAllList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		IProfessorService service = ProfessorServiceImpl.getInstance();
		List<ProfessorVO> proAllList = service.professorAllList();
		
		request.setAttribute("proAllList", proAllList);
		
		request.getRequestDispatcher("/admin/professor/professorAllList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

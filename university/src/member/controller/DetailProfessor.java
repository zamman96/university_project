package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.service.IProfessorService;
import member.service.ProfessorServiceImpl;
import member.vo.MemberVO;
import member.vo.ProfessorVO;

@WebServlet("/detailProfessor.do")
public class DetailProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IProfessorService service = ProfessorServiceImpl.getInstance();
		String memName = request.getParameter("mem_name");
		MemberVO memVO = new MemberVO();
		
		
		memVO = service.selectProfessor(memName);
		request.setAttribute("memVO", memVO);
		
		request.getRequestDispatcher("/admin/professor/detailProfessor.jsp").forward(request, response);
//		Gson gson = new Gson();
//		pfVO = gson.fromJson(json, ProfessorVO.class);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

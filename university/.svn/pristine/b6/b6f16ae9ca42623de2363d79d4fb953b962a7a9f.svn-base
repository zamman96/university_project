package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/member/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberVO loginVo = new MemberVO();
		loginVo.setMem_id(id);
		loginVo.setMem_pass(pw);

		IMemberService service = MemberServiceImpl.getInstance();

		MemberVO memVo = service.login(loginVo);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (memVo!=null) {
			int grantno = memVo.getMem_grantno();
			
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(0);
			session.setAttribute("login", memVo);
			out.println(memVo.getMem_grantno());
			return;
		} else {
			out.println("로그인 정보가 일치하지 않습니다");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

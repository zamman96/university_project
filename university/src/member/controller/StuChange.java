package member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.google.gson.Gson;

import member.service.IMemberService;
import member.service.IStudentService;
import member.service.MemberServiceImpl;
import member.service.StudentServiceImpl;
import member.vo.MemberVO;
import member.vo.StuChangeVO;

@WebServlet("/stuChange.do")
public class StuChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		// 로그인 아이디 가져오기
		MemberVO vo = (MemberVO)session.getAttribute("login");
		String userid = vo.getStu_id();
		//蹂��닔 a = request.getParameter("data"); << �씠寃� �븘�슙�븷�닔�룄 �뀭�뀋�뀉�떎
		// �삁�젣 �삊媛숈� �뼇�떇 �엳�쓬
		
//		System.out.println("아이디 : "+userid);
		if(userid==null) {
			response.sendRedirect("http://localhost/login/login.jsp");
			return;
		}
		IStudentService service = StudentServiceImpl.getInstance();
		
		
		
		StringBuffer buf = new StringBuffer();
		String line = null;
		
		try {
			BufferedReader reader = request.getReader();
			
			while((line = reader.readLine())!=null) {
				
				buf.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String reqdata = buf.toString();
		Gson gson = new Gson();
		StuChangeVO changeVo = gson.fromJson(reqdata, StuChangeVO.class);
		changeVo.setStu_id(userid);
		// 신청인 아이디 세션에 저장
		session.setAttribute("writer", changeVo);
		System.out.println(changeVo.getStu_id());
		int result = service.inserStuChange(changeVo);
		
		request.setAttribute("result", result);
		
		
		request.getRequestDispatcher("/student/jsp/insertStuChange.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

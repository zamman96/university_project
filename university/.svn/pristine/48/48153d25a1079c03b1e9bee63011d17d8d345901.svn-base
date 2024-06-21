package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.StuChangeVO;

@WebServlet("/alarm.do")
public class Alarm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<StuChangeVO> list = service.alarmSelect();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/main/mainview/alarmlist.jsp").forward(request, response);
		
		
	}

}

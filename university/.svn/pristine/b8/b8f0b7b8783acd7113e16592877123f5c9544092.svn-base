package member.controller.signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

@WebServlet("/createStuId.do")
public class CreateStuId extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		String year = request.getParameter("year");
		int major_id = Integer.parseInt(request.getParameter("major_id"));
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("year", year);
		map.put("major_id", major_id);
		
		String stu_id = service.stuIdCreate(map); 
		
		out.println(stu_id);
		response.flushBuffer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

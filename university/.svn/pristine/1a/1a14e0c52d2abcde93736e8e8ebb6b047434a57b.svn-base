package member.controller.signup;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;
import util.StreamData;

@WebServlet("/insertAdmin.do")
public class InsertAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		String reqdata = StreamData.getReqData(request);
		Gson gson = new Gson();
		MemberVO memVo = gson.fromJson(reqdata, MemberVO.class);
		
		int cnt = service.insertMember(memVo);
		cnt += service.insertAdmin(memVo);
		
		out.println(cnt);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

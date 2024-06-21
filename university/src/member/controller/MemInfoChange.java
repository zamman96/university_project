package member.controller;

import java.io.IOException;
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

@WebServlet("/member/memInfoChange.do")
public class MemInfoChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String reqdata = StreamData.getReqData(request);
		
		Gson gson = new Gson();
		MemberVO vo = gson.fromJson(reqdata, MemberVO.class);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int result = service.memInfoChange(vo);
		
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("/mypage/view/result.jsp").forward(request, response);
	
	}

}
package course.controller.signup;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import course.service.CourseServiceImpl;
import course.service.ICourseService;
import course.vo.CourseVO;
import util.StreamData;

@WebServlet("/sumCredit.do")
public class SumCredit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ICourseService service = CourseServiceImpl.getInstance();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String reqdata = StreamData.getReqData(request);
		
		Gson gson = new Gson();
		CourseVO cvo = gson.fromJson(reqdata, CourseVO.class);
		int cnt = service.signUpCredit(cvo);
		
		out.println(cnt);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

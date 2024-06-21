package lecture.controller.subject;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import lecture.service.ISubjectService;
import lecture.service.SubjectServiceImpl;
import lecture.vo.SubjectVO;
import util.StreamData;

@WebServlet("/insertSubject.do")
public class InsertSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reqdata = StreamData.getReqData(request);
		Gson gson = new Gson();
		
		SubjectVO subVo = gson.fromJson(reqdata, SubjectVO.class);
		
		ISubjectService service = SubjectServiceImpl.getInstance();
		int cnt = service.insertSubject(subVo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(cnt);
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

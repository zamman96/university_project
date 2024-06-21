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

@WebServlet("/subjectDetail.do")
public class SubjectDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ISubjectService service = SubjectServiceImpl.getInstance();
		String subject_id = request.getParameter("subject_id");
		
		SubjectVO svo = service.subjectDetail(subject_id);
		Gson gson = new Gson();
		String json = gson.toJson(svo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

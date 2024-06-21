package lecture.controller.subject;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.service.ISubjectService;
import lecture.service.SubjectServiceImpl;

@WebServlet("/deleteSubject.do")
public class DeleteSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String subject_id = request.getParameter("subject_id");
		
		ISubjectService service = SubjectServiceImpl.getInstance();
		
		int lecCount = service.countLecture(subject_id);
		
		System.out.println(lecCount);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(lecCount>0) {
		} else {
			int cnt = service.deleteSubject(subject_id);
			out.println(cnt);
		}
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

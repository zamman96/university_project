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
import lecture.vo.SubjectVO;

@WebServlet("/createSubjectId.do")
public class CreateSubjectId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int subject_grade= Integer.parseInt(request.getParameter("subject_grade"));
		int major_id=Integer.parseInt(request.getParameter("major_id"));
		String subject_term = request.getParameter("subject_term");
		
		SubjectVO subvo = new SubjectVO();
		subvo.setMajor_id(major_id);
		subvo.setSubject_grade(subject_grade);
		subvo.setSubject_term(subject_term);
		
		ISubjectService service = SubjectServiceImpl.getInstance();
		String subject_id = service.createSubjectId(subvo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 값이 없을 때의 처리
		if(subject_id==null) {
			String majorStr = ""+subvo.getMajor_id();
			while(majorStr.length()<3) {
				majorStr = "0"+majorStr;
			}
			subject_id=subvo.getSubject_grade()+subvo.getSubject_term().substring(0,1)+majorStr+"-001";
		}
		
		out.println(subject_id);
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

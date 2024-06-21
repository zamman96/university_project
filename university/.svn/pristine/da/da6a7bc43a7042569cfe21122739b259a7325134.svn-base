package lecture.controller.lecture;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import lecture.service.ILectureService;
import lecture.service.LectureServiceImpl;
import lecture.vo.LectureVO;

@WebServlet("/updateLecture.do")
public class UpdateLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String subject_id = request.getParameter("subject_id");
		String year = request.getParameter("year");
		String term = request.getParameter("term");
		String pro_id = request.getParameter("pro_id");
		int lec_count = Integer.parseInt(request.getParameter("lec_count"));
		
		Gson gson = new Gson();
		LectureVO lecVo = new LectureVO();
		lecVo.setSubject_id(subject_id);
		lecVo.setYear(year);
		lecVo.setTerm(term);
		lecVo.setPro_id(pro_id);
		lecVo.setLec_count(lec_count);
		
		ILectureService service = LectureServiceImpl.getInstance();
		int cnt = service.updateLecture(lecVo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(cnt);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

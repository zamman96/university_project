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

@WebServlet("/detailLecture.do")
public class DetailLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String subject_id = request.getParameter("subject_id");
		String year = request.getParameter("year");
		String term = request.getParameter("term");
		
		Gson gson = new Gson();
		LectureVO lecVo = new LectureVO();
		lecVo.setSubject_id(subject_id);
		lecVo.setYear(year);
		lecVo.setTerm(term);
		
		ILectureService service = LectureServiceImpl.getInstance();
		LectureVO vo = service.DetailLecture(lecVo);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String json = gson.toJson(vo);
		
		out.println(json);
		response.flushBuffer();
		
//		request.setAttribute("json", json);
//		request.getRequestDispatcher("/admin/lecture/lectureDetail.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

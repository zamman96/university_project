package course.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import course.service.CourseServiceImpl;
import course.service.ICourseService;
import course.vo.CourseVO;
import lecture.vo.LectureVO;

@WebServlet("/course/timetablePro.do")
public class TimeTablePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String year = request.getParameter("year");
		String term = request.getParameter("term");
		
		ICourseService service = CourseServiceImpl.getInstance();
		
		LectureVO vo = new LectureVO();
		vo.setPro_id(id);
		vo.setTerm(term);
		vo.setYear(year);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List<LectureVO> list = service.timeTablePro(vo);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		out.println(json);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

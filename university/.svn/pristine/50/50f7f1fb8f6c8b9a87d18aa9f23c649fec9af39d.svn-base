package lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import lecture.service.ILectureService;
import lecture.service.LectureServiceImpl;
import lecture.vo.LectureVO;

@WebServlet("/professorLectureList.do")
public class ProfessorLectureList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String year = request.getParameter("year");
		String term = request.getParameter("term");
		String pro_id = request.getParameter("pro_id");
		
		Gson gson = new Gson();
		LectureVO lecVo = new LectureVO();
		lecVo.setPro_id(pro_id);
		lecVo.setYear(year);
		lecVo.setTerm(term);
		
		ILectureService service = LectureServiceImpl.getInstance();
		List<LectureVO> list = service.professorLectureList(lecVo);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String json = gson.toJson(list);
		
		out.println(json);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

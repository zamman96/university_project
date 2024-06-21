package lecture.controller.lecture;

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
import member.vo.MemberVO;
import member.vo.ProfessorVO;

@WebServlet("/profTimeList.do")
public class ProfTimeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int major_id = Integer.parseInt(request.getParameter("major_id"));
		String year = request.getParameter("year");
		String term = request.getParameter("term");
		String time_id = request.getParameter("time_id");
		ILectureService service = LectureServiceImpl.getInstance();
		
		LectureVO vo = new LectureVO();
		vo.setMajor_id(major_id);
		vo.setYear(year);
		vo.setTerm(term);
		vo.setTime_id(time_id);
		List<MemberVO> list = service.proUpdateList(vo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
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

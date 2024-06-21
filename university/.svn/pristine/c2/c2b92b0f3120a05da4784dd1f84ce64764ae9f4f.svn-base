package course.controller.score.stu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import course.service.IScoreService;
import course.service.ScoreServiceImpl;
import course.vo.ScoreVO;

@WebServlet("/scoreStuList.do")
public class ScoreStuList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String stu_id = request.getParameter("stu_id");
		String year = request.getParameter("year");
		String term = request.getParameter("term");
		
		ScoreVO svo = new ScoreVO();
		svo.setStu_id(stu_id);
		svo.setYear(year);
		svo.setTerm(term);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		IScoreService service = ScoreServiceImpl.getInstance();
		
		List<ScoreVO> list = service.scoreStuList(svo);
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

package course.controller.score.prof;

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
import util.StreamData;

@WebServlet("/scoreListChk.do")
public class ScoreListChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String reqdata = StreamData.getReqData(request);
		Gson gson = new Gson();
		ScoreVO svo = gson.fromJson(reqdata, ScoreVO.class);
		
		IScoreService service = ScoreServiceImpl.getInstance();
		int cnt = service.scoreListChk(svo);
		
		String json = gson.toJson(cnt);
		out.println(json); 
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

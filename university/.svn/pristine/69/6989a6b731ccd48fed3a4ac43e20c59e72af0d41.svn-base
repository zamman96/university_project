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
import com.google.gson.reflect.TypeToken;

import course.service.IScoreService;
import course.service.ScoreServiceImpl;
import course.vo.ScoreVO;
import util.StreamData;

@WebServlet("/rankScore.do")
public class RankScore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String reqdata = StreamData.getReqData(request);
		Gson gson = new Gson();
		
		// JSON 데이터를 List<ScoreVO>로 변환
        List<ScoreVO> svoList = gson.fromJson(reqdata, new TypeToken<List<ScoreVO>>(){}.getType());
		
		IScoreService service = ScoreServiceImpl.getInstance();
		List<ScoreVO> list = service.rankScore(svoList);
		
		String json = gson.toJson(list);
		out.println(json); 
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

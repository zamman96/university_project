package lecture.controller.timetable;

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
import lecture.vo.SubjectVO;
import lecture.vo.TimeVO;
import util.StreamData;

@WebServlet("/lecture/timeList.do")
public class TimeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reqdata = StreamData.getReqData(request);
		
		Gson gson = new Gson();
		LectureVO vo = gson.fromJson(reqdata, LectureVO.class);
		
		ILectureService service = LectureServiceImpl.getInstance();
		List<TimeVO> list = service.timeList(vo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		gson = new Gson();
		String json = gson.toJson(list);
		out.println(json);
		System.out.println(json);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

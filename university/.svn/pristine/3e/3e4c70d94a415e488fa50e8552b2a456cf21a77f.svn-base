package lecture.controller.lectureAdd;

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
import util.StreamData;

@WebServlet("/lecture/insertLecture.do")
public class InsertLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reqdata = StreamData.getReqData(request);
		
		Gson gson = new Gson();
		LectureVO lecVo = gson.fromJson(reqdata, LectureVO.class);
		
		ILectureService service = LectureServiceImpl.getInstance();
		int cnt = service.insertLecture(lecVo);
		
		if(cnt>0) {
			cnt = service.insertLectureTime(lecVo);
		}
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

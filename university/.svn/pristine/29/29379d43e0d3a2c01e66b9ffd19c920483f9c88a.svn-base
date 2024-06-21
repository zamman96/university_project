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
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import board.vo.PageVO;
import lecture.service.ILectureService;
import lecture.service.LectureServiceImpl;
import lecture.vo.LectureVO;
import lecture.vo.SubjectVO;
import util.StreamData;

@WebServlet("/lecture/subjectList.do")
public class SubjectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reqdata = StreamData.getReqData(request);
		
		Gson gson = new Gson();
		LectureVO vo = gson.fromJson(reqdata, LectureVO.class);
		
		ILectureService service = LectureServiceImpl.getInstance();
		
		PageVO pvo = service.subjectPage(vo);
		
		vo.setStart(pvo.getStart());
		vo.setEnd(pvo.getEnd());
		
		List<SubjectVO> list = service.subjectList(vo);
		
		JsonObject obj = new JsonObject();
		obj.addProperty("sp", pvo.getStartPage());
		obj.addProperty("ep", pvo.getEndPage());
		obj.addProperty("tp", pvo.getTotalPage());
		JsonElement result = gson.toJsonTree(list);
		obj.add("datas", result);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(obj);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

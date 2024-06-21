package member.controller.list;

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
import member.service.IMajorService;
import member.service.MajorServiceImpl;
import member.vo.StudentVO;
import util.StreamData;

@WebServlet("/majorStudentList.do")
public class MajorStudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String reqdata = StreamData.getReqData(request);
		Gson gson = new Gson();
		StudentVO svo = gson.fromJson(reqdata, StudentVO.class);
		
		IMajorService service = MajorServiceImpl.getInstance();
		PageVO pvo = service.pageMajorStuList(svo);
		
		svo.setStart(pvo.getStart());
		svo.setEnd(pvo.getEnd());
		
		List<StudentVO> list = service.majorStudentList(svo);
		
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

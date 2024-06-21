package course.controller.attend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import course.service.AttendServiceImpl;
import course.service.IAttendService;
import course.vo.AttendVO;
import util.StreamData;

@WebServlet("/deleteAttend.do")
public class DeleteAttend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String reqdata = StreamData.getReqData(request);
		
		Gson gson = new Gson();
		
		AttendVO avo = gson.fromJson(reqdata, AttendVO.class);
		
		IAttendService service = AttendServiceImpl.getInstance();
		int cnt = service.attendDelete(avo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(cnt);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

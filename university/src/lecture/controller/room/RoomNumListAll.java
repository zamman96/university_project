package lecture.controller.room;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import lecture.service.IRoomService;
import lecture.service.RoomServiceImpl;
import lecture.vo.RoomVO;

@WebServlet("/roomNumListAll.do")
public class RoomNumListAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		IRoomService service = RoomServiceImpl.getInstance();
		
		String room_id = request.getParameter("room_id");
		Gson gson = new Gson();
		
		List<RoomVO> list = service.roomNumList(room_id);
		
		String json = gson.toJson(list);
		
		out.println(json);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package lecture.controller.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.service.IRoomService;
import lecture.service.RoomServiceImpl;
import lecture.vo.RoomVO;

@WebServlet("/updateRoom.do")
public class UpdateRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		IRoomService service = RoomServiceImpl.getInstance();
		
		String room_id = request.getParameter("room_id");
		String room_num = request.getParameter("room_num");
		int room_available = Integer.parseInt(request.getParameter("room_available"));
		String room_remark = request.getParameter("room_remark");
		
		RoomVO rvo = new RoomVO(room_id, room_num, room_available, room_remark);
		
		int cnt = service.updateRoom(rvo);
		
		out.println(cnt);
		response.flushBuffer();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

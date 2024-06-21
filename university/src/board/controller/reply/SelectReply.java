package board.controller.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.ReplyVO;

@WebServlet("/selectReply.do")
public class SelectReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String board_type = request.getParameter("board_type");
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		ReplyVO rvo = new ReplyVO();
		rvo.setBoard_id(board_id);
		rvo.setBoard_type(board_type);
		
		IBoardService service = BoardServiceImpl.getService();
		List<ReplyVO> list = service.selectReply(rvo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
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

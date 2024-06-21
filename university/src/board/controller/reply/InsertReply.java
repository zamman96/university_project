package board.controller.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.ReplyVO;

@WebServlet("/insertReply.do")
public class InsertReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String board_type = request.getParameter("board_type");
		String mem_id = request.getParameter("mem_id");
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		String reply_content = request.getParameter("reply_content");
		
		ReplyVO rvo = new ReplyVO();
		rvo.setBoard_id(board_id);
		rvo.setBoard_type(board_type);
		rvo.setMem_id(mem_id);
		rvo.setReply_content(reply_content);
		
		IBoardService service = BoardServiceImpl.getService();
		int cnt = service.insertReply(rvo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
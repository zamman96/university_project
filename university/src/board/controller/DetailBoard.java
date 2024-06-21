package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;


@WebServlet("/DetailBoard.do")
public class DetailBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int bnum = Integer.parseInt(request.getParameter("board_id"));
		String type = request.getParameter("board_type");
		
		BoardVO bvo = new BoardVO();
		bvo.setBoard_id(bnum);
		bvo.setBoard_type(type);
		
		IBoardService service =BoardServiceImpl.getService();
		
		BoardVO vo = service.detailBoard(bvo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		String json = gson.toJson(vo);
		
		out.println(json);
		response.flushBuffer();
		
		
	}

}

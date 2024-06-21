package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;

@WebServlet("/mainNotiBoard.do")
public class MainNotiBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		IBoardService service = BoardServiceImpl.getService();
		
		List<BoardVO> list = service.selectNotiBoard(); 
	
		request.setAttribute("list", list);
		request.getRequestDispatcher("/main/mainview/mainlist.jsp").forward(request, response);
	}

}

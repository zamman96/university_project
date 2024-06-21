package board.controller;

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

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;
import board.vo.PageVO;
import util.StreamData;


@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 
		String reqdata=StreamData.getReqData(request);
			//자바 객체로 역질렬화
		Gson gson =new Gson();
		 
		BoardVO bvo = gson.fromJson(reqdata, BoardVO.class);
		
		IBoardService service =BoardServiceImpl.getService();
		
		PageVO pvo =service.pageInfo(bvo);
		
		bvo.setStart(pvo.getStart());
		bvo.setEnd(pvo.getEnd());
		
		List<BoardVO> list=service.selectByPage(bvo);
		
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
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

}

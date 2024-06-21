package member.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.service.IStudentService;
import member.service.StudentServiceImpl;
import member.vo.StuChangeVO;
import util.StreamData;

@WebServlet("/updateStuChange.do")
public class UpdateStuChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IStudentService service = StudentServiceImpl.getInstance();
		String reqdata = StreamData.getReqData(request);
		Gson gson = new Gson();
		StuChangeVO changeVo = gson.fromJson(reqdata, StuChangeVO.class);
		
		int result = (Integer)service.updateStuChange();
		
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("/student/jsp/result.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

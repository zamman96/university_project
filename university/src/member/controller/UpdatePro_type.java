package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.service.IProfessorService;
import member.service.ProfessorServiceImpl;
import member.vo.MemberVO;
import member.vo.ProfessorVO;
import util.StreamData;

@WebServlet("/updatePro_type.do")
public class UpdatePro_type extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		IProfessorService service = ProfessorServiceImpl.getInstance();
		
		String reqdata = StreamData.getReqData(request);
		System.out.println("reqdata ====>>>> "+reqdata);
		
		Gson gson = new Gson();
		
		ProfessorVO proVo = gson.fromJson(reqdata, ProfessorVO.class);
		int num = proVo.getPro_type();
		proVo.setPro_id(proVo.getPro_id());
		proVo.setPro_type(num);
		
		
		int result = service.updatePro_type(proVo);
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("/admin/professor/updatePro_type.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package lecture.controller.subject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import board.vo.PageVO;
import lecture.service.ISubjectService;
import lecture.service.SubjectServiceImpl;
import lecture.vo.SubjectVO;
import util.StreamData;

@WebServlet("/subjectListPage.do")
public class SubjectListPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ISubjectService service = SubjectServiceImpl.getInstance();
		String reqdata = StreamData.getReqData(request);
		Gson gson = new Gson();
		
		SubjectVO subvo = gson.fromJson(reqdata, SubjectVO.class);
		
		int page = subvo.getPage();
		Map<String, Object> map = new HashedMap<String, Object>();
		String subject_type = subvo.getSubject_type();
		String subject_name = subvo.getSubject_name();
		String subject_term = subvo.getSubject_term();
		int major_id = subvo.getMajor_id();
		int col_id = subvo.getCol_id();
		int subject_grade = subvo.getSubject_grade();
		int subject_credit = subvo.getSubject_credit();
		map.put("major_id", major_id);
		map.put("subject_name", subject_name);
		map.put("subject_type", subject_type);
		map.put("subject_grade", subject_grade);
		map.put("subject_credit", subject_credit);
		map.put("subject_term", subject_term);
		map.put("col_id", col_id);
		
		PageVO pvo = service.pageInfo(page, map);
		
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		
		List<SubjectVO> list = service.subjectList(map);
		
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

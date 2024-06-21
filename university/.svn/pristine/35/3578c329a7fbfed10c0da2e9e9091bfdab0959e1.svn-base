package file.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import file.service.FileServiceImpl;
import file.service.IFileService;
import file.vo.FileVO;
import member.vo.MemberVO;
import util.MySvnUtil;
import util.StreamData;

@WebServlet("/file/filedelete.do")
public class Filedelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		MySvnUtil.setUpdate();
		String path = "C:/project_2_university/file/photo";
		
		File file = new File(path);
		
		String reqdata = StreamData.getReqData(request);
		
		Gson gson = new Gson();
		MemberVO vo = gson.fromJson(reqdata, MemberVO.class);
		String mem_id = vo.getMem_id();
		
		IFileService service = FileServiceImpl.getInstance();
		
		List<FileVO> list = service.getUserImg(mem_id);
		
		String file_save_name = "";
		
		for(FileVO fvo : list) {
			file_save_name = fvo.getFile_save_name();
		}
		
		File downFile = new File(file, file_save_name);
		
		downFile.delete();
		
		
		int result = service.deleteFile(mem_id);
		if(file_save_name!=null || !file_save_name.isEmpty()) {
			MySvnUtil.commitChanges(downFile);
		}
		
		if(result!=0) {
			response.sendRedirect(request.getContextPath()+"/mypage/mypage.jsp");
		} else {
			System.out.println("파일 삭제 실패!");
		}
	
	}

}

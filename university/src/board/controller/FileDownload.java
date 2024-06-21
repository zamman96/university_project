package board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;
import util.MySvnUtil;


@WebServlet("/FileDownload.do")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MySvnUtil.setUpdate();
		
		String uploadPath="C:/project_2_university/file/attach_file";
						
		//저장될 폴더가 없으면 새로 생성한다
		File file =new File(uploadPath);
		if(!file.exists()) {
			file.mkdir();
		}
		
		request.setCharacterEncoding("utf-8");
		String save_file = request.getParameter("save_file");
		String origin_file = request.getParameter("origin_file");

		response.setCharacterEncoding("utf-8");
		
		File downFile=new File(file,save_file);
		
		if(downFile.exists()) {
			response.setContentType("application/octet-stream; charset=utf-8");
			
			String headerKey = "content-disposition";
			
			String headerValue="attachment; filename*=UTF-8''"+
					URLEncoder.encode(origin_file, "utf-8").replace("\\+", "%20");
			
			response.setHeader(headerKey, headerValue);
			
			BufferedOutputStream bout = null;
	        BufferedInputStream bin = null;
			
			try {
				bout = new BufferedOutputStream(response.getOutputStream());
				
				bin = new BufferedInputStream(new FileInputStream(downFile));
				
				byte[] temp = new byte[1024];
				
				int len = 0;
	            while((len = bin.read(temp)) > 0) {
	               bout.write(temp, 0, len);
	            }
	            
	            bout.flush();
				
			} catch (Exception e) {
	            System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
	            if(bout!=null) try {bout.close();} catch(IOException e) {}
	            if(bin!=null) try {bin.close();} catch(IOException e) {}
	         }
			
		}else {
			
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println("<h3>"+origin_file
													+"파일이 존재하지않습니다.</h3>");
		}
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

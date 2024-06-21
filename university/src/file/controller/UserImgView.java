package file.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
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

@WebServlet("/userImgView.do")
public class UserImgView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		// 저장 될 장소 (mac은 Users가 d:와 같음, 윈도우에서 사용 시 변경해야 함)
		MySvnUtil.setUpdate();
		
		String path = "C:/project_2_university/file/photo";

		File file = new File(path);
			
		String mem_id = request.getParameter("mem_id");
		
		
		IFileService service = FileServiceImpl.getInstance();
		List<FileVO> list = service.getUserImg(mem_id);
		
		String file_save_name = "";
		
		for(FileVO fvo : list) {
			file_save_name = fvo.getFile_save_name();
		}
		
		response.setCharacterEncoding("utf-8");
		
		File downFile = new File(file, file_save_name);
		
		if(downFile.exists()) {// 다운 받을 파일이 있을 때
			// 이 이후에 작업은 서버에 저장된 파일을 읽어서 클라이언트에게 보내준다 (일종의 입출력작업)
			BufferedOutputStream bout = null;
			BufferedInputStream bin = null;
			
			try {
				// 출력용 스트림 객체 생성
				bout = new BufferedOutputStream(response.getOutputStream());
				
				// 파일 입력용 스트림 객체 생성
				bin = new BufferedInputStream(new FileInputStream(downFile));
				
				byte[] temp = new byte[1024];
				
				int len = 0;
				while((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
				
			}catch (Exception e) {
				System.out.println("입출력 오류 : "+e.getMessage());
			} finally {
				if(bout!=null) try {bout.close();}catch(IOException e) {}
				if(bin!=null) try {bin.close();}catch(IOException e) {}
			}
			
		} else {
			System.out.println(file_save_name);
		}
	}

}

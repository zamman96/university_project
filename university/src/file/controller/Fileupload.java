package file.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import file.service.FileServiceImpl;
import file.service.IFileService;
import file.vo.FileVO;
import util.MySvnUtil;

@MultipartConfig(
		fileSizeThreshold =  1024 * 1024 * 10,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 200
	)
@WebServlet("/file/fileupload.do")
public class Fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 이미지 중복 확인-----------------------------------------------------
		
		String mem_id = request.getParameter("mem_id");
		
		IFileService service = FileServiceImpl.getInstance();
		List<FileVO> list = service.getUserImg(mem_id);
		
		if(list.size() > 0) {
			response.sendError(HttpServletResponse.SC_CONFLICT, "회원 이미지 중복");
			return;
		}
		
		// 이미지 등록 시작-----------------------------------------------------
		MySvnUtil.setUpdate();
		
		
		// 저장 될 장소 (mac은 Users가 d:와 같음, 윈도우에서 사용 시 변경해야 함)
		String path = "C:/project_2_university/file/photo";

		

		Path directoryPath = Paths.get(path);
		
		// 디렉토리가 존재하지 않으면 생성
       if (!Files.exists(directoryPath)) {
            try {
                Files.createDirectories(directoryPath);
                System.out.println("디렉토리 생성: " + directoryPath);
            } catch (IOException e) {
                System.err.println("디렉토리 생성 실패: " + e.getMessage());
            }
        }
		
		List<FileVO> fileList = new ArrayList<FileVO>();
		
		
		// 파일 가져오기
				Part filePart = request.getPart("file");

			String fileName = mem_id+extractFileExtestion(filePart);
				FileVO fvo = new FileVO();
				fvo.setFile_origin_name(fileName);

				String saveFileName = UUID.randomUUID().toString() + "_" + fileName;
				fvo.setFile_save_name(saveFileName);

				fvo.setFile_path(path);
				fvo.setFile_size((long) (Math.ceil(filePart.getSize() / 1024.0)));

				try {
					// Part객체.write()메서드 ==> upload된 파일을 저장하는 메서드
					// 형식 Part객체.write("저장할 경로"+File.separator+"저장할 파일명");
					// File.separator 구분자
					filePart.write(path + File.separator + saveFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			service.insertFile(fvo);

		
		
		
		
		
		
//		for(Part part : request.getParts()) {
//			String fileName = mem_id+extractFileExtestion(part);
//			
//			if(!fileName.equals("")) {
//				
//				FileVO fvo = new FileVO();
//				fvo.setFile_origin_name(fileName);
//				
//				String saveFileName = UUID.randomUUID().toString()+"_"+fileName;
//				fvo.setFile_save_name(saveFileName);
//				
//				fvo.setFile_path(path);
//				fvo.setFile_size( (long)(Math.ceil(part.getSize()/1024.0)) );
//				
//				try {
//					// Part객체.write()메서드 ==> upload된 파일을 저장하는 메서드
//					// 형식 Part객체.write("저장할 경로"+File.separator+"저장할 파일명");
//					// File.separator 구분자
//					part.write(path+File.separator+saveFileName);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				fileList.add(fvo);	// List에 1개의 파일정보를 추가한다.
//			}
//			
//		}
//		
//		for(FileVO fvo : fileList) {
//			service.insertFile(fvo);
//		}
		
		MySvnUtil.setCommit();
		
		response.sendRedirect(request.getContextPath()+"/mypage/mypage.jsp");
		
	}

	private String extractFileExtestion(Part part) {
		String fileExtestion = ""; // 반환값이 저장될 변수
		
		String dispositionValue = part.getHeader("content-disposition");
		String[] items = dispositionValue.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) { // 파일 정보가 있는지 검사
				String fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
				fileExtestion = fileName.substring(fileName.lastIndexOf("."));
			}
		}
		return fileExtestion;
	}

	

}















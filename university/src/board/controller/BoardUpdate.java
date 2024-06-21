package board.controller;

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

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;
import file.service.FileServiceImpl;
import file.service.IFileService;
import file.vo.FileVO;
import util.MySvnUtil;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 mb
maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 200)
@WebServlet("/BoardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String board_type = request.getParameter("board_type");
		int board_id=Integer.parseInt(request.getParameter("board_id"));
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String fileChk = request.getParameter("fileChk");
		String fileUpload = request.getParameter("fileUpload");
		BoardVO vo=new BoardVO();
		
		vo.setBoard_id(board_id);
		vo.setBoard_type(board_type);
		vo.setBoard_title(board_title);
		vo.setBoard_content(board_content);
		
		IBoardService service =BoardServiceImpl.getService();
		
		int result =service.updateBoard(vo);
		
		//파일 변경될 때
		// 서버 업데이트
		MySvnUtil.setUpdate();
		
		String path = "C:/project_2_university/file/attach_file";
		Path directoryPath = Paths.get(path);
		
		if (fileChk.equals("true")) { // 기존 파일 삭제
			BoardVO bvo = new BoardVO();
			bvo.setBoard_id(board_id);
			bvo.setBoard_type(board_type);
			String file_old = request.getParameter("file_old");
			bvo.setFile_save_name(file_old);

			int cnt = service.deleteBoardFile(bvo);
			// 기존 파일 삭제
			File oldFile = new File(path, file_old);
			if(file_old!=null || !file_old.isEmpty()) {
				MySvnUtil.commitChanges(oldFile);
			}
			oldFile.delete();
			MySvnUtil.commitChanges(oldFile);
		}
		
		IFileService fservice = FileServiceImpl.getInstance();
		
		System.out.println("fileUpload ==> "+fileUpload);
		if(fileUpload.equals("false")) {
			System.out.println("파일이 없대!!");
			return;
		}
		
		String file_name = request.getParameter("file_name");
		
		
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
		Part filePart = request.getPart("board_file");

		FileVO fvo = new FileVO();
		fvo.setFile_origin_name(file_name);

		String saveFileName = UUID.randomUUID().toString() + "_" + file_name;
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
		fileList.add(fvo); // List에 1개의 파일정보를 추가한다.

		
		// 서버 커밋
		MySvnUtil.setCommit();
		
		vo.setFile_save_name(saveFileName);
		fservice.insertFile(fvo);
		// board_file테이블 insert추가
		int bfresult=service.insertBoardFile(vo);
				
		
		
		
	}

}

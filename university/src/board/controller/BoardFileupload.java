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
@WebServlet("/BoardFileupload.do")
public class BoardFileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String board_type = request.getParameter("board_type");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String mem_id = request.getParameter("mem_id");
		String filename = request.getParameter("file_name").trim();
		int board_file=0;
		
		if (filename.isEmpty()) {
			board_file=0;
		}else {
			board_file=1;
		}

		BoardVO vo = new BoardVO();
		vo.setBoard_type(board_type);
		vo.setBoard_title(board_title);
		vo.setBoard_content(board_content);
		vo.setMem_id(mem_id);
		vo.setBoard_file(board_file);

		IBoardService bservice = BoardServiceImpl.getService();

		int result = bservice.insertBoard(vo);

		

		// ---------------------------------------------------------

		if (board_file == 0) { // 파일이 없을 때
			
			return;
		}

		IFileService fservice = FileServiceImpl.getInstance();
		
		
		// 서버 업데이트
		MySvnUtil.setUpdate();
		// 이미지 등록 시작-----------------------------------------------------
		String path = "C:/project_2_university/file/attach_file";
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
		Part filePart = request.getPart("board_file");

		FileVO fvo = new FileVO();
		fvo.setFile_origin_name(filename);

		String saveFileName = UUID.randomUUID().toString() + "_" + filename;
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

		fservice.insertFile(fvo);
		
		vo.setFile_save_name(saveFileName);
		// board_file테이블 insert추가
		int bfresult = bservice.insertBoardFile(vo);
		
		// 서버 커밋
		MySvnUtil.setCommit();

	}

}

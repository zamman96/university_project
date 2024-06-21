package file.service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

import file.dao.FileDaoImpl;
import file.dao.IFileDao;
import file.vo.FileVO;



public class FileServiceImpl implements IFileService {

	private static FileServiceImpl service;
	private IFileDao dao;
	
	private FileServiceImpl() {
		dao = FileDaoImpl.getInstance();
	}
	
	public static FileServiceImpl getInstance() {
		if(service==null) service = new FileServiceImpl();
		return service;
	}

	/**
	 * �뙆�씪 �벑濡� 硫붿꽌�뱶
	 */
	@Override
	public int insertFile(FileVO vo) {
		return dao.insertFile(vo);
	}

	/**
	 * �뙆�씪 �궘�젣 硫붿꽌�뱶
	 */
	@Override
	public int deleteFile(String mem_id) {
		return dao.deleteFile(mem_id);
	}

	/**
	 * 	�쉶�썝 �씠誘몄�瑜� 媛��졇�삤�뒗 硫붿꽌�뱶
	 */
	@Override
	public List<FileVO> getUserImg(String mem_id) {
		return dao.getUserImg(mem_id);
	}
	
	/**
	 * notice file 연결
	 */

	@Override
	public FileVO getFile(FileVO fileVO) {
		
		return dao.getFile(fileVO);
	}

	private static final String UPLOAD_DIR = "upload_files";

	@Override
	public FileVO insertFile(Collection<Part> parts) {
	String uploadPath = "D:\\A_TeachingMaterial\\03_HighJava\\workspace\\university\\WebContent\\" + UPLOAD_DIR;
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		FileVO fileVO = null;
		
		boolean isFirstFile = true; // 첫번째 업로드 파일 여부
		
		for(Part part : parts) {
			String fileName = part.getSubmittedFileName();
			
			if(fileName != null && !fileName.contentEquals("")) {
				if(isFirstFile) {
					// 첫번째 파일인 경우
					isFirstFile = false;
					
					// �파일 기본 경로 저장
					fileVO = new FileVO();
					dao.insertFile(fileVO);
				}
				String file_origin_name = fileName; // 원본파일명
				long file_size = part.getSize(); //  파일크기
				String file_save_name = ""; // 저장파일명
				String file_path = ""; // 저장파일경로
				int file_image = 0; // 이미지 확인필요
				
				file_save_name = UUID.randomUUID().toString()
							.replace("-", "");
				
				file_path = uploadPath + "/" + file_save_name;
				
				try {
					part.write(file_path); // 업로드처리
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				// 확장명 추출
				String fileExtension = file_origin_name.lastIndexOf(".") < 0 ?
									"" : file_origin_name.substring(file_origin_name.lastIndexOf(".") + 1);
				
//				FileVO fileVO = new FileVO();
				//확인필요
				fileVO.setFile_id(fileVO.getFile_id());
				
				fileVO.setFile_origin_name(file_origin_name);
				fileVO.setFile_save_name(file_save_name);
				fileVO.setFile_path(file_path);
				fileVO.setFile_size(file_size);
				fileVO.setFile_image(file_image);
				
				dao.insertFile(fileVO);
				
				try {
					part.delete(); // 임시 업로드 파일 삭제
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		return fileVO;
	}
}

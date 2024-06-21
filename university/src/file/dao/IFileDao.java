package file.dao;

import java.util.List;

import file.vo.FileVO;

public interface IFileDao {
	
	//	�뙆�씪 �벑濡� 硫붿꽌�뱶
	public int insertFile(FileVO vo);

	// �뙆�씪 �궘�젣 硫붿꽌�뱶
	public int deleteFile(String mem_id);
	
	// �쉶�썝 �씠誘몄�瑜� 媛��졇�삤�뒗 硫붿꽌�뱶
	public List<FileVO> getUserImg(String mem_id);

	public FileVO getFile(FileVO fileVO);
}

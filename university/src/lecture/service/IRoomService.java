package lecture.service;

import java.util.List;

import board.vo.PageVO;
import lecture.vo.RoomVO;

public interface IRoomService {
	/**
	 * 조회
	 * @param rvo
	 * @return
	 */
	public List<RoomVO> roomList(RoomVO rvo);
	
	public PageVO roomListPage(RoomVO rvo);
	
	public int roomListCount(RoomVO rvo);
	
	/**
	 * 추가
	 * @param rvo
	 * @return
	 */
	public int insertRoom(RoomVO rvo);
	
	/**
	 * 수정
	 * @param rvo
	 * @return
	 */
	public int updateRoom(RoomVO rvo);
	
	/**
	 * 삭제
	 * @param rvo
	 * @return
	 */
	public int deleteRoom(RoomVO rvo);
	
	/**
	 * 전체 건물 리스트
	 * @return
	 */
	public List<RoomVO> buildingList();
	
	/**
	 * 해당하는 건물의 호수 리스트
	 * @return
	 */
	public List<RoomVO> roomNumList(String room_id);
	
	/**
	 * 지울수있는지 확인 여부
	 * @param rvo
	 * @return
	 */
	public int deleteChk(RoomVO rvo);
	
}

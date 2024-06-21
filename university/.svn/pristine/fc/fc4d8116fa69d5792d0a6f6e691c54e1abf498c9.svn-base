package lecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lecture.vo.RoomVO;
import util.MyBatisUtil;

public class RoomDaoImpl implements IRoomDao {
	private static RoomDaoImpl dao;
	
	private RoomDaoImpl() {
		
	}
	
	public static RoomDaoImpl getInstance() {
		if(dao==null) dao = new RoomDaoImpl();
		return dao;
	}

	@Override
	public List<RoomVO> roomList(RoomVO rvo) {
		SqlSession session = null;
		List<RoomVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("room.roomList", rvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int insertRoom(RoomVO rvo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("room.insertRoom", rvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateRoom(RoomVO rvo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("room.updateRoom", rvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteRoom(RoomVO rvo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.delete("room.deleteRoom", rvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<RoomVO> buildingList() {
		SqlSession session = null;
		List<RoomVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("room.buildingList");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int roomListCount(RoomVO rvo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("room.roomListCount", rvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteChk(RoomVO rvo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("room.deleteChk", rvo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<RoomVO> roomNumList(String room_id) {
		SqlSession session = null;
		List<RoomVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("room.roomNumList", room_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

}

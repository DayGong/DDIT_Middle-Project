package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.BoardVO;

public class BoardDaoImpl implements IBoardDao {

	private static IBoardDao boardDao;
	
	public BoardDaoImpl() {};
	
	public static IBoardDao getInstance() {
		if(boardDao==null) {
			boardDao = new BoardDaoImpl();
		}
		return boardDao;
	}

	@Override
	public List<BoardVO> getAllBoard() {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			boardList = session.selectList("board.getAllBoard"); 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return boardList;
	}
	
	@Override
	public BoardVO getBoard(int no) {
		BoardVO boardVO = new BoardVO();
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			boardVO = session.selectOne("board.getBoard",no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return boardVO;
	}

	@Override
	public int deleteBoard(int no) {
		int cnt = 0;
		
		SqlSession session = MybatisUtil.getSqlSession();
		
		try {
			cnt = session.delete("board.deleteBoard", no);
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateHits(int no) {
		int cnt = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			cnt = session.update("notice.updateHits", no);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		int cnt = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			cnt = session.update("notice.updateNotice", boardVO);
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		int cnt = 0;
		
		SqlSession session = MybatisUtil.getSqlSession();
		
		try {
			cnt = session.insert("board.insertBoard", boardVO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

//	@Override
//	public int getTotalCount(Map<String, Object> map) {
//		SqlSession session = MybatisUtil.getSqlSession();
//		
//		int res = 0;
//		
//		try {
//			res = session.selectOne("notice.getTotalCount", map);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			session.close();
//		}
//		return res;
//	}
	
	
}	//BoardDaoImpl 끝

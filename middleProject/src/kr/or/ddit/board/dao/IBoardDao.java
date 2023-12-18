package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

public interface IBoardDao {

	public List<BoardVO> getAllBoard();
	public BoardVO getBoard(int no);
	public int deleteBoard(int no);
	public int updateHits(int no);
	public int updateBoard(BoardVO boardVO);
	public int insertBoard(BoardVO boardVO);
//	public int getTotalCount(Map<String, Object> map);
	
	
}	
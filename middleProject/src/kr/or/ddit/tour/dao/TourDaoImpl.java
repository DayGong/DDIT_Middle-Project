package kr.or.ddit.tour.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.TourVO;

public class TourDaoImpl implements ITourDao { //싱글톤 시작
	private static ITourDao dao;
	private TourDaoImpl() {}
	public static ITourDao getInstance() {
		if(dao==null) dao= new TourDaoImpl();
		return dao;
	} //싱글톤 끝

	// tour의 리스트를 뽑는 메서드
	@Override
	public List<TourVO> selectTour() {
		List<TourVO> list= null;
		SqlSession session=MybatisUtil.getSqlSession();
		try {
			list= session.selectList("tour.selectTour");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}		
		return list;
	} //selectTour 끝

	// tour의 상세 정보를 출력하는 메서드
	@Override
	public TourVO selectOneTour(int num) {
		TourVO vo= null;
		SqlSession session=MybatisUtil.getSqlSession();
		try {
			vo= session.selectOne("tour.selectOneTour",num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}		
		return vo;
	}// selectOneTour 끝

	// tour에 정보를 저장하는 메서드
	@Override
	public int insertTour(TourVO vo) {
		int cnt= 0;
		SqlSession session=MybatisUtil.getSqlSession();
		try {
			cnt= session.insert("tour.insertTour",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}		
		return cnt;
	} //insertTour 끝

	//투어 db의 자료를 삭제하는 메서드
	@Override
	public int deleteTour(int num) {
		int cnt= 0;
		SqlSession session=MybatisUtil.getSqlSession();
		try {
			cnt= session.delete("tour.deleteTour",num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}		
		return cnt;
	} //deleteTour 끝

	//db의 값을 수정하는 메서드
	@Override
	public int updateTour(TourVO vo) {
		int cnt= 0;
		SqlSession session=MybatisUtil.getSqlSession();
		try {
			cnt= session.update("tour.updateTour",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}		
		return cnt;
	} //updateTour 끝
	
	//동 주소를 검색하는 메서드
	@Override
	public List<TourVO> selectDongTour(String dong) {	
		List<TourVO> list= null;
		SqlSession session=MybatisUtil.getSqlSession();
		try {
			list= session.selectList("tour.selectDongTour",dong);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}		
		return list;
	} //selectDongTour 끝

	//이름을 받아서 주소 검색 메서드
	@Override
	public List<TourVO> selectNameTour(String dong) {
		List<TourVO> list= null;
		SqlSession session=MybatisUtil.getSqlSession();
		try {
			list= session.selectList("tour.selectNameTour",dong);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}		
		return list;
	} //selectNameTour 끝

}

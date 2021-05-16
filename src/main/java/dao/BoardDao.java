package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.UserMapper;
import logic.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Map<String,Object> param = new HashMap<>();
	
	public Board selectOne(Integer num) {
		param.clear();
		param.put("num", num);
		return sqlSession.getMapper(BoardMapper.class).select(param);
	}

	public void readcntadd(Integer num) {
		param.clear();
		param.put("num", num);
		sqlSession.getMapper(BoardMapper.class).readcntadd(param);
	}

	public List<Board> list(Integer board_no,Integer pageNum, int limit, String type, String content ) {
		 param.clear(); 
		 param.put("board_no", board_no);
		 param.put("content", "%"+content+"%");
		 param.put("startrow", (pageNum - 1) * limit);
		 param.put("limit", limit);
		 
		 return sqlSession.getMapper(BoardMapper.class).list(param);
	}

	public void update(Board board) {
		sqlSession.getMapper(BoardMapper.class).update(board);
	}

	public void delete(Board board) {
		sqlSession.getMapper(BoardMapper.class).delete(board);
	}

	public int maxnum() {
		return sqlSession.getMapper(BoardMapper.class).maxnum();
	}

	public void insert(Board board) {
		sqlSession.getMapper(BoardMapper.class).insert(board);
	}

	public int count(String col, String content, Integer board_no) {
		param.clear();
		param.put("content", "%"+content+"%");
		param.put("board_no", board_no);
		return sqlSession.getMapper(BoardMapper.class).count(param);
	}
}

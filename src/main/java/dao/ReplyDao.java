package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.ReplyMapper;
import logic.Reply;

@Repository
public class ReplyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private Map<String,Object> param = new HashMap<>();
	
	public void insert(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).insert(reply);
	}

	public int maxnum() {
		return sqlSession.getMapper(ReplyMapper.class).maxnum();
	}

	public List<Reply> rlist(Integer num,Integer board_no) {
		param.clear();
		param.put("num", num);
		param.put("board_no", board_no);
		return sqlSession.getMapper(ReplyMapper.class).rlist(param);
	}

	public int replycount(Integer num) {
		param.clear();
		param.put("num", num);
		return sqlSession.getMapper(ReplyMapper.class).replycount(param);
	
	}

	public Reply selectOne(Integer rnum) {
		param.clear();
		param.put("rnum",rnum);
		return sqlSession.getMapper(ReplyMapper.class).select(param);
	}

	public void delete(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).delete(reply);
	}

}

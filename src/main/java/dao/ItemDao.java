package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Item;

@Repository
public class ItemDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Map<String, Object> param = new HashMap<>();
	
	public List<Item> list
	(Integer pageNum, int limit,String col,String content) {
		param.clear();
		param.put("col", col);
		param.put("content", "%"+content+"%");
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit",  limit);	
		return sqlSession.getMapper(ItemMapper.class).select(param);
	}

	public void insert(Item item) {
		param.clear();
		int id = sqlSession.getMapper(ItemMapper.class).maxid();
		item.setId(++id+"");
		sqlSession.getMapper(ItemMapper.class).insert(item);
	}

	public Item selectOne(String id) {
		param.clear();
		param.put("id", id);
		return sqlSession.getMapper(ItemMapper.class).
				select(param).get(0);
	}

	public int count(String col,String content) {
		param.clear();
		param.put("col", col);
		param.put("content", "%"+content+"%"); //  %1%
		return sqlSession.getMapper(ItemMapper.class).count(param);
	}

	public List<Item> list2() {
		return sqlSession.getMapper(ItemMapper.class).select2(null);
	}
}

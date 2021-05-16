package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleItemMapper;
import logic.SaleItem;

@Repository
public class SaleItemDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Map<String ,Object> param = new HashMap<>();	
	
	
	public void insert(SaleItem si) {
		sqlSession.getMapper(SaleItemMapper.class).insert(si);
	}


	public List<SaleItem> list(int saleid) {
		param.clear();
		param.put("saleid", saleid);
		return sqlSession.getMapper(SaleItemMapper.class).select(param);
	}

}

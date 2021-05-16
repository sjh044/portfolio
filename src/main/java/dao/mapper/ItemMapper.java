package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {
	String itemcolumn = "select id, name, subject," 
            		   +"price, pictureUrl, description, regdate, bannerUrl, shipping from item";
	
	
	
	@Select({"<script>", itemcolumn
				 + " <if test='col != null'> where ${col} like #{content} </if>"
				 + " <if test='id != null'> where id = #{id} </if>"
				 + " <if test='id == null'> order by id desc, "
				 + " regdate limit #{startrow}, #{limit} </if> </script>" })
	List<Item> select(Map<String,Object> param);
	
	@Select({ "<script>", "select count(*) from item",
		   "<if test='col != null'> where ${col} like #{content}</if>",
		   "</script>" })
	int count(Map<String, Object> param);
	
	

	@Select("select ifnull(max(id),0) from item")
	int maxid();
	
	@Insert("insert into item "
			+ "(id, name, price, subject, description, pictureUrl, bannerUrl, shipping, regdate) "
			+ "values (#{id}, #{name},#{price}, #{subject}, #{description}, "
			+ "#{pictureUrl}, #{bannerUrl}, #{shipping},now())")
			void insert(Item item);
	
	@Update("update item set name=#{name}, "
			+ "price=#{price}, description=#{description}, "
			+ "pictureurl=#{pictureUrl} where id=#{id}")
			void update(Item item);

	@Delete("delete from item where id=#{id}")
		void delete(Map<String, Object> param);

	@Select("SELECT * FROM item ORDER BY id DESC")
	List<Item> select2(Object object);
	

}


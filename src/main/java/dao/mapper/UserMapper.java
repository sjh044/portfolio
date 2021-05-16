package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.User;

public interface UserMapper {

	@Insert("insert into user "
		+ "(userid, password, name, phone1, phone2, phone3, email, regdate,uaddr1,uaddr2,uaddr3 ) "
		+ " values (#{userid}, #{password}, #{name},"
		+ " #{phone1},#{phone2},#{phone3}, #{email}, now(), #{uaddr1},#{uaddr2},#{uaddr3})")
	void insert(User user);
	
	@Select("<script>"
			+"select * from user"
			+"<if test='userid != null'>"
			+"where userid = #{userid}"
			+ "</if>"
			+ "<if test='userids != null'>"
			+ "where userid in "
			+"<foreach collection='userids' item='id' separator=',' open='(' close=')'>"
			+"#{id}"
			+"</foreach>"
			+ "</if>"
			+ "</script>")
	List<User> select(Map<String, Object> param);

	@Update("update user set nic = #{nic}, phoneno = #{phoneno}, "
	+ " email = #{email}, birthday = #{birthday} where userid=#{userid}")
	void update(User user);

	@Delete("delete from user where userid = #{userid}")
	void delete(Map<String, Object> param);

	
	@Select("select num, subject, name, readcnt, board_no, regdate from board where userid = #{userid}")
	List<Board> selectboard(Map<String, Object> param);
	
	@Select("select count(*) from board a join user b on a.userid = b.userid and b.userid=#{userid}")
	int count(Map<String, Object> param);

}

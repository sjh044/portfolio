package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Reply;

public interface ReplyMapper {

		@Insert(" insert into reply(num, rnum, name, comment, regdate, userid, comment_password,board_no)"
				+ " values(#{num}, #{rnum}, #{name}, #{comment}, now(), #{userid}, #{comment_password},#{board_no})")
		void insert(Reply reply);

		@Select("select ifnull(max(rnum),0) from reply ")
		int maxnum();

		@Select("select num, rnum, comment_password, name, comment, regdate from reply where num = #{num}")
		List<Reply> rlist(Map<String, Object> param);

		
		@Select("select count(*) from reply where num = #{num}")
		int replycount(Map<String, Object> param);

		@Select("select * from reply where rnum = #{rnum}")
		Reply select(Map<String, Object> param);

		@Delete("delete from reply where rnum = #{rnum}")
		void delete(Reply reply);
}


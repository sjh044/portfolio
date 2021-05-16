package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {
	String boardcolum = "select num,name,pass,subject,"
				+ "content, file1 fileurl, regdate, readcnt, board_no from board";

	
	@Update("update board set readcnt = readcnt + 1 " 
	           + " where num=#{num}")
	void readcntadd(Map<String, Object> param);
	
	@Select(boardcolum + " where num = #{num}")
	Board select(Map<String, Object> param);
	
	@Update("update board set name=#{name}, subject=#{subject}, content=#{content}, file1=#{fileurl} where num=#{num}")
	void update(Board board);

	@Delete("delete from board where num = #{num}")
	void delete(Board board);

	@Select("select ifnull(max(num),0) from board  ")
	int maxnum();

	@Insert(" insert into board(userid,num,name,pass,subject,content,regdate, file1, readcnt,board_no)"
			+ " values(#{userid},#{num},#{name},#{pass},#{subject},#{content}, now(),#{fileurl},0,#{board_no})")
	void insert(Board board);
	
	
	
	@Select({"<script>"
		 + " select * from board where board_no = #{board_no}"
		 + " <if test='col != null'> where ${col} like #{content} </if>"
		 + " <if test='num != null'> where num = #{num} </if>"	 
		 + " <if test='num == null'> order by num desc, "
		 + "num limit #{startrow}, #{limit} </if> </script>" })
	List<Board> list(Map<String, Object> param);

	
	@Select({"<script>"
			+ "select count(*) from board where board_no = #{board_no}"
			+ "<if test='col != null'> where ${col} like #{content} </if> "
			+ "</script>"})
	int count(Map<String, Object> param);

	@Select("select * from board where userid = #{userid}")
	List<Board> list1(Map<String, Object> param);
	
}

package com.wjl.graduate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.History;


@Component("historyMapper")
public interface HistoryMapper {
   
	public  void add(History history);
	
	public  List<History> findhistory(String sid);
	
	public  List<String> findplaceByyear(@Param("number")String number,@Param("student_id")String student_id);

	public  int countplaceByyear(@Param("number")String number,@Param("student_id")String student_id,@Param("place")String place);

	public  int counttotal(@Param("number")String number,@Param("student_id")String student_id);

	public  List<String> finddirectionByyear(@Param("number")String number,@Param("student_id")String student_id);

	public  List<String> finddirectionBytype(@Param("number")String number,@Param("student_id")String student_id,@Param("type")String type);
	
	
	public  int countdirectionByyear(@Param("number")String number,@Param("student_id")String student_id,@Param("direction")String direction);

	public  int countmajorByyear(@Param("number")String number,@Param("student_id")String student_id,@Param("ismajor")String ismajor);

	public  int	TimeDiff(@Param("student_id")String student_id);
}

package com.board.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.login.UserVo;

@Mapper
public interface UserMapper {
	
	// 사용자 정보 삽입
	public void userInsert(UserVo user);
	
	// 사용자 정보 조회 (로그인)
	public UserVo userLogin(Map<String, Object> user);
	

}

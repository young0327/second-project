package kr.project.mapper;

import java.util.List;

import kr.project.domain.User;

public interface UserMapper {

	public User login(User vo);
	
	public void regist(User vo);
	
	public List<User> idcheckAjax(String id);
}

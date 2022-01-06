package kr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.project.domain.User;
import kr.project.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper mapper;
	
	public User login(User vo) {
		User user = mapper.login(vo);
		return user;
	}
	
	public void regist(User vo) {
		mapper.regist(vo);
	}
	
	public int idcheckAjax(String id) {
		List<User> checklist=mapper.idcheckAjax(id);
		int result =checklist.size();
		 return result;
	}
}

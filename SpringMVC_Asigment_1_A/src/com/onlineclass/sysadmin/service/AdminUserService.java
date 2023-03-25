package com.onlineclass.sysadmin.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineclass.sysadmin.controller.AdminUser;
import com.onlineclass.sysadmin.controller.CommonCode;
import com.onlineclass.sysadmin.repository.AdminUserRepository;
import com.onlineclass.sysadmin.repository.CommonCodeRepository;

@Service
@Transactional
public class AdminUserService {
	@Autowired
	AdminUserRepository repo;
	
	@Autowired
	CommonCodeRepository code_repo;

	public List<AdminUser> listAll() {
		return (List<AdminUser>) repo.findAll();
	}
	
	public List<CommonCode> getCommonCode(){
		return (List<CommonCode>) code_repo.findAll();
	}

	public void save(AdminUser adminuser){
		java.util.Date date= new java.util.Date();
		adminuser.setCreatedAt(new Timestamp(date.getTime()));
		adminuser.setUpdatedAt(new Timestamp(date.getTime()));
		repo.save(adminuser);
	}

	public AdminUser get(Integer ID) {
		Optional<AdminUser> result = repo.findById(ID);
		return result.get();
	}

	public void delete(Integer ID) {
		repo.deleteById(ID);
	}
	
	public void updateUser(AdminUser adminUser) {
	 String updatedAt = (new Timestamp(new java.util.Date().getTime())).toString();
	 repo.updateUserName(adminUser.getID(), adminUser.getName(), 
				adminUser.getPassword(), adminUser.getAgentID(), 
				Integer.parseInt(adminUser.getStatusCD()), adminUser.getNotes(), updatedAt);
	}
	

	/*
	 * 
	 * 
	 * 
	 * public Customer get(Long id) { return repo.findById(id).get(); }
	 * 
	 * public void delete(Long id) { repo.deleteById(id); }
	 * 
	 * public List<Customer> search(String keyword) { return repo.search(keyword); }
	 */
}

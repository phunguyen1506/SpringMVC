package com.onlineclass.sysadmin.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.onlineclass.sysadmin.controller.AdminUser;

@Repository
public interface AdminUserRepository extends CrudRepository<AdminUser, Integer> {

//	@Query(value = "SELECT c FROM Customer c WHERE c.name LIKE '%' || :keyword || '%'"
//			+ " OR c.email LIKE '%' || :keyword || '%'"
//			+ " OR c.address LIKE '%' || :keyword || '%'")
//	public List<AdminUser> search(@Param("keyword") String keyword);
	@Modifying
	@Transactional
	@Query(value ="UPDATE adminuser SET Name = :newName, Password = :password,AgentID = :agentID,StatusCD = :statusCD, Notes = :notes,UpdatedAt = :updatedAt  WHERE ID = :userID", nativeQuery = true)
	public void updateUserName(@Param("userID")int userID, 
			@Param("newName")String newName,
			@Param("password")String password,
			@Param("agentID")String agentID,
			@Param("statusCD")int statusCD,
			@Param("notes")String notes,
			@Param("updatedAt")String updatedAt);
}

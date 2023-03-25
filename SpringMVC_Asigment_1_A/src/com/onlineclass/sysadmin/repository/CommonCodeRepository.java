package com.onlineclass.sysadmin.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.onlineclass.sysadmin.controller.CommonCode;

@Repository
public interface CommonCodeRepository extends CrudRepository<CommonCode, Integer>{

}

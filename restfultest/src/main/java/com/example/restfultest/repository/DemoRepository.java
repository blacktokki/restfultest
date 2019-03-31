package com.example.restfultest.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.restfultest.entity.Demo;

@Repository
public interface DemoRepository extends JpaRepository<Demo, Long>{
    /*
	public List<Customer> findByName(String name);
    public List<Customer> findByPhone(String phone);
    //like검색도 가능
    public List<Customer> findByNameLike(String keyword);
    */
}
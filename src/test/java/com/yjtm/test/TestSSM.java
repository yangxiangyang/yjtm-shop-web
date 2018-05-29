package com.yjtm.test;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yjtm.service.UsersService;
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"}) 
public class TestSSM {

	private static Logger logger = Logger.getLogger(TestSSM.class);  
	   @Autowired  
	   private UsersService usersService ;  

	   @Test  
	   public void test1() { 
	       logger.info(usersService.selectByPrimaryKey(1));  
	       logger.info("ws");
	   }  

}

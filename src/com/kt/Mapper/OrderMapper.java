package com.kt.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kt.entity.Admin;
import com.kt.entity.Books;
import com.kt.entity.Order;

public interface OrderMapper {
	
	public List<Order> findAllOrders(@Param("state")String state,@Param("start")int start);
	
	public int countOrders(String state);
	
	public Order findOrdersByOid(String oid);
	
	public void updateOrderByOid(String oid);
	
	public List<Order> findOrdersById(String id);

}

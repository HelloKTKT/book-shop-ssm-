package com.kt.Service;

import java.util.List;

import com.kt.entity.Admin;
import com.kt.entity.Books;
import com.kt.entity.Order;

public interface OrderService {
	
	public List<Order> findAllOrders(String state,int start);
	
	public int countOrders(String state);
	
	Order findOrdersByOid(String oid);
	
	public void updateOrderByOid(String oid);
	
	public List<Order> findOrdersById(String id);

}

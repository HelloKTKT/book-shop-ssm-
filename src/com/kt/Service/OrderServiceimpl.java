package com.kt.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kt.Mapper.AdminMapper;
import com.kt.Mapper.BooksMapper;
import com.kt.Mapper.OrderMapper;
import com.kt.entity.Admin;
import com.kt.entity.Books;
import com.kt.entity.Order;

@Service("orderService")
public class OrderServiceimpl implements OrderService {
	
	@Resource
	OrderMapper orderMapper;

	@Override
	public List<Order> findAllOrders(String state, int start) {
		return orderMapper.findAllOrders(state, start);
	}

	@Override
	public int countOrders(String state) {
	return orderMapper.countOrders(state);
	}

	@Override
	public Order findOrdersByOid(String oid) {
		return orderMapper.findOrdersByOid(oid);
	}

	@Override
	public void updateOrderByOid(String oid) {
		orderMapper.updateOrderByOid(oid);
		
	}
	
	public List<Order> findOrdersById(String id){
		return orderMapper.findOrdersById(id);
	}




}

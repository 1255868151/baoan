package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.bean.Business;
import com.util.DBUtil;
import com.util.DateUtil;

public class BusinessDAO {
	public int getTotal(int id) {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
  
            String sql = "select count(*) from business where id = " + id;
  
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return total;
    }
  
    public void add(Business bean) {
 
        String sql = "insert into business values(null,?,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
  
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getSubTitle());
            ps.setTimestamp(3, DateUtil.d2t(bean.getCreateDate()));
            ps.execute();
  
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                bean.setId(id);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
    }
  
    public void update(Business bean) {
 
        String sql = "update business set name= ?, subTitle=? , createDate=? where id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getSubTitle());
            ps.setTimestamp(3, DateUtil.d2t(bean.getCreateDate()));
            ps.setInt(4, bean.getId());
            ps.execute();
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
  
    }
  
    public void delete(int id) {
  
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
  
            String sql = "delete from business where id = " + id;
  
            s.execute(sql);
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
    }
  
    public  Business get(int id) {
    	Business bean = new Business();
  
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
  
            String sql = "select * from business where id = " + id;
  
            ResultSet rs = s.executeQuery(sql);
  
            if (rs.next()) {
 
                String name = rs.getString("name");
                String subTitle = rs.getString("subTitle");
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
               
                bean.setName(name);
                bean.setSubTitle(subTitle);
                bean.setCreateDate(createDate);
                bean.setId(id);
            }
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return bean;
    }
    public List<Business> list() {
        return list(0,Short.MAX_VALUE);
    }
    public List<Business> list(int start, int count) {
        List<Business> beans = new ArrayList<Business>();
 
        String sql = "select * from business limit ?,? ";
  
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, start);
            ps.setInt(2, count);
  
            ResultSet rs = ps.executeQuery();
  
            while (rs.next()) {
            	Business bean = new Business();
                int id = rs.getInt(1);
               
                String name = rs.getString("name");
                String subTitle = rs.getString("subTitle");
               
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
 
                bean.setName(name);
                bean.setSubTitle(subTitle);
                
                bean.setCreateDate(createDate);
                bean.setId(id);
 
                beans.add(bean);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return beans;
    }    
   

    public List<Business> search(String keyword, int start, int count) {
         List<Business> beans = new ArrayList<Business>();
          
         if(null==keyword||0==keyword.trim().length())
             return beans;
            String sql = "select * from business where name like ? limit ?,? ";
      
            try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
                ps.setString(1, "%"+keyword.trim()+"%");
                ps.setInt(2, start);
                ps.setInt(3, count);
      
                ResultSet rs = ps.executeQuery();
      
                while (rs.next()) {
                	Business bean = new Business();
                    int id = rs.getInt(1);
                    
                    String name = rs.getString("name");
                    String subTitle = rs.getString("subTitle");
                    
                    Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
 
                    bean.setName(name);
                    bean.setSubTitle(subTitle);
                    bean.setCreateDate(createDate);
                    bean.setId(id);
 
                            
                    beans.add(bean);
                }
            } catch (SQLException e) {
      
                e.printStackTrace();
            }
            return beans;
    }
    public List<Business> queryAll() {
    	
    	List<Business> beans = new ArrayList<Business>();
    	 
        String sql = "select * from business  ";
  
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
           
  
            ResultSet rs = ps.executeQuery();
  
            while (rs.next()) {
            	Business bean = new Business();
                int id = rs.getInt(1);
               
                String name = rs.getString("name");
                String subTitle = rs.getString("subTitle");
               
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
 
                bean.setName(name);
                bean.setSubTitle(subTitle);
                
                bean.setCreateDate(createDate);
                bean.setId(id);
 
                beans.add(bean);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return beans;
    	
	}

	public int getTotal() {
		  int total = 0;
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "select count(*) from business";
	 
	            ResultSet rs = s.executeQuery(sql);
	            while (rs.next()) {
	                total = rs.getInt(1);
	            }
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return total;
	}
    
    
}

package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bean.Work;
import com.util.DBUtil;

public class WorkDAO {
	 public int getTotal() {
	        int total = 0;
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "select count(*) from work";
	 
	            ResultSet rs = s.executeQuery(sql);
	            while (rs.next()) {
	                total = rs.getInt(1);
	            }
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return total;
	    }
	 
	    public void add(Work bean) {
	 
	        String sql = "insert into work values(null ,? ,?,?,?,?,?,?,?)";
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
	 
	            ps.setString(1, bean.getName());
	            ps.setString(2, bean.getAge());
	            ps.setString(3, bean.getSex());
	            ps.setString(4, bean.getIphone());
	            ps.setString(5, bean.getAddress());
	            ps.setString(6, bean.getShenfen());     
	            ps.setString(7, bean.getWorkage());
	            ps.setString(8, bean.getGood());
	 
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
	 
	    public void update(Work bean) {
	 
	        String sql = "update work set name= ? , age= ?, sex =?, iphone =?,address=?, shenfen=?,workage=?,good=?where id = ? ";
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
	 
	        	    ps.setString(1, bean.getName());
		            ps.setString(2, bean.getAge());
		            ps.setString(3, bean.getSex());
		            ps.setString(4, bean.getIphone());
		            ps.setString(5, bean.getAddress());
		            ps.setString(6, bean.getShenfen());     
		            ps.setString(7, bean.getWorkage());
		            ps.setString(8, bean.getGood());
	                ps.setInt(9, bean.getId());
	 
	            ps.execute();
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	 
	    }
	 
	    public void delete(int id) {
	 
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "DELETE FROM work WHERE id = " + id;
	 
	            s.execute(sql);
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	    }
	 
	    public Work get(int id) {
	    	Work bean = null;
	 
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "select * from work where id = " + id;
	 
	            ResultSet rs = s.executeQuery(sql);
	 
	            if (rs.next()) {
	                bean = new Work();
	                String name = rs.getString("name");
	                bean.setName(name);
	                String age = rs.getString("age");
	                bean.setAge(age);
	                String sex = rs .getString("sex");
	                bean.setSex(sex);
	                String iphone = rs.getString("iphone");
	                bean.setIphone(iphone);
	                String shenfen = rs.getString("shenfen");
	                bean.setShenfen(shenfen);
	                String address = rs.getString("address");
	                bean.setAddress(address);
	                String workage = rs.getString("workage");
	                bean.setWorkage(workage);
	                String good = rs.getString("good");
	                bean.setGood(good);
	                bean.setId(id);
	            }
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return bean;
	    }
	 
	    public List<Work> list() {
	        return list(0, Short.MAX_VALUE);
	    }
	 /**
	  * ��ҳ��ѯ
	  * @param start
	  * @param count
	  * @return
	  */
	    public List<Work> list(int start, int count) {
	        List<Work> beans = new ArrayList<Work>();
	 
	        String sql = "select * from work order by id desc limit ?,? ";
	 
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
	 
	            ps.setInt(1, start);
	            ps.setInt(2, count);
	 
	            ResultSet rs = ps.executeQuery();
	 
	            while (rs.next()) {
	            	Work bean = new Work();
	                int id = rs.getInt(1);
	                String name = rs.getString("name");
	                bean.setName(name);
	                String age = rs.getString("age");
	                bean.setAge(age);
	                String sex = rs .getString("sex");
	                bean.setSex(sex);
	                String iphone = rs.getString("iphone");
	                bean.setIphone(iphone);
	                String shenfen = rs.getString("shenfen");
	                bean.setShenfen(shenfen);
	                String address = rs.getString("address");
	                bean.setAddress(address);
	                String workage = rs.getString("workage");
	                bean.setWorkage(workage);
	                String good = rs.getString("good");
	                bean.setGood(good);
	                bean.setId(id);
	          
	                beans.add(bean);
	            }
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return beans;
	    }
	   /**
	    *  ��boolean��ʽ����ĳ���û����Ƿ��Ѿ�����
	    * @param name
	    * @return
	    */
		public boolean isExist(String name) {
			Work work = get(name);
			return work!=null;

		}
	/**
	 * �����û�����ȡ����
	 * @param name
	 * @return
	 */
		public Work get(String name) {
			Work bean = null;
			 
			String sql = "select * from work where name = ?";
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
	        	ps.setString(1, name);
	            ResultSet rs =ps.executeQuery();
	 
	            if (rs.next()) {
	                bean = new Work();
	                int id = rs.getInt("id");
	                bean = new Work();
	                bean.setName(name);
	                String age = rs.getString("age");
	                bean.setAge(age);
	                String sex = rs .getString("sex");
	                bean.setSex(sex);
	                String iphone = rs.getString("iphone");
	                bean.setIphone(iphone);
	                String shenfen = rs.getString("shenfen");
	                bean.setShenfen(shenfen);
	                String address = rs.getString("address");
	                bean.setAddress(address);
	                String workage = rs.getString("workage");
	                bean.setWorkage(workage);
	                String good = rs.getString("good");
	                bean.setGood(good);
	                bean.setId(id);
	            }
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return bean;
		}
}

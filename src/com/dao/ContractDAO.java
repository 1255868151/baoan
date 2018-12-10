package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.bean.Contract;
import com.util.DBUtil;
import com.util.DateUtil;

public class ContractDAO {
	  public int getTotal() {
	        int total = 0;
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "select count(*) from contract";
	 
	            ResultSet rs = s.executeQuery(sql);
	            while (rs.next()) {
	                total = rs.getInt(1);
	            }
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return total;
	    }
	 
	    public void add(Contract bean) {
	 
	        String sql = "insert into contract values(null ,? ,?,?,?,?,?,?,?,?,?,?)";
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
	 
	            ps.setString(1, bean.getOrdercode());
	            ps.setString(2, bean.getPartya());
	            ps.setString(3, bean.getPartyb());
	            ps.setInt(4, bean.getWorknum());
	            ps.setTimestamp(5,  DateUtil.d2t(bean.getStartDate()));
	            ps.setTimestamp(6,  DateUtil.d2t(bean.getEndDate()));
	            ps.setString(7, bean.getAddress());
	            ps.setDouble(8, bean.getMoney());
	            ps.setString(9, bean.getAname());
	            ps.setString(10, bean.getBname());
	            ps.setTimestamp(11, DateUtil.d2t(bean.getConDate()));
	 
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
	 
	    public void update(Contract bean) {
	 
	        String sql = "update contract set ordercode= ? , partya= ?, partyb =?, worknum =?,startDate=?, endDate=?,address=?,money=?,aname=?,bname=?,conDate=?,where id = ? ";
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
	 
	        	ps.setString(1, bean.getOrdercode());
	            ps.setString(2, bean.getPartya());
	            ps.setString(3, bean.getPartyb());
	            ps.setInt(4, bean.getWorknum());
	            ps.setTimestamp(5,  DateUtil.d2t(bean.getStartDate()));
	            ps.setTimestamp(6,  DateUtil.d2t(bean.getEndDate()));
	            ps.setString(7, bean.getAddress());
	            ps.setDouble(8, bean.getMoney());
	            ps.setString(9, bean.getAname());
	            ps.setString(10, bean.getBname());
	            ps.setTimestamp(11, DateUtil.d2t(bean.getConDate()));
	            ps.setInt(12, bean.getId());
	 
	            ps.execute();
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	 
	    }
	 
	    public void delete(int id) {
	 
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "DELETE FROM contract WHERE id = " + id;
	 
	            s.execute(sql);
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	    }
	 
	    public Contract get(int id) {
	    	Contract bean = null;
	 
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "select * from contract where id = " + id;
	 
	            ResultSet rs = s.executeQuery(sql);
	 
	            if (rs.next()) {
	                bean = new Contract();
	                String ordercode = rs.getString("ordercode");
	                bean.setOrdercode(ordercode);
	                String partya = rs.getString("partya");
	                bean.setPartya(partya);
	                String partyb = rs.getString("partyb");
	                bean.setPartyb(partyb);
	                int worknum = rs.getInt("worknum");
	                bean.setWorknum(worknum);
	                Date startDate = DateUtil.t2d( rs.getTimestamp("startDate"));
	                bean.setStartDate(startDate);
	                Date endtDate = DateUtil.t2d( rs.getTimestamp("endDate"));
	                bean.setEndDate(endtDate);
	                String address = rs.getString("address");
	                bean.setAddress(address);
	                double money = rs.getDouble("money");
	                bean.setMoney(money);
	                String aname = rs.getString("aname");
	                bean.setAname(aname);
	                String bname = rs.getString("bname");
	                bean.setBname(bname);
	                Date conDate = DateUtil.t2d( rs.getTimestamp("conDate"));
	                bean.setConDate(conDate);
	                bean.setId(id);
	            }
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return bean;
	    }
	 
	    public List<Contract> list() {
	        return list(0, Short.MAX_VALUE);
	    }
	 /**
	  * 分页查询
	  * @param start
	  * @param count
	  * @return
	  */
	    public List<Contract> list(int start, int count) {
	        List<Contract> beans = new ArrayList<Contract>();
	 
	        String sql = "select * from contract order by id desc limit ?,? ";
	 
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
	 
	            ps.setInt(1, start);
	            ps.setInt(2, count);
	 
	            ResultSet rs = ps.executeQuery();
	 
	            while (rs.next()) {
	            	Contract bean = new Contract();
	                int id = rs.getInt(1);
	                String ordercode = rs.getString("ordercode");
	                bean.setOrdercode(ordercode);
	                String partya = rs.getString("partya");
	                bean.setPartya(partya);
	                String partyb = rs.getString("partyb");
	                bean.setPartyb(partyb);
	                int worknum = rs.getInt("worknum");
	                bean.setWorknum(worknum);
	                Date startDate = DateUtil.t2d( rs.getTimestamp("startDate"));
	                bean.setStartDate(startDate);
	                Date endtDate = DateUtil.t2d( rs.getTimestamp("endDate"));
	                bean.setEndDate(endtDate);
	                String address = rs.getString("address");
	                bean.setAddress(address);
	                double money = rs.getDouble("money");
	                bean.setMoney(money);
	                String aname = rs.getString("aname");
	                bean.setAname(aname);
	                String bname = rs.getString("bname");
	                bean.setBname(bname);
	                Date conDate = DateUtil.t2d( rs.getTimestamp("conDate"));
	                bean.setConDate(conDate);
	                bean.setId(id);
	          
	                beans.add(bean);
	            }
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return beans;
	    }
	   /**
	    *  以boolean形式返回某个用户名是否已经存�?
	    * @param name
	    * @return
	    */
		public boolean isExist(String name) {
			Contract contract = get(name);
			return contract!=null;

		}
	/**
	 * 根据用户名获取
	 * @param name
	 * @return
	 */
		public Contract get(String name) {
			Contract bean = null;
			 
			String sql = "select * from contract where name = ?";
	        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
	        	ps.setString(1, name);
	            ResultSet rs =ps.executeQuery();
	 
	            if (rs.next()) {
	                bean = new Contract();
	                int id = rs.getInt("id");
	                bean = new Contract();
	                String ordercode = rs.getString("ordercode");
	                bean.setOrdercode(ordercode);
	                String partya = rs.getString("partya");
	                bean.setPartya(partya);
	                String partyb = rs.getString("partyb");
	                bean.setPartyb(partyb);
	                int worknum = rs.getInt("worknum");
	                bean.setWorknum(worknum);
	                Date startDate = DateUtil.t2d( rs.getTimestamp("startDate"));
	                bean.setStartDate(startDate);
	                Date endtDate = DateUtil.t2d( rs.getTimestamp("endDate"));
	                bean.setEndDate(endtDate);
	                String address = rs.getString("address");
	                bean.setAddress(address);
	                double money = rs.getDouble("money");
	                bean.setMoney(money);
	                String aname = rs.getString("aname");
	                bean.setAname(aname);
	                String bname = rs.getString("bname");
	                bean.setBname(bname);
	                Date conDate = DateUtil.t2d( rs.getTimestamp("conDate"));
	                bean.setConDate(conDate);
	                bean.setId(id);
	            }
	 
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return bean;
		}
}

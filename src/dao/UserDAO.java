package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.UserBean;

public class UserDAO extends DAOConnection{
	//認証確認
	public int loginCheck(String name, String password) {
		int loginCheck = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT * FROM user WHERE user_name = ? AND password = ?");
			ps.setString(1, name);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			//入力が間違っている場合
			if(!(rs.next())) {
				loginCheck = 0;
			//入力が正しい場合
			}else {
				UserBean bean = new UserBean();
				bean.setId(rs.getInt("user_id"));
				bean.setName(rs.getString("user_name"));
				bean.setPassword(rs.getString("password"));
				loginCheck = 2;
				//管理人の場合
				if(name.equals("admin")) {
					loginCheck = 1;
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return loginCheck;
	}
	
	//俳号被り確認
	public boolean userCheck(String name) {
		boolean userCheck = true;
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT user_id FROM user WHERE user_name = ?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				userCheck = false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return userCheck;
	}
	
	//新規登録
	public void userCreate(String name, String password) {
		try {
			conn = getConnection();
			ps = conn.prepareStatement(
					"INSERT INTO user (user_name, password, create_date, create_time, update_date, update_time) VALUES (?, ?, now(), now(), now(), now())"
			);
			ps.setString(1, name);
			ps.setString(2, password);
			ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
	}
	
	//閲覧者の登録、更新日時取得
	public ArrayList<UserBean> userDate(String name){
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT create_date, create_time, update_date, update_time FROM user WHERE user_name = ?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserBean bean = new UserBean();
				bean.setCreateDate(rs.getDate("create_date"));
				bean.setCreateTime(rs.getTime("create_time"));
				bean.setUpdateDate(rs.getDate("update_date"));
				bean.setUpdateTime(rs.getTime("update_time"));
				userList.add(bean);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return userList;
	}
	
	//情報変更前に認証
	public int dataChangeCheck(String name, String password) {
		int id = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT user_id FROM user WHERE user_name = ? AND password = ?");
			ps.setString(1, name);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			//入力が間違っている場合
			if(!(rs.next())) {
				id = 0;
			//入力が正しい場合
			}else {
				id = rs.getInt("user_id");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return id;
	}
	
	//情報更新
	public void userUpdate(String name, String password, int id) {		
		try {
			conn = getConnection();
			ps = conn.prepareStatement("UPDATE user SET user_name = ?, password = ?, update_date = now(), update_time = now() WHERE user_id = ?");
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setInt(3, id);
			ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
	}
	
	//退会
	public void userDelete(String name) {
		try {
			conn = getConnection();
			ps = conn.prepareStatement("DELETE FROM user WHERE user_name = ?");
			ps.setString(1, name);
			ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
	}
	
	//全会員を取得
	public ArrayList<UserBean> allUser(){
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT * FROM user");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserBean bean = new UserBean();
				bean.setId(rs.getInt("user_id"));
				bean.setName(rs.getString("user_name"));
				bean.setCreateDate(rs.getDate("create_date"));
				bean.setCreateTime(rs.getTime("create_time"));
				bean.setUpdateDate(rs.getDate("update_date"));
				bean.setUpdateTime(rs.getTime("update_time"));
				userList.add(bean);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return userList;
	}
	
	//入力された俳号に当てはまる会員を取得
	public ArrayList<UserBean> searchUser(String name){
		ArrayList<UserBean> searchUser = new ArrayList<UserBean>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT * FROM user WHERE user_name LIKE '%" + name + "%'");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserBean bean = new UserBean();
				bean.setId(rs.getInt("user_id"));
				bean.setName(rs.getString("user_name"));
				bean.setCreateDate(rs.getDate("create_date"));
				bean.setCreateTime(rs.getTime("create_time"));
				bean.setUpdateDate(rs.getDate("update_date"));
				bean.setUpdateTime(rs.getTime("update_time"));
				searchUser.add(bean);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return searchUser;
	}
	
	//退会させる会員を取得
	public ArrayList<UserBean> banUser(int id){
		ArrayList<UserBean> banUser = new ArrayList<UserBean>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT * FROM user WHERE user_id = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserBean bean = new UserBean();
				bean.setId(rs.getInt("user_id"));
				bean.setName(rs.getString("user_name"));
				bean.setCreateDate(rs.getDate("create_date"));
				bean.setCreateTime(rs.getTime("create_time"));
				bean.setUpdateDate(rs.getDate("update_date"));
				bean.setUpdateTime(rs.getTime("update_time"));
				banUser.add(bean);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
		return banUser;
	}
	
	//指定された会員を強制退会
	public void userBAN(int id) {
		try {
			conn = getConnection();
			ps = conn.prepareStatement("DELETE FROM user WHERE user_id = ?");
			ps.setInt(1, id);
			ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			allClose(ps, conn);
		}
	}
}
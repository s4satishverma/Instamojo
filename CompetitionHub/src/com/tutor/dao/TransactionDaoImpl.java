package com.tutor.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tutor.util.DbConnection;

public class TransactionDaoImpl implements	TransactionDao {
    Connection con=null;
    CallableStatement stmt = null;
	@Override
	public String insertTransDetails(String amount) {
	    String transId = "";
		try
	    {
	      con = new DbConnection().getConnection();
	      String sql = "{call sp_transaction(?, ?)}";
	      stmt = con.prepareCall(sql);
 	      //Bind IN parameter first, then bind OUT parameter
	      stmt.setString(1, amount); // This would set ID as 102
	      stmt.registerOutParameter(2, java.sql.Types.INTEGER);
          //Use execute method to run stored procedure.
	      stmt.execute();
          int count=stmt.getInt(2);
          transId = String.valueOf(count);
	    } catch (Exception e) {
	  	  e.printStackTrace();
		}
	    finally{
	    	try {
				if(con!=null){
				 con.close();
				}
				if(stmt!=null)stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
		return transId;
	}

}

package rest;

import java.sql.*;
import java.text.ParseException;
import java.util.List;

public class Service{
	private Connection connection;
	
	public Service(){
		connection=DBUtility.getConnection();
	}	
	public List<Model> BooksAvail(String username,String bname){
		List<Model> books=new ArrayList<Model>();
		try{
			PreparedStatement pst;
			pst.prepareStatement();
			String query="select * from booktrans where username=?,bname=? and status='Available'";
			pst.setString(1,username);
			pst.setString(2,bname);
			ResultSet rs=pst.executeQuery();

			while(rs!=null&&rs.next()){
				Model book=new Model();
				book.setBname(rs.getString("bname"));
				book.setEdition(rs.getString("edition"));
				book.setSubject(rs.getString("subject"));
				book.setBookId(rs.getString("bookid"));
				books.add(book);
		  	 }
		}
		catch(Exception e){
		e.printStackTrace();
	}
	return	books;	
}
}
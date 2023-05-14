package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class HelpingClass {
//static ServletContext context =null;

	
//	public static void setContext(ServletContext context) {
//		HelpingClass.context = context;
//	}
	// Register new User
	static int addNewUser(String name,String mail,String mobile,String gender,String dob,String password) {
		int result = 0;
		
		try {
			Connection connection = HelpingClass.getDbConnection();
			PreparedStatement statement = connection.prepareStatement("insert into userDetails (user_name,user_email,user_mobile,user_gender,user_dob,user_password)values(?,?,?,?,?,?)");
			statement.setString(1, name);
			statement.setString(2, mail);
			statement.setString(3, mobile);
			statement.setString(4, gender);
			statement.setString(5, dob);
			statement.setString(6, password);
			
			result = statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	//LogIn Validation
	static String loginValidation(String mail,String password) {
		String result = null;
		
		try {
			Connection connection = HelpingClass.getDbConnection();
			PreparedStatement statement = connection.prepareStatement("select * from userDetails where user_email=? and user_password=?");
			statement.setString(1, mail);
			statement.setString(2, password);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				result = resultSet.getString(2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	// Show all products
	public static ArrayList<ProductPojo> getAllProducts(){
		ProductPojo product = null;
		
		ArrayList<ProductPojo> products = new ArrayList<ProductPojo>();
		
		try {
			Connection con = HelpingClass.getDbConnection();
			Statement statement = con.createStatement();
			ResultSet set = statement.executeQuery("select * from product_info");
			
			while(set.next()) {
				product = new ProductPojo(set.getInt(1), set.getString(2), set.getString(3), set.getInt(4), set.getString(5));
				products.add(product);
			}
		} catch (Exception e) {
			System.out.println("ALL product class prblm");
		}
		return products;
	}
	
	
	// Get Database Connection
	public static Connection getDbConnection() {
		Connection connection = null;
//	String userName =context.getInitParameter("dbUserName");
//	String password =context.getInitParameter("dbUserName");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_project?characterEncoding=latin1", "root", "root");
	} catch (ClassNotFoundException |SQLException e) {
		e.printStackTrace();
	} 
	return connection;
}
}
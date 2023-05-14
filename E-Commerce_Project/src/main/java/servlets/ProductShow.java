package servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductShow {
	private Connection con;
	public ProductShow(Connection con) {
		this.con = con;
	}
	public ArrayList<ProductPojo> getAllProducts(){
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
	public List<CartPojo> getCartProducts(ArrayList<CartPojo> cartList){
		List<CartPojo> book = new ArrayList<CartPojo>();
		
		try {
			if (cartList.size() > 0) {
                for (CartPojo item : cartList) {
                	
                	Connection connection = HelpingClass.getDbConnection();
                   
                    PreparedStatement pst = connection.prepareStatement("select * from product_info where p_id=?");
                    pst.setInt(1, item.getId());
                    
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                    	
                        CartPojo row = new CartPojo();
                        row.setId(rs.getInt("p_id"));
                        row.setName(rs.getString("p_name"));
                        row.setCategory(rs.getString("p_category"));
                        int price = Integer.parseInt(rs.getString("p_price"));
                        row.setPrice(price*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }
                }
                }
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return book;
	}
	public int getTotalCartPrice(ArrayList<CartPojo> cartList) {
		int sum = 0;
		
		try {
			
			if(cartList.size()>0) {
				for(CartPojo item :cartList) {
					String query = "select p_price from product_info where p_id=?";
					Connection connection = HelpingClass.getDbConnection();
					PreparedStatement statement = connection.prepareStatement(query);
					statement.setInt(1, item.getId());
					ResultSet set = statement.executeQuery();
					
					while(set.next()) {
						sum += set.getInt("p_price")*item.getQuantity();
					}
				}
			}
			
		} catch (Exception e) {
		}
		
		return sum;
		
	}
}

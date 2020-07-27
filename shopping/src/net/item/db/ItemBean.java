package net.item.db;

import java.sql.Date;

public class ItemBean {

		private int item_num;
	    private String item_category;
	    private String item_name;
	    private int item_price;
	    private String item_description;
	    private String item_img;
	    private Date item_date;
	    
		public int getItem_num() {
			return item_num;
		}
		
		public void setItem_num(int item_num) {
			this.item_num = item_num;
		}
		
		public String getItem_category() {
			return item_category;
		}
		
		public void setItem_category(String item_category) {
			this.item_category = item_category;
		}
		
		public String getItem_name() {
			return item_name;
		}
		
		public void setItem_name(String item_name) {
			this.item_name = item_name;
		}
		
		public int getItem_price() {
			return item_price;
		}
		
		public void setItem_price(int item_price) {
			this.item_price = item_price;
		}
		
		public String getItem_description() {
			return item_description;
		}
		
		public void setItem_description(String item_description) {
			this.item_description = item_description;
		}
		
		public String getItem_img() {
			return item_img;
		}
		
		public void setItem_img(String item_img) {
			this.item_img = item_img;
		}
		
		public Date getItem_date() {
			return item_date;
		}
		
		public void setItem_date(Date item_date) {
			this.item_date = item_date;
		}
}

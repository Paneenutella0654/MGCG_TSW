package it.mgcg.beans;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collection;

public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	/////////// STATIC///////////////////////////////////////////////////
	public static int NO_ITEM = -1;

	static boolean isProductInizialize(Product b) {
		return b.getId() != NO_ITEM;
	}
	///////////////////////////////////////////////////////////////////

	///////////////////////// ATTRIBUTES///////////////////////////////////
	private int id;
	private String name; 
	private String description; 
	private String shortDescription; 
	private String metaDescription; 
	private String metaKeyword; 
	private String imagePath;

	private double price;
	private double discount;
	private int tax;

	private int quantity;
	private int onSale;

	private Collection<Category> categories ;
	private Collection<Review> reviewes;
	
	
	
	private boolean available;
	//////////////////////////////////////////////////////////////////////////

	////////// BUILDER/////////////////////////////////////////////////////////
	public Product(int id, String name, String description, String shortDescription, String metaDescription,
			String metaKeyword, double price, double discount, int quantity, int onSale,
			boolean available) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.shortDescription = shortDescription;
		this.metaDescription = metaDescription;
		this.metaKeyword = metaKeyword;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.onSale = onSale;
		this.available = available;
		
	}
	
	public Product(String name, String description, String shortDescription, String metaDescription, String metaKeyword,
			 double price, double discount, int quantity, int onSale, boolean available) {
		this(0, name, description, shortDescription, metaDescription, metaKeyword, price, discount, quantity,
				onSale, available);
		
	}

	public Product() {
		this.id = NO_ITEM;
	}

	////////// GETTER&SETTERS//////////////////////////////////////////////////

	
	public Product(int id) {
		this.id = id;
	}

	public void addCategory(Category category) {
		if(categories == null ) categories = new ArrayList<Category>();
		if(!categories.contains(category))
			categories.add(category);
	}
	
	public Collection<Category> getCategories() {
		if(categories == null ) categories = new ArrayList<Category>(); 
		return categories;
	}
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getMetaDescription() {
		return metaDescription;
	}

	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}

	public String getMetaKeyword() {
		return metaKeyword;
	}

	public void setMetaKeyword(String metaKeyword) {
		this.metaKeyword = metaKeyword;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public String getPriceToString() {
		return String.format("%.2f", price);
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getOnSale() {
		return onSale;
	}

	public void setOnSale(int onSale) {
		this.onSale = onSale;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	//////////////////////////////////////////////////////////////////////////


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		long temp;
		temp = Double.doubleToLongBits(discount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + id;
		result = prime * result + ((metaDescription == null) ? 0 : metaDescription.hashCode());
		result = prime * result + ((metaKeyword == null) ? 0 : metaKeyword.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + onSale;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + quantity;
		result = prime * result + ((shortDescription == null) ? 0 : shortDescription.hashCode());
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", shortDescription="
				+ shortDescription + ", metaDescription=" + metaDescription + ", metaKeyword=" + metaKeyword
				+ ", imagePath=" + imagePath + ", price=" + price + ", discount=" + discount + ", tax=" + tax
				+ ", quantity=" + quantity + ", onSale=" + onSale + ", categories=" + categories + ", reviewes="
				+ reviewes + ", available=" + available + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (available != other.available)
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (Double.doubleToLongBits(discount) != Double.doubleToLongBits(other.discount))
			return false;
		if (id != other.id)
			return false;
		if (metaDescription == null) {
			if (other.metaDescription != null)
				return false;
		} else if (!metaDescription.equals(other.metaDescription))
			return false;
		if (metaKeyword == null) {
			if (other.metaKeyword != null)
				return false;
		} else if (!metaKeyword.equals(other.metaKeyword))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (onSale != other.onSale)
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		if (quantity != other.quantity)
			return false;
		if (shortDescription == null) {
			if (other.shortDescription != null)
				return false;
		} else if (!shortDescription.equals(other.shortDescription))
			return false;
		
		return true;
	}

	public Collection<Review> getReviewes() {
		return reviewes;
	}

	public void setReviewes(Collection<Review> reviewes) {
		this.reviewes = reviewes;
	}

}

CREATE DATABASE IF NOT EXISTS shop613;
USE shop613;
CREATE TABLE IF NOT EXISTS brand (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  brand_name VARCHAR(100) NOT NULL  
);  

CREATE TABLE IF NOT EXISTS product_category (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  name VARCHAR(100) NOT NULL  
);  

CREATE TABLE IF NOT EXISTS products (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  name VARCHAR(200) NOT NULL,  
  base_price INT NOT NULL,  
  brand_id INT,  
  category_id INT,  
  FOREIGN KEY (brand_id) REFERENCES brand(id),  
  FOREIGN KEY (category_id) REFERENCES product_category(id)  
);  

CREATE TABLE IF NOT EXISTS product_image (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  image VARCHAR(300) NOT NULL,  
  product_id INT,  
  FOREIGN KEY (product_id) REFERENCES products(id)  
);  

CREATE TABLE IF NOT EXISTS color (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  name VARCHAR(50) NOT NULL  
);  

CREATE TABLE IF NOT EXISTS size_category (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  name VARCHAR(100) NOT NULL  
);  

CREATE TABLE IF NOT EXISTS size_option (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  label VARCHAR(10) NOT NULL,  
  size_category_id INT,  
  FOREIGN KEY (size_category_id) REFERENCES size_category(id)  
);  

CREATE TABLE IF NOT EXISTS product_variation (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  product_id INT,  
  color_id INT,  
  size_option_id INT,  
  FOREIGN KEY (product_id) REFERENCES products(id),  
  FOREIGN KEY (color_id) REFERENCES color(id),  
  FOREIGN KEY (size_option_id) REFERENCES size_option(id)  
);  

CREATE TABLE IF NOT EXISTS product_item (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  variation_id INT,    
  Quantity INT NOT NULL,  
  price INT NOT NULL,  
  FOREIGN KEY (variation_id) REFERENCES product_variation(id)  
);  

CREATE TABLE attribute_category (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  name VARCHAR(100) NOT NULL  
);  

CREATE TABLE attribute_type (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  type VARCHAR(100) NOT NULL  
);  

CREATE TABLE product_attribute (  
  id INT AUTO_INCREMENT PRIMARY KEY,  
  product_id INT,  
  name VARCHAR(100) NOT NULL,  
  value VARCHAR(200) NOT NULL,  
  attribute_type_id INT,  
  attribute_category_id INT,  
  FOREIGN KEY (product_id) REFERENCES products(id),  
  FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id),  
  FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id)  
);  
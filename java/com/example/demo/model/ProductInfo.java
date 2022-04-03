package com.example.demo.model;

import com.example.demo.entity.Product;

public class ProductInfo {
    private String code;
    private String name;
    private String image;
    private String image1;
    private String image2;
    private double price;
 
    public ProductInfo() {
    }
 
    public ProductInfo(Product product) {
        this.code = product.getCode();
        this.name = product.getName();
        this.price = product.getPrice();
        this.image = product.getImage();
        this.image1 = product.getImage1();
        this.image2 = product.getImage2();
    }
 
    // Using in JPA/Hibernate query
    public ProductInfo(String code, String name, double price,String image, String image1, String image2) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.image = image;
        this.image1 = image1;
        this.image2 = image2;
    }
 
    public String getCode() {
        return code;
    }
 
    public void setCode(String code) {
        this.code = code;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public double getPrice() {
        return price;
    }
 
    public void setPrice(double price) {
        this.price = price;
    }
    public void setImage(String image) {
        this.image = image;
    }
 
    public String getImage() {
        return image;
    }
    public void setImage1(String image1) {
        this.image1 = image1;
    }
 
    public String getImage1() {
        return image1;
    }
    public void setImage2(String image2) {
        this.image2 = image2;
    }
 
    public String getImage2() {
        return image2;
    }
    
}

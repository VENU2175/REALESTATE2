package com.example.demo.model;

import com.example.demo.entity.Seller;

public class SellerInfo {
    private String code;
    private String name;
    private String price;
 
    public SellerInfo() {
    }
 
    public SellerInfo(Seller seller) {
        this.code = seller.getCode();
        this.name = seller.getName();
        this.price = seller.getPrice();
      
    }
 
    // Using in JPA/Hibernate query
    public SellerInfo(String code, String name, String price) {
        this.code = code;
        this.name = name;
        this.price = price;
       
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
 
    public String getPrice() {
        return price;
    }
 
    public void setPrice(String price) {
        this.price = price;
    }
  
    
}

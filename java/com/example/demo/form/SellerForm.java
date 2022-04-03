package com.example.demo.form;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Seller;

public class SellerForm {
    private String code;
    private String name;
    private String price;
 
    private boolean newSeller = false;
 
    public SellerForm() {
        this.newSeller= true;
    }
 
    public SellerForm(Seller seller) {
        this.code = seller.getCode();
        this.name = seller.getName();
        this.price = seller.getPrice();
        
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

    public boolean isNewSeller() {
        return newSeller;
    }
 
    public void setNewSeller(boolean newSeller) {
        this.newSeller = newSeller;
    }
 
}

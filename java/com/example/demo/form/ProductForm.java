package com.example.demo.form;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Product;

public class ProductForm {
    private String code;
    private String name;
    private String image;
    private String image1;
    private String image2;
    private double price;
 
    private boolean newProduct = false;
 
    // Upload file.
    private MultipartFile fileData;
    private MultipartFile fileData1;
    private MultipartFile fileData2;
    public ProductForm() {
        this.newProduct= true;
    }
 
    public ProductForm(Product product) {
        this.code = product.getCode();
        this.name = product.getName();
        this.price = product.getPrice();
        this.image = product.getImage();
        this.image1 = product.getImage1();
        this.image2 = product.getImage2();
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

    public String getImage() {
        return image;
    }
 
    public void setImage(String image) {
        this.image = image;
    }

    public String getImage1() {
        return image1;
    }
 
    public void setImage1(String image1) {
        this.image1 = image1;
    }
    

    public String getImage2() {
        return image2;
    }
 
    public void setImage2(String image2) {
        this.image2 = image2;
    }
    public MultipartFile getFileData() {
        return fileData;
    }
 
    public void setFileData(MultipartFile fileData) {
        this.fileData = fileData;
    }
    

    public MultipartFile getFileData1() {
        return fileData1;
    }
 
    public void setFileData1(MultipartFile fileData1) {
        this.fileData1 = fileData1;
    }
 

    public MultipartFile getFileData2() {
        return fileData2;
    }
 
    public void setFileData2(MultipartFile fileData2) {
        this.fileData2 = fileData2;
    }
    public boolean isNewProduct() {
        return newProduct;
    }
 
    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }
 
}

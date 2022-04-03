package com.example.demo.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.demo.dao.ProductDAO;
import com.example.demo.entity.Product;
import com.example.demo.form.ProductForm;
import com.example.demo.dao.SellerDAO;
import com.example.demo.entity.Seller;
import com.example.demo.form.SellerForm;
@Component
public class SellerFormValidator implements Validator {
 
   @Autowired
   private SellerDAO sellerDAO;
 
   // This validator only checks for the ProductForm.
   @Override
   public boolean supports(Class<?> clazz) {
      return clazz == SellerForm.class;
   }
 
   @Override
   public void validate(Object target, Errors errors) {
      SellerForm sellerForm = (SellerForm) target;
 
      // Check the fields of ProductForm.
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotEmpty.sellerForm.code");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.sellerForm.name");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty.sellerForm.price");
 
      String code = sellerForm.getCode();
      if (code != null && code.length() > 0) {
         if (code.matches("\\s+")) {
            errors.rejectValue("code", "Pattern.sellerForm.code");
         } else if (sellerForm.isNewSeller()) {
            Seller seller = sellerDAO.findSeller(code);
            if (seller != null) {
               errors.rejectValue("code", "Duplicate.sellerForm.code");
            }
         }
      }
   }
 
}

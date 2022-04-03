package com.example.demo.dao;

import java.io.IOException;
import java.util.Date;

import javax.persistence.NoResultException;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entity.Seller;
import com.example.demo.form.SellerForm;
import com.example.demo.model.SellerInfo;
import com.example.demo.pagination.PaginationResult;

@Transactional
@Repository
public class SellerDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public Seller findSeller(String code) {
        try {
            String sql = "Select e from " + Seller.class.getName() + " e Where e.code =:code ";
 
            Session session = this.sessionFactory.getCurrentSession();
            Query<Seller> query = session.createQuery(sql, Seller.class);
            query.setParameter("code", code);
            return (Seller) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Autowired
	private BCryptPasswordEncoder passwordEncoder;
    
    public SellerInfo findSellerInfo(String code) {
    	Seller seller = this.findSeller(code);
        if (seller == null) {
            return null;
        }
        return new SellerInfo(seller.getCode(), seller.getName(), seller.getPrice());
    }
 
    @Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void save(SellerForm sellerForm) {
 
        Session session = this.sessionFactory.getCurrentSession();
        String code = sellerForm.getCode();
 
        Seller seller = null;
 
        boolean isNew = false;
        if (code != null) {
        	seller = this.findSeller(code);
        }
        if (seller == null) {
            isNew = true;
            seller = new Seller();
          //  product.setCreateDate(new Date());
        }
        seller.setCode(code);
        seller.setName(passwordEncoder.encode(sellerForm.getName()));
        seller.setPrice(sellerForm.getPrice());
 
        if (isNew) {
            session.persist(seller);
        }
        // If error in DB, Exceptions will be thrown out immediately
        session.flush();
    }
 
    public PaginationResult<SellerInfo> querySellers(int page, int maxResult, int maxNavigationPage,
            String likeName) {
        String sql = "Select new " + SellerInfo.class.getName() //
                + "(p.code, p.name, p.price) " + " from "//
                + Seller.class.getName() + " p ";
        if (likeName != null && likeName.length() > 0) {
            sql += " Where lower(p.name) like :likeName ";
        }
        sql += "";
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<SellerInfo> query = session.createQuery(sql, SellerInfo.class);
 
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<SellerInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<SellerInfo> querySellers(int page, int maxResult, int maxNavigationPage) {
        return querySellers(page, maxResult, maxNavigationPage, null);
    }
 
}

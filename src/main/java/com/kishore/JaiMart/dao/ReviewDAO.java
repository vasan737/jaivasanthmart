package com.kishore.JaiMart.dao;

import com.kishore.JaiMart.exception.DataAccessException;
import com.kishore.JaiMart.model.Review;

import java.util.List;

public interface ReviewDAO {
    Review insert(Review review) throws DataAccessException;
    List<Review> findByProduct(long productId) throws DataAccessException;
    boolean existsByUserAndOrderAndProduct(long userId, long orderId, long productId) throws DataAccessException;
    double averageRating(long productId) throws DataAccessException;
}

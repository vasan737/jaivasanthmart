package com.kishore.JaiMart.dao;

import com.kishore.JaiMart.exception.DataAccessException;
import com.kishore.JaiMart.model.User;

import java.util.Optional;

public interface UserDAO {
    User insert(User user) throws DataAccessException;
    Optional<User> findById(long id) throws DataAccessException;
    Optional<User> findByEmail(String email) throws DataAccessException;
    java.util.List<User> findAll() throws DataAccessException;
}

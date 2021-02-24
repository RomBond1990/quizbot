package com.rbondarovich.interfaces;

import com.rbondarovich.beans.UserBean;

public interface UserService {

    Iterable<UserBean> getAllUsers();

    UserBean getUserById (Long id);

    void saveUser (UserBean user);

    void deleteUser (Long id);
}

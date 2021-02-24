package com.rbondarovich.impl;

import com.rbondarovich.beans.UserBean;
import com.rbondarovich.entity.User;
import com.rbondarovich.interfaces.UserService;
import com.rbondarovich.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final EntityBeanConverterImpl converter;
    private final UserRepository userRepository;

    @Override
    public Iterable<UserBean> getAllUsers() {
        List<User> users = userRepository.findAll();
        List<UserBean> userBeans = converter.convertToBeanList(users, UserBean.class);
        return userBeans;
    }

    @Override
    public UserBean getUserById(Long id) {
        User user = userRepository.getOne(id);
        UserBean userBean = converter.convertToBean(user, UserBean.class);
        return userBean;
    }

    @Override
    public void saveUser(UserBean user) {
        User userEntity = converter.convertToEntity(user, User.class);
        userRepository.save(userEntity);
    }

    @Override
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}

package com.rbondarovich.beans;

import lombok.Data;

@Data
public class ScoreBean {

    private Long id;
    private Integer score;
    private TestBean test;
    private UserBean user;
}

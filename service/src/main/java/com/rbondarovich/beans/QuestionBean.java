package com.rbondarovich.beans;

import lombok.Data;

@Data
public class QuestionBean {

    private Long id;
    private String text;
    private TestBean test;
}

package com.rbondarovich.beans;

import lombok.Data;

@Data
public class AnswerBean {

    private Long id;
    private String text;
    private boolean right;
    private QuestionBean question;
}

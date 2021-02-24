package com.rbondarovich.interfaces;

import com.rbondarovich.beans.AnswerBean;

public interface AnswerService {

    Iterable<AnswerBean> getAllAnswers();

    AnswerBean getAnswerById (Long id);

    void saveAnswer (AnswerBean answer);

    void deleteAnswer (Long id);
}

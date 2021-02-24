package com.rbondarovich.interfaces;

import com.rbondarovich.beans.QuestionBean;

public interface QuestionService {

    Iterable<QuestionBean> getAllQuestions();

    QuestionBean getQuestionById (Long id);

    void saveQuestion (QuestionBean question);

    void deleteQuestion (Long id);
}

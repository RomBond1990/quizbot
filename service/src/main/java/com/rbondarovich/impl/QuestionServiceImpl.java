package com.rbondarovich.impl;

import com.rbondarovich.beans.QuestionBean;
import com.rbondarovich.entity.Question;
import com.rbondarovich.interfaces.QuestionService;
import com.rbondarovich.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService {

    private final EntityBeanConverterImpl converter;
    private final QuestionRepository questionRepository;

    @Override
    public Iterable<QuestionBean> getAllQuestions() {
        List<Question> questions = questionRepository.findAll();
        List<QuestionBean> questionBeans = converter.convertToBeanList(questions, QuestionBean.class);
        return questionBeans;
    }

    @Override
    public QuestionBean getQuestionById(Long id) {
        Question question = questionRepository.getOne(id);
        QuestionBean questionBean = converter.convertToBean(question, QuestionBean.class);

        return questionBean;
    }

    @Override
    public void saveQuestion(QuestionBean question) {
        Question questionEntity = converter.convertToEntity(question, Question.class);
        questionRepository.save(questionEntity);
    }

    @Override
    public void deleteQuestion(Long id) {
        questionRepository.deleteById(id);
    }
}

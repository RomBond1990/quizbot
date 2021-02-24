package com.rbondarovich.impl;

import com.rbondarovich.beans.AnswerBean;
import com.rbondarovich.entity.Answer;
import com.rbondarovich.interfaces.AnswerService;
import com.rbondarovich.repository.AnswerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class AnswerServiceImpl implements AnswerService {

    private final EntityBeanConverterImpl converter;
    private final AnswerRepository answerRepository;

    @Override
    public Iterable<AnswerBean> getAllAnswers() {
        List<Answer> answers = answerRepository.findAll();
        List<AnswerBean> answerBeans = converter.convertToBeanList(answers, AnswerBean.class);
        return answerBeans;
    }

    @Override
    public AnswerBean getAnswerById(Long id) {
        Answer answer = answerRepository.getOne(id);
        AnswerBean answerBean = converter.convertToBean(answer, AnswerBean.class);
        return answerBean;
    }

    @Override
    public void saveAnswer(AnswerBean answer) {
        Answer answerEntity = converter.convertToEntity(answer, Answer.class);
        answerRepository.save(answerEntity);
    }

    @Override
    public void deleteAnswer(Long id) {
        answerRepository.deleteById(id);
    }
}

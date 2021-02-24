package com.rbondarovich.impl;

import com.rbondarovich.beans.ScoreBean;
import com.rbondarovich.entity.Score;
import com.rbondarovich.interfaces.ScoreService;
import com.rbondarovich.repository.ScoreRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class ScoreServiceImpl implements ScoreService {

    private final EntityBeanConverterImpl converter;
    private final ScoreRepository scoreRepository;

    @Override
    public Iterable<ScoreBean> getAllScores() {
        List<Score> scoreList = scoreRepository.findAll();
        List<ScoreBean> scoreBeans = converter.convertToBeanList(scoreList, ScoreBean.class);
        return scoreBeans;
    }

    @Override
    public ScoreBean getScoreById(Long id) {
        Score score = scoreRepository.getOne(id);
        ScoreBean scoreBean = converter.convertToBean(score, ScoreBean.class);
        return scoreBean;
    }

    @Override
    public void saveScore(ScoreBean score) {
        Score scoreEntity = converter.convertToEntity(score, Score.class);
        scoreRepository.save(scoreEntity);
    }

    @Override
    public void deleteScore(Long id) {
        scoreRepository.deleteById(id);
    }
}

package com.rbondarovich.interfaces;

import com.rbondarovich.beans.ScoreBean;

public interface ScoreService {

    Iterable<ScoreBean> getAllScores();

    ScoreBean getScoreById (Long id);

    void saveScore (ScoreBean score);

    void deleteScore (Long id);
}

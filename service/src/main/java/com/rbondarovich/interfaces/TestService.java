package com.rbondarovich.interfaces;

import com.rbondarovich.beans.TestBean;

public interface TestService {

    Iterable<TestBean> getAllTests();

    TestBean getTestById (Long id);

    void saveTest (TestBean test);

    void deleteTest (Long id);
}

package com.rbondarovich.impl;

import com.rbondarovich.beans.TestBean;
import com.rbondarovich.entity.Test;
import com.rbondarovich.interfaces.TestService;
import com.rbondarovich.repository.TestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class TestServiceImpl implements TestService {

    private final EntityBeanConverterImpl converter;
    private final TestRepository testRepository;

    @Override
    public Iterable<TestBean> getAllTests() {
        List<Test> tests = testRepository.findAll();
        List<TestBean> testBeans = converter.convertToBeanList(tests, TestBean.class);
        return testBeans;
    }

    @Override
    public TestBean getTestById(Long id) {
        Test test = testRepository.getOne(id);
        TestBean testBean = converter.convertToBean(test, TestBean.class);
        return testBean;
    }

    @Override
    public void saveTest(TestBean test) {
        Test testEntity = converter.convertToEntity(test, Test.class);
        testRepository.save(testEntity);
    }

    @Override
    public void deleteTest(Long id) {
        testRepository.deleteById(id);
    }
}

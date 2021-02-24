package com.rbondarovich.impl;

import com.rbondarovich.interfaces.EntityBeanConverter;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
@RequiredArgsConstructor
public class EntityBeanConverterImpl implements EntityBeanConverter {

    private final ModelMapper mapper;

    @Override
    public <E, B> B convertToBean(E entity, Class<B> beanClass) {
        return Objects.isNull(entity) ? null : mapper.map(entity, beanClass);
    }

    @Override
    public <E, B> List<B> convertToBeanList(Iterable<E> entities, Class<B> beanClass) {
        return  StreamSupport.stream(entities.spliterator(), false)
                .map(ent -> mapper.map(ent, beanClass))
                .collect(Collectors.toList());
    }

    @Override
    public <E, B> E convertToEntity(B bean, Class<E> entityClass) {
        return Objects.isNull(bean) ? null : mapper.map(bean, entityClass);
    }
}

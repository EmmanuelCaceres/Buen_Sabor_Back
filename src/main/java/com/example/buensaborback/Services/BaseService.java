package com.example.buensaborback.Services;

import com.example.buensaborback.domain.entities.ArticuloInsumo;
import jakarta.transaction.Transactional;
import org.mapstruct.Named;

import java.io.Serializable;
import java.util.List;

public interface BaseService <E>{
    public List<E> findAll() throws Exception;

    @Named("findById")
    public E findById(Long id) throws Exception;

    public E save(E entity) throws Exception;

    public E update(Long id, E entity) throws Exception;

    public boolean delete(Long id) throws Exception;

}

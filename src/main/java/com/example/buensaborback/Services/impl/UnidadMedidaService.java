package com.example.buensaborback.Services.impl;

import com.example.buensaborback.Services.BaseService;
import com.example.buensaborback.domain.entities.UnidadMedida;
import com.example.buensaborback.repositories.UnidadMedidaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UnidadMedidaService implements BaseService<UnidadMedida> {

    @Autowired
    public UnidadMedidaRepository unidadMedidaRepository;

    @Override
    public List<UnidadMedida> findAll() throws Exception {
        try {
            return unidadMedidaRepository.findAll();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public UnidadMedida findById(Long id) throws Exception {
        try {
            Optional<UnidadMedida> entityOptional = unidadMedidaRepository.findById(id);
            return entityOptional.orElse(null);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public UnidadMedida save(UnidadMedida entity) throws Exception {
        try {
            return unidadMedidaRepository.save(entity);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public UnidadMedida update(Long id, UnidadMedida entity) throws Exception {
        try {
            Optional<UnidadMedida> entityOptional = unidadMedidaRepository.findById(id);
            if (entityOptional.isPresent()) {
                UnidadMedida entityToUpdate = entityOptional.get();
                entityToUpdate.setDenominacion(entity.getDenominacion());
                // Actualiza otros campos según sea necesario
                return unidadMedidaRepository.save(entityToUpdate);
            } else {
                throw new Exception("Entity not found");
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public boolean delete(Long id) throws Exception {
        try {
            if (unidadMedidaRepository.existsById(id)) {
                unidadMedidaRepository.deleteById(id);
                return true;
            } else {
                throw new Exception("Entity not found");
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
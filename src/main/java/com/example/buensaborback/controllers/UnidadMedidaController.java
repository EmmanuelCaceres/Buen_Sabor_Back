package com.example.buensaborback.controllers;

import com.example.buensaborback.Services.impl.UnidadMedidaService;
import com.example.buensaborback.domain.entities.UnidadMedida;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(path = "unidadMedidas")
public class UnidadMedidaController {
    @Autowired
    private UnidadMedidaService unidadMedidaService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(unidadMedidaService.findAll());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"error\":\"Error por favor intente más tarde.\"}");
        }
    }

    @PostMapping("")
    public ResponseEntity<?> save(@RequestBody UnidadMedida entity) {
        try {
            UnidadMedida savedEntity = unidadMedidaService.save(entity);
            return ResponseEntity.status(HttpStatus.CREATED).body(savedEntity);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{\"error\":\"Error por favor intente más tarde.\"}");
        }
    }
}

package com.example.buensaborback.domain.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@ToString
@Builder
public class Pais extends Base{

    private String nombre;

    @OneToMany(mappedBy = "pais",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @Builder.Default
    @JsonBackReference
    private Set<Provincia> provincias = new HashSet<>();
}

package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RotaParagem {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long rota_id;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paragem_id;
    
    @Column(nullable = false)
    private Integer ordem;
    
    // Construtores, getters e setters
    public RotaParagem() {
        // Construtor padrão necessário para JPA
    }

    public RotaParagem(Long rota_id, Long paragem_id, Integer ordem) {
        this.rota_id = rota_id;
        this.paragem_id = paragem_id;
        this.ordem = ordem;
    }

    public Long getRota_id() {
        return rota_id;
    }

    public void setRota_id(Long rota_id) {
        this.rota_id = rota_id;
    }

    public Long getParagem_id() {
        return paragem_id;
    }

    public void setParagem_id(Long paragem_id) {
        this.paragem_id = paragem_id;
    }

    public Integer getOrdem() {
        return ordem;
    }

    public void setOrdem(Integer ordem) {
        this.ordem = ordem;
    }
}

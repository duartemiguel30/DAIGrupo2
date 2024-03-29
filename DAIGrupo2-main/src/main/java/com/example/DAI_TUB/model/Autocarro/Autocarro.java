package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Autocarro {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "autocarro_id")
    private Long autocarroId;
    
    @Column(nullable = false)
    private String matricula;
    
    @Column(nullable = false)
    private String modelo;
    
    @Column(nullable = false)
    private int capacidade;
    
    @Column(name = "motorista_id")
    private Long motoristaId;

    // Getters e setters
    
    public Long getAutocarroId() {
        return autocarroId;
    }

    public void setAutocarroId(Long autocarroId) {
        this.autocarroId = autocarroId;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    public Long getMotoristaId() {
        return motoristaId;
    }

    public void setMotoristaId(Long motoristaId) {
        this.motoristaId = motoristaId;
    }
}

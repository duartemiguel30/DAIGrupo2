package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Horario {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "horario_id")
    private Long horarioId;
    
    @Column(name = "rota_id", nullable = false)
    private Long rotaId;
    
    @Column(name = "paragem_id", nullable = false)
    private Long paragemId;
    
    @Column(nullable = false)
    private String hora;

    // Getters e setters
    
    public Long getHorarioId() {
        return horarioId;
    }

    public void setHorarioId(Long horarioId) {
        this.horarioId = horarioId;
    }

    public Long getRotaId() {
        return rotaId;
    }

    public void setRotaId(Long rotaId) {
        this.rotaId = rotaId;
    }

    public Long getParagemId() {
        return paragemId;
    }

    public void setParagemId(Long paragemId) {
        this.paragemId = paragemId;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
}

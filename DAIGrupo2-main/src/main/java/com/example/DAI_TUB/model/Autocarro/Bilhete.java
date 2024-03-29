package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.util.Date;

@Entity
public class Bilhete {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bilhete_id")
    private Long bilheteId;
    
    @Column(name = "passageiro_id", nullable = false)
    private Long passageiroId;
    
    @Column(name = "viagem_id", nullable = false)
    private Long viagemId;
    
    @Column(name = "data_compra", nullable = false)
    private Date dataCompra;
    
    @Column(nullable = false)
    private boolean confirmado;
    
    @Column(name = "user_id", nullable = false)
    private Long userId;

    // Getters e setters
    
    public Long getBilheteId() {
        return bilheteId;
    }

    public void setBilheteId(Long bilheteId) {
        this.bilheteId = bilheteId;
    }

    public Long getPassageiroId() {
        return passageiroId;
    }

    public void setPassageiroId(Long passageiroId) {
        this.passageiroId = passageiroId;
    }

    public Long getViagemId() {
        return viagemId;
    }

    public void setViagemId(Long viagemId) {
        this.viagemId = viagemId;
    }

    public Date getDataCompra() {
        return dataCompra;
    }

    public void setDataCompra(Date dataCompra) {
        this.dataCompra = dataCompra;
    }

    public boolean isConfirmado() {
        return confirmado;
    }

    public void setConfirmado(boolean confirmado) {
        this.confirmado = confirmado;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}

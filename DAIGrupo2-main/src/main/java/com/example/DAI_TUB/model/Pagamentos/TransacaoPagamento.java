package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

@Entity
public class TransacaoPagamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long transacao_id;

    @Column(nullable = false)
    private Long bilhete_id;

    @Column(nullable = false)
    private BigDecimal valor;

    @Column(nullable = false)
    private String metodo_pagamento;

    @Column(nullable = false)
    private String status;

    @Column(nullable = false)
    private Date data_hora;

    // Construtores, getters e setters
    public TransacaoPagamento() {
        // Construtor padrão necessário para JPA
    }

    public TransacaoPagamento(Long bilhete_id, BigDecimal valor, String metodo_pagamento, String status, Date data_hora) {
        this.bilhete_id = bilhete_id;
        this.valor = valor;
        this.metodo_pagamento = metodo_pagamento;
        this.status = status;
        this.data_hora = data_hora;
    }

    public Long getTransacao_id() {
        return transacao_id;
    }

    public void setTransacao_id(Long transacao_id) {
        this.transacao_id = transacao_id;
    }

    public Long getBilhete_id() {
        return bilhete_id;
    }

    public void setBilhete_id(Long bilhete_id) {
        this.bilhete_id = bilhete_id;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public String getMetodo_pagamento() {
        return metodo_pagamento;
    }

    public void setMetodo_pagamento(String metodo_pagamento) {
        this.metodo_pagamento = metodo_pagamento;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getData_hora() {
        return data_hora;
    }

    public void setData_hora(Date data_hora) {
        this.data_hora = data_hora;
    }
}

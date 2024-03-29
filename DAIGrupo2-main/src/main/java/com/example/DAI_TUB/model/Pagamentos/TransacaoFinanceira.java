package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

@Entity
public class TransacaoFinanceira {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long transacao_id;

    @Column(nullable = false)
    private Long user_id;

    @Column(nullable = false)
    private String tipo_transacao;

    @Column(nullable = false)
    private BigDecimal valor;

    @Column(nullable = false)
    private Date data_transacao;

    // Construtores, getters e setters
    public TransacaoFinanceira() {
        // Construtor padrão necessário para JPA
    }

    public TransacaoFinanceira(Long user_id, String tipo_transacao, BigDecimal valor, Date data_transacao) {
        this.user_id = user_id;
        this.tipo_transacao = tipo_transacao;
        this.valor = valor;
        this.data_transacao = data_transacao;
    }

    public Long getTransacao_id() {
        return transacao_id;
    }

    public void setTransacao_id(Long transacao_id) {
        this.transacao_id = transacao_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getTipo_transacao() {
        return tipo_transacao;
    }

    public void setTipo_transacao(String tipo_transacao) {
        this.tipo_transacao = tipo_transacao;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public Date getData_transacao() {
        return data_transacao;
    }

    public void setData_transacao(Date data_transacao) {
        this.data_transacao = data_transacao;
    }
}

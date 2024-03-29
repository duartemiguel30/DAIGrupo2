package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import java.util.Date;

@Entity
public class TicketSuporte {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_ticket;
    
    @Column(nullable = false)
    private Long user_id;
    
    @Column(nullable = false)
    private String assunto;
    
    @Column(nullable = false)
    private String descricao;
    
    @Column(nullable = false)
    private String estado;
    
    @Column(nullable = false)
    private Date data_submissao;
    
    // Outras colunas relacionadas ao ticket de suporte, se necessário
    
    // Construtores, getters e setters
    public TicketSuporte() {
        // Construtor padrão necessário para JPA
    }

    public TicketSuporte(Long user_id, String assunto, String descricao, String estado, Date data_submissao) {
        this.user_id = user_id;
        this.assunto = assunto;
        this.descricao = descricao;
        this.estado = estado;
        this.data_submissao = data_submissao;
    }

    public Long getId_ticket() {
        return id_ticket;
    }

    public void setId_ticket(Long id_ticket) {
        this.id_ticket = id_ticket;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getData_submissao() {
        return data_submissao;
    }

    public void setData_submissao(Date data_submissao) {
        this.data_submissao = data_submissao;
    }
}

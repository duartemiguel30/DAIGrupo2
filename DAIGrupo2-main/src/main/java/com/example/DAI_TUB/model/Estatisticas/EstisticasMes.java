package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EstatisticasMes {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long estatisticas_id;
    
    @Column(nullable = false)
    private Long user_id;
    
    @Column(nullable = false)
    private int mes;
    
    @Column(nullable = false)
    private int ano;
    
    @Column(nullable = false)
    private double total_gasto;
    
    @Column(nullable = false)
    private int numero_viagens;
    
    // Construtores, getters e setters
    public EstatisticasMes() {
        // Construtor padrão necessário para JPA
    }

    public EstatisticasMes(Long user_id, int mes, int ano, double total_gasto, int numero_viagens) {
        this.user_id = user_id;
        this.mes = mes;
        this.ano = ano;
        this.total_gasto = total_gasto;
        this.numero_viagens = numero_viagens;
    }

    public Long getEstatisticas_id() {
        return estatisticas_id;
    }

    public void setEstatisticas_id(Long estatisticas_id) {
        this.estatisticas_id = estatisticas_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public double getTotal_gasto() {
        return total_gasto;
    }

    public void setTotal_gasto(double total_gasto) {
        this.total_gasto = total_gasto;
    }

    public int getNumero_viagens() {
        return numero_viagens;
    }

    public void setNumero_viagens(int numero_viagens) {
        this.numero_viagens = numero_viagens;
    }
}

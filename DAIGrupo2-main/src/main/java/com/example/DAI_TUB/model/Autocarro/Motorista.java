package com.example.application.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Motorista {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long motorista_id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String senha;

    @Column(nullable = false)
    private double salario;

    // Construtores, getters e setters
    public Motorista() {
        // Construtor padrão necessário para JPA
    }

    public Motorista(String nome, String email, String senha, double salario) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.salario = salario;
    }

    public Long getMotorista_id() {
        return motorista_id;
    }

    public void setMotorista_id(Long motorista_id) {
        this.motorista_id = motorista_id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }
}

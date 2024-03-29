import javax.persistence.*;

@Entity
public class PontosUtilizador {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Utilizador utilizador;
    
    @Column
    private int pontos;
    
    // Construtores, getters e setters
    public PontosUtilizador() {
        // Construtor padrão necessário para JPA
    }

    public PontosUtilizador(Utilizador utilizador, int pontos) {
        this.utilizador = utilizador;
        this.pontos = pontos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Utilizador getUtilizador() {
        return utilizador;
    }

    public void setUtilizador(Utilizador utilizador) {
        this.utilizador = utilizador;
    }

    public int getPontos() {
        return pontos;
    }

    public void setPontos(int pontos) {
        this.pontos = pontos;
    }
}

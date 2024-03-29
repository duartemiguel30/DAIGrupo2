import javax.persistence.*;

@Entity
public class Recompensa {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String descricao;
    
    @Column(name = "pontos_necessarios", nullable = false)
    private int pontosNecessarios;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Utilizador utilizador;
    
    // Construtores, getters e setters
    public Recompensa() {
        // Construtor padrão necessário para JPA
    }

    public Recompensa(String descricao, int pontosNecessarios, Utilizador utilizador) {
        this.descricao = descricao;
        this.pontosNecessarios = pontosNecessarios;
        this.utilizador = utilizador;
    }

    // Getters e setters
    // Implementação dos métodos getters e setters
}

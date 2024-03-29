import javax.persistence.*;

@Entity
public class InformacaoPagamento {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Utilizador utilizador;
    
    @Column(name = "nome_titular")
    private String nomeTitular;
    
    @Column(name = "numero_cartao")
    private String numeroCartao;
    
    @Column(name = "data_expiracao")
    private String dataExpiracao;
    
    private String cvv;
    
    // Construtores, getters e setters
    public InformacaoPagamento() {
        // Construtor padrão necessário para JPA
    }

    public InformacaoPagamento(Utilizador utilizador, String nomeTitular, String numeroCartao, String dataExpiracao, String cvv) {
        this.utilizador = utilizador;
        this.nomeTitular = nomeTitular;
        this.numeroCartao = numeroCartao;
        this.dataExpiracao = dataExpiracao;
        this.cvv = cvv;
    }

    // Getters e setters
    // Implementação dos métodos getters e setters
}

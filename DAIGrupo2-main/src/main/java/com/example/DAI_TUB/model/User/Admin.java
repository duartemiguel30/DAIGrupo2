import javax.persistence.*;

@Entity
@Table(name = "Administrador")
public class Administrador {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_id")
    private Long id;

    @Column(name = "senha_admin")
    private String senhaAdmin;

    // Construtores, getters e setters
    public Administrador() {}

    public Administrador(String senhaAdmin) {
        this.senhaAdmin = senhaAdmin;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSenhaAdmin() {
        return senhaAdmin;
    }

    public void setSenhaAdmin(String senhaAdmin) {
        this.senhaAdmin = senhaAdmin;
    }
}

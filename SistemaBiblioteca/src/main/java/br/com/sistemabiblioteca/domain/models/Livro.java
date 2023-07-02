package br.com.sistemabiblioteca.domain.models;

import br.com.sistemabiblioteca.domain.enums.LivroStatus;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.Objects;

@Entity
public class Livro {

    public Livro() {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nome;
    private String autor;
    private String categoria;
    private String sinopse;
    private String paginas;
    private String editora;
    private LocalDate date;
    @Enumerated(EnumType.STRING)
    private LivroStatus status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }
    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.autor = categoria;
    }
    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }
    public String getPaginas() {
        return paginas;
    }

    public void setPaginas(String paginas) {
        this.paginas = paginas;
    }
    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LivroStatus getStatus() {
        return status;
    }

    public void setStatus(LivroStatus status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Livro livro = (Livro) o;
        return Objects.equals(id, livro.id) && Objects.equals(nome, livro.nome)
                && Objects.equals(autor, livro.autor)
                && Objects.equals(categoria, livro.categoria)
                && Objects.equals(sinopse, livro.sinopse)
                && Objects.equals(paginas, livro.paginas)
                && Objects.equals(editora, livro.editora)
                && Objects.equals(date, livro.date)
                && status == livro.status;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nome, autor, categoria,
                sinopse, paginas, editora, date, status);
    }

    @Override
    public String toString() {
        return "Livro{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", autor='" + autor + '\'' +
                ", categoria='" + categoria + '\'' +
                ", sinopse='" + sinopse + '\'' +
                ", paginas='" + paginas + '\'' +
                ", editora='" + editora + '\'' +
                ", date=" + date +
                ", status=" + status +
                '}';
    }
}

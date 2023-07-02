package br.com.sistemabiblioteca.repositories;

import br.com.sistemabiblioteca.connection.ConnectionFactory;
import br.com.sistemabiblioteca.domain.models.Livro;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class LivroRepository {
    EntityManager entityManager;
    private EntityTransaction transaction;

    LivroRepository livroRepository;
    public LivroRepository(){
        entityManager = ConnectionFactory.getConnection();
        transaction = entityManager.getTransaction();
    }

    public Livro create(Livro livro){
        entityManager.getTransaction().begin();
        entityManager.persist(livro);
        entityManager.getTransaction().commit();

        return livro;
    }

    public List<Livro> findAll() {
        return entityManager.createQuery("SELECT b FROM Livro b", Livro.class).getResultList();
    }

    public Livro update(Livro livro) {
        entityManager.getTransaction().begin();
        livro = entityManager.merge(livro);
        entityManager.getTransaction().commit();

        return livro;
    }

    public Livro findById(int id) {
        Livro livro =  entityManager.find(Livro.class, id);
        return livro;

    }

    public void remove(Livro livro) {

        if (livro == null) {
            throw new RuntimeException("Livro não pode ser nulo");
        }

        transaction.begin();

        livro = entityManager.find(Livro.class, livro.getId());

        entityManager.remove(livro);

        transaction.commit();
    }

    public void removeById(Integer id){

        transaction.begin();

        Livro livro = entityManager.find(Livro.class, id);

        if (livro == null) {
            throw new IllegalArgumentException("Não foi possível encontrar o livro com o ID: " + id);
        }

        entityManager.remove(livro);

        transaction.commit();
    }

}

package br.com.sistemabiblioteca.services;

import br.com.sistemabiblioteca.domain.enums.LivroStatus;
import br.com.sistemabiblioteca.domain.models.Livro;
import br.com.sistemabiblioteca.repositories.LivroRepository;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class LivroService {
    private LivroRepository livroRepository;
    public LivroService(){
        livroRepository = new LivroRepository();
    }

    public Livro create(String nome, String autor, String categoria, String sinopse, String paginas, String editora, String data){


        if(nome.isEmpty()){
            throw new IllegalArgumentException("Nome não pode ser vazio");
        }

        if(autor.isEmpty()){
            throw new IllegalArgumentException("Autor não pode ser vazio");
        }

        Livro livro = new Livro();
        livro.setNome(nome);
        livro.setAutor(autor);
        livro.setAutor(categoria);
        livro.setSinopse(sinopse);
        livro.setPaginas(paginas);
        livro.setEditora(editora);
        livro.setStatus(LivroStatus.DISPONIVEL);
        livro.setDate(LocalDate.parse(data, DateTimeFormatter.ofPattern("dd/MM/yyyy")));

        livroRepository.create(livro);

        return livro;
    }

    public List<Livro> findAll(){
        return livroRepository.findAll();
    }

    public Livro findById(int id) {return livroRepository.findById(id);}

    public Livro remove(int id){
        Livro livro = livroRepository.findById(id);

        if (livro == null) {
            throw new IllegalArgumentException("Livro inválido");
        }

        livroRepository.remove(livro);

        return livro;
    }

    public void update(Livro updatedLivro) {
        String id = String.valueOf(updatedLivro.getId());
        String nome = updatedLivro.getNome();
        String autor = updatedLivro.getAutor();
        String categoria = updatedLivro.getCategoria();
        String sinopse = updatedLivro.getSinopse();
        String paginas = updatedLivro.getPaginas();
        String editora = updatedLivro.getEditora();
        String status = String.valueOf(updatedLivro.getStatus());
        String date = updatedLivro.getDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));

        if (id.isEmpty()) {
            throw new IllegalArgumentException("ID não pode ser vazio");
        }

        if (nome.isEmpty()) {
            throw new IllegalArgumentException("Nome não pode ser vazio");
        }

        if (autor.isEmpty()) {
            throw new IllegalArgumentException("Autor não pode ser vazio");
        }

        Livro livro = livroRepository.findById(Integer.parseInt(id));
        if (livro == null) {
            throw new IllegalArgumentException("Livro não encontrado");
        }

        livro.setNome(nome);
        livro.setAutor(autor);
        livro.setCategoria(categoria);
        livro.setSinopse(sinopse);
        livro.setPaginas(paginas);
        livro.setEditora(editora);
        livro.setDate(LocalDate.parse(date, DateTimeFormatter.ofPattern("dd-MM-yyyy")));
        livro.setStatus(LivroStatus.valueOf(status));

        livroRepository.update(livro);
    }

}

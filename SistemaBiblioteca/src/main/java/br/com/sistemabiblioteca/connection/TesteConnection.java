package br.com.sistemabiblioteca.connection;

import br.com.sistemabiblioteca.domain.models.User;
import br.com.sistemabiblioteca.repositories.UserRepository;

import java.util.List;

public class TesteConnection {


    public static void main(String[] args) {
        UserRepository repository = new UserRepository();

        List<User> all = repository.findAll();

        System.out.println(all);
    }




}

package br.com.sistemabiblioteca.services;

import br.com.sistemabiblioteca.domain.enums.UserType;
import br.com.sistemabiblioteca.domain.models.User;
import br.com.sistemabiblioteca.repositories.UserRepository;

import java.util.List;


public class UserService {
    private final UserRepository userRepository;
    public UserService() {
        userRepository = new UserRepository();
    }

    public User create(String name, String email, String password) {
        if(name.isEmpty()){
            throw new IllegalArgumentException("Nome não pode ser vazio");
        }

        if(email.isEmpty()){
            throw new IllegalArgumentException("Email não pode ser vazio");
        }

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setType(UserType.USUARIO);
        user.setPassword(password);

        userRepository.create(user);

        return user;
    }

    public List<User> findAll(){
        return userRepository.findAll();
    }

    public User findById(int id) {return userRepository.findById(id);}

    public User remove(int id){
        User user = userRepository.findById(id);

        if (user == null) {
            throw new IllegalArgumentException("Usuário inválido");
        }

        userRepository.remove(user);

        return user;
    }

    public void update(User updatedUser) {
        String id = String.valueOf(updatedUser.getId());
        String name = updatedUser.getName();
        String email = updatedUser.getEmail();
        String type = String.valueOf(updatedUser.getType());


        if (id.isEmpty()) {
            throw new IllegalArgumentException("ID não pode ser NULO");
        }

        if (name.isEmpty()) {
            throw new IllegalArgumentException("Nome não pode ser NULO");
        }

        if (email.isEmpty()) {
            throw new IllegalArgumentException("Email não pode ser NULO");
        }

        User user = userRepository.findById(Integer.parseInt(id));
        if (user == null) {
            throw new IllegalArgumentException("UsuÁrio não encontrado");
        }

        user.setName(name);
        user.setEmail(email);
        user.setType(UserType.valueOf(type));
        userRepository.update(user);
    }

}

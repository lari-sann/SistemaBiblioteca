package br.com.sistemabiblioteca.services;

import br.com.sistemabiblioteca.domain.models.User;
import br.com.sistemabiblioteca.repositories.UserRepository;
import jakarta.persistence.NoResultException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class LoginService {

    UserRepository userRepository = new UserRepository();

    public void validateLogin(String user, String password, HttpServletRequest request) throws Exception {

        if(user == null || user.isEmpty() || password == null || password.isEmpty()) {
            throw new Exception("Você precisa preencher os campos!");
        }

        try {

            User u = userRepository.findByUser(user);

            if (user.equals(u.getName()) && password.equals(u.getPassword())){
                System.out.println("TESTE USUÁRIO");
                HttpSession session = request.getSession();
                session.setAttribute("is_logged_in", true);
                session.setAttribute("user", u);
            } else {
                throw new Exception("Usuário ou senha incorreto");
            }

        } catch (NoResultException e){
            throw new NoResultException("Usuário não cadastrado no sistema!");
        }
    }
}

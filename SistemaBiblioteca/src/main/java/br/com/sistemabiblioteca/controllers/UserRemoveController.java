package br.com.sistemabiblioteca.controllers;

import br.com.sistemabiblioteca.repositories.UserRepository;
import br.com.sistemabiblioteca.services.UserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserRemoveController", value = {"/UserRemoveController"})
public class UserRemoveController extends HttpServlet {

    UserService userService;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    UserRepository userRepository = new UserRepository();

    String id = request.getParameter("id");

    userRepository.removeById(Integer.parseInt(id));
    response.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/LivroListController");
    }
}

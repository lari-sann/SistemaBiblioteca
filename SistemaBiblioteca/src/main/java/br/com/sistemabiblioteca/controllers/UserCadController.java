package br.com.sistemabiblioteca.controllers;

import java.io.*;

import br.com.sistemabiblioteca.domain.models.User;
import br.com.sistemabiblioteca.services.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UserCadController", value = {"/UserCadController"})
public class UserCadController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("user-cadastro.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserService userService = new UserService();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userService.create(name, email, password);

        System.out.println("usuário: " + user);

        response.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/LivroListController");
    }


}

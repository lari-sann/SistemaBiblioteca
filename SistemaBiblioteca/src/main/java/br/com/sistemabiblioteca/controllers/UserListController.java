package br.com.sistemabiblioteca.controllers;

import br.com.sistemabiblioteca.domain.models.User;
import br.com.sistemabiblioteca.services.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "UserListController", value = {"/UserListController"})
public class UserListController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        UserService userService = new UserService();
        List<User> users = userService.findAll();

        String filtroNome = request.getParameter("filtro-nome");
        //List<User> users = userService.getClass();

        if (filtroNome != null && !filtroNome.isEmpty()) {
            users = users.stream()
                    .filter(u -> u.getName().contains(filtroNome))
                    .collect(Collectors.toList());
        }

        request.setAttribute("attr_users", users);

        RequestDispatcher dispatcher = request.getRequestDispatcher("user-listar.jsp");

        dispatcher.forward(request, response);


    }

}
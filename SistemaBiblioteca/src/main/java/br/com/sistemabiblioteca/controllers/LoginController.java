package br.com.sistemabiblioteca.controllers;

import br.com.sistemabiblioteca.services.LoginService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "login", value = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String user = req.getParameter("field_user");
        String password = req.getParameter("field_password");
        LoginService loginService = new LoginService();

        try {

            loginService.validateLogin(user, password, req);
            resp.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/LivroListController");

        } catch (Exception e) {
            String msg = e.getMessage();
            resp.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/index.jsp?msg=" + msg);
        }
    }
}

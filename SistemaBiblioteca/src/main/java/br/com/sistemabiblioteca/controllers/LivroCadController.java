package br.com.sistemabiblioteca.controllers;

import java.io.*;

import br.com.sistemabiblioteca.domain.models.Livro;
import br.com.sistemabiblioteca.services.LivroService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "LivroCadController", value = {"/LivroCadController"})
public class LivroCadController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        RequestDispatcher dispatcher = request.getRequestDispatcher("livro-cadastro.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        LivroService livroService = new LivroService();

        String nome = request.getParameter("nome");
        String autor = request.getParameter("autor");
        String categoria = request.getParameter("categoria");
        String sinopse = request.getParameter("sinopse");
        String paginas = request.getParameter("paginas");
        String editora = request.getParameter("editora");
        String date = request.getParameter("date");

        Livro livro = livroService.create(nome, autor, categoria, sinopse, paginas, editora, date);

        response.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/LivroListController");
    }


}
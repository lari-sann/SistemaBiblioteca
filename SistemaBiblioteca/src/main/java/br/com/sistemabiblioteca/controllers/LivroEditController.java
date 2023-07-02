package br.com.sistemabiblioteca.controllers;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import br.com.sistemabiblioteca.domain.enums.LivroStatus;
import br.com.sistemabiblioteca.domain.models.Livro;
import br.com.sistemabiblioteca.services.LivroService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LivroEditController", value = {"/LivroEditController"})
public class LivroEditController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        LivroService b = new LivroService();
        Livro livro = b.findById(Integer.parseInt(id));
        request.setAttribute("livro", livro);
        RequestDispatcher dispatcher = request.getRequestDispatcher("livro-editar.jsp");
        dispatcher.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException,IOException {
        LivroService livroService = new LivroService();

        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String autor = request.getParameter("autor");
        String categoria = request.getParameter("categoria");
        String sinopse = request.getParameter("sinopse");
        String paginas = request.getParameter("paginas");
        String editora = request.getParameter("editora");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        Livro livro = livroService.findById(Integer.parseInt(id));
        livro.setNome(nome);
        livro.setAutor(autor);
        livro.setCategoria(categoria);
        livro.setSinopse(sinopse);
        livro.setPaginas(paginas);
        livro.setEditora(editora);
        livro.setDate(LocalDate.parse(date, DateTimeFormatter.ofPattern("dd/MM/yyyy")));
        livro.setStatus(LivroStatus.valueOf(status));
        livroService.update(livro);
        response.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/LivroListController");

    }
}



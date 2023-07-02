package br.com.sistemabiblioteca.controllers;

import br.com.sistemabiblioteca.domain.enums.LivroStatus;
import br.com.sistemabiblioteca.domain.models.Livro;
import br.com.sistemabiblioteca.services.LivroService;
import br.com.sistemabiblioteca.repositories.LivroRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LivroRemoveController", value = {"/LivroRemoveController"})
public class LivroRemoveController extends HttpServlet {

    LivroService livroService;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        LivroRepository livroRepository = new LivroRepository();

        String id = request.getParameter("id");

        Livro livro = livroRepository.findById(Integer.parseInt(id));

        if(livro.getStatus().equals(LivroStatus.INDISPONIVEL)) {

            livroRepository.removeById(Integer.parseInt(id));

            response.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/LivroListController");
        } else {
            response.sendRedirect("http://localhost:8080/SistemaBiblioteca_war/LivroListController");

        }

    }
}

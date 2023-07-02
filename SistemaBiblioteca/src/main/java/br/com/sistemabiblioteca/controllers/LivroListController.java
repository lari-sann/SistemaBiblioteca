package br.com.sistemabiblioteca.controllers;


import br.com.sistemabiblioteca.domain.models.Livro;
import br.com.sistemabiblioteca.services.LivroService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "LivroListController", value = {"/LivroListController"})
public class LivroListController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        LivroService livroService = new LivroService();
        List<Livro> livros = livroService.findAll();

        String filtroLivro = request.getParameter("filtro-livro");

        if (filtroLivro != null && !filtroLivro.isEmpty()) {
            livros = livros.stream()
                    .filter(b -> b.getNome().contains(filtroLivro))
                    .collect(Collectors.toList());
        }

        request.setAttribute("attr_livros", livros);

        RequestDispatcher dispatcher = request.getRequestDispatcher("livro-listar.jsp");

        dispatcher.forward(request, response);

    }

}
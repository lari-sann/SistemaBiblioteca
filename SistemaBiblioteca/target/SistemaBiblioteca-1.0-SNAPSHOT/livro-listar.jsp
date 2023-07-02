<%@ page import="br.com.sistemabiblioteca.domain.models.Livro" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="br.com.sistemabiblioteca.domain.models.User" %>
<%@ page import="static br.com.sistemabiblioteca.domain.enums.UserType.ADMINISTRADOR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Livro> livros = (List<Livro>) request.getAttribute("attr_livros");
    User user = (User) session.getAttribute("user");
%>

<html>
<head>
    <title>Sistema de Biblioteca</title>
    <style>
        body {
            background-color: #FDDCDC;
            font-family: "Comic Sans MS", cursive;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #FFF9F9;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .title {
            font-size: 32px;
            color: #FF0066;
            margin-bottom: 5px;
        }

        .subtitle {
            font-size: 20px;
            color: #333333;
            margin-bottom: 10px;
        }

        .filter-form {
            margin-bottom: 20px;
        }

        .filter-form label {
            font-weight: bold;
            margin-right: 10px;
        }

        .filter-form input[type="text"] {
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .filter-form input[type="submit"] {
            padding: 5px 10px;
            background-color: #FF0066;
            border: none;
            color: #fff;
            border-radius: 4px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease-in-out;
        }

        .filter-form input[type="submit"]:hover {
            background-color: #CC0044;
        }

        .options {
            margin-bottom: 20px;
        }

        .options-button {
            display: inline-block;
            margin-right: 10px;
            margin-bottom: 10px;
        }

        .options-button a {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            padding: 10px 20px;
            background-color: #FF0066;
            border: none;
            border-radius: 30px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease-in-out;
        }

        .options-button a:hover {
            background-color: #CC0044;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #F2F2F2;
        }

        .edit-button, .delete-button {
            display: inline-block;
            padding: 5px 10px;
            background-color: #FF0066;
            border: none;
            color: #fff;
            border-radius: 30px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease-in-out;
        }

        .edit-button:hover, .delete-button:hover {
            background-color: #CC0044;
        }
    </style>
</head>
<body>
<div class="container">
    <button class="options-button">
        <a href="/SistemaBiblioteca_war/">Sair</a>
    </button>
    <div class="header">
        <h1 class="title">Controle de Livros</h1>
        <h2 class="subtitle">Um leitor vive mil vidas antes de morrer. O homem que nunca lê vive apenas uma</h2>
    </div>

    <form class="filter-form" method="GET" action="LivroListController">
        <label for="filtro-livro">Buscar livro:</label>
        <input type="text" id="filtro-livro" name="filtro-livro" placeholder="Informe o nome do livro">
        <input type="submit" value="Buscar">
    </form>

    <div class="options">
        <button class="options-button">
            <a href="/SistemaBiblioteca_war/LivroCadController">Novo Livro</a>
        </button>

        <button class="options-button">
            <a href="/SistemaBiblioteca_war/UserListController">Usuários</a>
        </button>

        <button class="options-button">
            <a href="LivroListController">Início</a>
        </button>
    </div>

    <table>
        <tr>
            <th>#Id</th>
            <th>Nome</th>
            <th>Autor</th>
            <th>Categoria</th>
            <th>Sinopse</th>
            <th>Páginas</th>
            <th>Editora</th>
            <th>Data</th>
            <th>Status</th>
            <%if (user.getType().equals(ADMINISTRADOR)){%>
            <th>Opções</th>
            <%}%>
        </tr>
        <% for(Livro b: livros){ %>
        <tr>
            <td><%= b.getId() %></td>
            <td><%= b.getNome() %></td>
            <td><%= b.getAutor() %></td>
            <td><%= b.getCategoria() %></td>
            <td><%= b.getSinopse() %></td>
            <td><%= b.getPaginas() %></td>
            <td><%= b.getEditora() %></td>
            <td><%= b.getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></td>
            <td><%= b.getStatus() %></td>
            <td>
                <button class="edit-button">
                    <%if (user.getType().equals(ADMINISTRADOR)){%>
                    <a href="LivroEditController?id=<%= b.getId() %>" method="get">Editar</a>
                </button>
                <%}%>
            </td>
            <td>
                <button class="delete-button">
                    <%if (user.getType().equals(ADMINISTRADOR)){%>
                    <a href="LivroRemoveController?id=<%= b.getId()%>">Excluir</a>
                </button>
                <%}%>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>

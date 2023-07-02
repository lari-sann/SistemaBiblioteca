<%@ page import="br.com.sistemabiblioteca.domain.models.Livro" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: laris
  Date: 30/06/2023
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Livro livro = (Livro) request.getAttribute("livro");
%>
<html>
<head>
    <title>Editar</title>
    <style>
        body {
            font-family: "Comic Sans MS", cursive;
            background-color: #FFE6ED;
        }

        form {
            width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: #FFF9FA;
            border: 1px solid #FFB7C5;
            border-radius: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #FFB7C5;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #FF6699;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #FF4D80;
        }

        ::placeholder {
            color: #FFA7C2;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #FFB7C5;
            border-radius: 4px;
            background-color: #FFF9FA;
        }

        button {
            padding: 10px 20px;
            background-color: #FF6699;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #FF4D80;
        }
    </style>
</head>
<body>
<form method="post" action="LivroEditController?id=<%= livro.getId() %>">

    <input type="text" name="id" value="<%= livro.getId() %>"/>
    <input type="text" name="nome" value="<%= livro.getNome() %>"/>
    <input type="text" name="autor" value="<%= livro.getAutor() %>"/>
    <input type="text" name="categoria" value="<%= livro.getCategoria() %>"/>
    <input type="text" name="sinopse" value="<%= livro.getSinopse() %>"/>
    <input type="text" name="paginas" value="<%= livro.getPaginas() %>"/>
    <input type="text" name="editora" value="<%= livro.getEditora() %>"/>
    <input type="text" name="date" value="<%= livro.getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %>"/>
    <select name="status">
        <option value="DISPONIVEL" <%= livro.getStatus().equals("DISPONIVEL") ? "selected" : "" %>>Disponível</option>
        <option value="INDISPONIVEL" <%= livro.getStatus().equals("INDISPONIVEL") ? "selected" : "" %>>Indisponível</option>
        <option value="EMPRESTADO" <%= livro.getStatus().equals("EMPRESTADO") ? "selected" : "" %>>Emprestado</option>
    </select>
    <button> Salvar </button>
</form>

</body>
</html>

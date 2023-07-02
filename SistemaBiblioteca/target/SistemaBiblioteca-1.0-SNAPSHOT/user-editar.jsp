<%@ page import="br.com.sistemabiblioteca.domain.models.User" %><%--
<%--
  Created by IntelliJ IDEA.
  User: laris
  Date: 29/06/2023
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) request.getAttribute("user");
%>

<html>
<head>
    <title>Editar</title>
    <style>
        body {
            font-family: "Comic Sans MS", cursive;
            background-color: #FFE6F2;
        }

        form {
            width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: #FFF1F8;
            border: 1px solid #FFCCE5;
            border-radius: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #FFCCE5;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #FF66B2;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #FF4D8C;
        }

        ::placeholder {
            color: #FFB6D8;
        }
    </style>
</head>
<body>
<form method="post" action="UserEditController">

    <input type="text" name="id" value="<%= user.getId() %>"/>
    <input type="text" name="name" value="<%= user.getName() %>"/>
    <input type="text" name="email" value="<%= user.getEmail() %>"/>
    <select  name="type">
        <option value="ADMINISTRADOR" <%= user.getType().equals("ADMINISTRADOR") ? "selected" : "" %>>ADMINISTRADOR</option>
        <option value="USUARIO" <%= user.getType().equals("USUARIO") ? "selected" : "" %>>USUARIO</option>
    </select>
    <button> Salvar </button>
</form>

</body>
</html>

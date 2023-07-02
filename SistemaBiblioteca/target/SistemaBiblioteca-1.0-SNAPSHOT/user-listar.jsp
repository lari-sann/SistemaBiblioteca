<%@ page import="br.com.sistemabiblioteca.domain.models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.sistemabiblioteca.domain.enums.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<User> users = (List<User>) request.getAttribute("attr_users");
    User user = (User) session.getAttribute("user");
%>

<html>
<head>
    <title>Usuários</title>
    <style>
        body {
            font-family: "Arial", sans-serif;
            background-color: #FBEFF7;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #F3D0E9;
        }

        tr:nth-child(even) {
            background-color: #FFF5FA;
        }

        button {
            margin: 10px 0;
        }

        button a {
            text-decoration: none;
            color: #fff;
            padding: 5px 10px;
            background-color: #FF66B2;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out;
        }

        button a:hover {
            background-color: #FF4D8C;
        }

        input[type="text"] {
            padding: 5px;
            border: 1px solid #FFCCE5;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #FF66B2;
            border: none;
            color: #fff;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #FF4D8C;
        }
    </style>
</head>
<body>

<form method="GET" action="UserListController">
    <label for="filtro-nome"></label>
    <input type="text" id="filtro-nome" name="filtro-nome" placeholder="Informe um nome">
    <input type="submit" value="Buscar">
</form>


<button>
    <a href="UserCadController" >Novo</a>
</button>

<button>
    <a href="LivroListController" >Início</a>
</button>

<table>
    <tr>
        <td>#Id</td>
        <td>Nome</td>
        <td>Email</td>
        <td>Tipo</td>
        <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
        <td>Opções</td>
        <%}%>

    </tr>
    <% for(User u: users){ %>

    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getType() %></td>

        <td>
            <button>
                <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
                <a href="UserEditController?id=<%= u.getId()%>" >Editar</a>
            </button>
            <%}%>
        </td>

        <td>
            <button>
                <%if (user.getType().equals(UserType.ADMINISTRADOR)){%>
                <a href="UserRemoveController?id=<%= u.getId()%>" >Excluir</a>
            </button>
            <%}%>
        </td>
    </tr>

    <% } %>

</table>

</body>
</html>

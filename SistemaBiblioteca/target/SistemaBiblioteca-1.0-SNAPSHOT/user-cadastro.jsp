<%--
  Created by IntelliJ IDEA.
  User: laris
  Date: 29/06/2023
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>cadastro-user</title>
    <style>
        body {
            font-family: "Comic Sans MS", cursive;
            background-color: #F7F7F7;
        }

        form {
            width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: #FFF6FB;
            border: 1px solid #FFD8E9;
            border-radius: 8px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #FFD8E9;
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
<form method="post" action="UserCadController">
    <input type="text" name="name" placeholder="Nome"/>
    <input type="text" name="email" placeholder="Email"/>
    <input type="password" name="password" placeholder="Password"/>
    <input type="submit">
</form>
</body>
</html>

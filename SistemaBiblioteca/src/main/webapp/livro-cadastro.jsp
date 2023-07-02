<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro</title>
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
    </style>
</head>
<body>
<form method="post" action="LivroCadController">
    <input type="text" name="nome" placeholder="Nome"/>
    <input type="text" name="autor" placeholder="Autor"/>
    <input type="text" name="categoria" placeholder="Categoria"/>
    <input type="text" name="sinopse" placeholder="Sinopse"/>
    <input type="text" name="paginas" placeholder="Paginas"/>
    <input type="text" name="editora" placeholder="Editora"/>
    <input type="text" name="date" placeholder="Data"/>
    <input type="submit" value="Salvar">
</form>
</body>
</html>

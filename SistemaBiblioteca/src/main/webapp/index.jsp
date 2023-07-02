<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    String msg = request.getParameter("msg");
    if(msg == null){
        msg = "";
    }

%>

<%--
usuário administrador: admin
senha: admin

usuário: user
senha: user
--%>


<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    <style>
        body {
            font-family: "Comic Sans MS", cursive;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('https://i.pinimg.com/564x/d6/20/fc/d620fcf69f101ae30e67d31aa10810b2.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .card {
            border-radius: 1rem;
            background-color: #fff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 2rem;
        }

        .form-outline {
            position: relative;
            margin-bottom: 2rem;
        }

        .form-outline input {
            width: 100%;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border: none;
            border-bottom: 2px solid #ccc;
            background-color: transparent;
            transition: border-color 0.3s ease;
        }

        .form-outline input:focus {
            outline: none;
            border-bottom-color: #FF80AB;
        }

        .form-outline label {
            position: absolute;
            top: 0.75rem;
            left: 1rem;
            font-size: 1rem;
            color: #888;
            pointer-events: none;
            transition: top 0.3s, font-size 0.3s;
        }

        .form-outline input:focus ~ label,
        .form-outline input:valid ~ label {
            top: -1rem;
            font-size: 0.8rem;
            color: #FF80AB;
        }

        .btn-outline-light {
            width: 100%;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border: 2px solid #FF80AB;
            border-radius: 30px;
            background-color: transparent;
            color: #FF80AB;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-outline-light:hover {
            background-color: #FF80AB;
            color: #fff;
        }
    </style>
</head>
<body>
<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card">
                    <div class="card-body p-5 text-center">

                        <div class="mb-md-5 mt-md-4 pb-5">

                            <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                            <form action="login" method="post">

                                <%--USUÁRIO--%>
                                <div class="form-outline form-white mb-8">
                                    <input type="text" name="field_user" id="typeTextX" class="form-control form-control-lg" />
                                    <label class="form-label" for="typeTextX">Login</label>
                                </div>
                                <br>
                                <%--SENHA--%>
                                <div class="form-outline form-white mb-8">
                                    <input type="password" name="field_password" id="typePasswordX" class="form-control form-control-lg" />
                                    <label class="form-label" for="typePasswordX">Senha</label>
                                </div>

                                <button class="btn btn-outline-light btn-lg px-5 d-flex justify-content-center align-items-center h-100" type="submit">Entrar</button>
                                <p><%= msg %></p>
                            </form>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>

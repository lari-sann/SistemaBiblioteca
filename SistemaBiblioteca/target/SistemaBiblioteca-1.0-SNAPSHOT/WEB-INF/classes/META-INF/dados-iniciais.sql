INSERT INTO user (email, name, password, type) VALUES ('admin@ifpr.edu.br', 'admin', 'admin', 'ADMINISTRADOR');
INSERT INTO user (email, name, password, type) VALUES ('user@gmail.com', 'user', 'user', 'USUARIO');

INSERT INTO books (nome, autor, categoria, sinopse, paginas, editora, data, status) VALUES ('Orgulho e Preconceito', 'Jane Austen', 'Literatura Inglesa', 'A obra traz uma reflexão a respeito do comportamento da sociedade aristocrática no início do século XIX, na Inglaterra, e fala sobre a busca da felicidade e o desejo pessoal colocado acima das convenções sociais.', 424, 'Editora A', '2023-07-01', 'DISPONIVEL');
INSERT INTO books (nome, autor, categoria, sinopse, paginas, editora, data, status) VALUES ('Dom Casmurro', 'Machado de Assis', 'Literatura Brasileira', 'Dom Casmurro conta a história de Bento Santiago (Bentinho), apelidado de Dom Casmurro por ser calado e introvertido. Na adolescência, apaixona-se por Capítu, abandonando o seminário e, com ele, os desígnios traçados por sua mãe, Dona Glória, para que se tornasse padre.', 210, 'Editora B', '2023-06-30', 'INDISPONIVEL');
INSERT INTO books (nome, autor, categoria, sinopse, paginas, editora, data, status) VALUES ('O Morro dos Ventos Uivantes', 'Emily Bronte', 'Literatura Inglesa', 'O morro dos ventos uivantes retrata uma trágica história de amor e obsessão em que os personagens principais são a obstinada e geniosa Catherine Earnshaw e seu irmão adotivo, Heathcliff.', 416, 'Editora C', '2023-06-28', 'EMPRESTADO');

create table books
(
    nome      varchar(255),
    autor     varchar(255),
    categoria varchar(255),
    sinopse   varchar(10000),
    paginas   varchar(10),
    editora   varchar(255),
    data      varchar(255),
    status    varchar(255)
);


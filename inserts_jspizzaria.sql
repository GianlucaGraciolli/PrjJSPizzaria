INSERT INTO perfil (nomePerfil)
VALUES ('Adm'), ('Recepcionista'), ('Cliente');

SELECT * FROM perfil

INSERT INTO usuario (idPerfil,nomeUsuario,cpf,loginUsuario,senhaUsuario)
VALUES (1, 'Juca Simões', '12130443218', 'juquexgoat', '12345678'),
       (2, 'Rebecca Santos', '22200039451', 'Rebeccatopperson', '00000000');
       
SELECT * FROM usuario
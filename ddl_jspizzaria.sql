CREATE TABLE cliente (
idCliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
celular CHAR(11) NOT NULL
);

CREATE TABLE endereco (
idEndereco INT AUTO_INCREMENT PRIMARY KEY,
tipoLogradouro VARCHAR(10) NOT NULL,
logradouro VARCHAR(50) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10),
cep CHAR(8) NOT NULL,
bairro VARCHAR(30) NOT NULL,
cidade VARCHAR(30) NOT NULL,
uf CHAR(2) NOT NULL,
idCliente INT NOT NULL,
CONSTRAINT fk_cliente_endereco FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE formaPagamento (
idFormaPagamento INT AUTO_INCREMENT PRIMARY KEY,
nomeFormaPagamento VARCHAR(50) NOT NULL
);

CREATE TABLE perfil (
idPerfil INT AUTO_INCREMENT PRIMARY KEY,
nomePerfil VARCHAR(30) NOT NULL
);

CREATE TABLE usuario (
idUsuario INT AUTO_INCREMENT PRIMARY KEY,
idPerfil INT NOT NULL,
nomeUsuario VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL,
loginUsuario VARCHAR(30) NOT NULL,
senhaUsuario CHAR(8) NOT NULL,
CONSTRAINT fk_perfil_usuario FOREIGN KEY (idPerfil) REFERENCES perfil(idPerfil)
);

CREATE TABLE pizza (
idPizza INT AUTO_INCREMENT PRIMARY KEY,
nomePizza VARCHAR(30) NOT NULL,
pathFoto VARCHAR(50) NOT NULL,
valor DECIMAL(7,2) NOT NULL,
tamanho CHAR(1) NOT NULL,
descricao VARCHAR(150),
idUsuario INT NOT NULL,
CONSTRAINT fk_usuario_pizza FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
CONSTRAINT ck_tamanho_pizza CHECK (tamanho IN ('P', 'M', 'G'))
);

CREATE TABLE promocao (
idPromocao INT AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(50) NOT NULL,
dataInicio DATETIME NOT NULL,
dataFim DATETIME NOT NULL,
percentualDesconto DECIMAL(5,2) NOT NULL,
statusPromo CHAR(1) NOT NULL,
idUsuario INT NOT NULL,
idPizza INT NOT NULL,
CONSTRAINT fk_usuario_promo FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
CONSTRAINT fk_pizza_promo FOREIGN KEY (idPizza) REFERENCES pizza(idPizza)
);

CREATE TABLE pedido (
idPedido INT AUTO_INCREMENT PRIMARY KEY,
dataPedido DATETIME NOT NULL,
valorTotal DECIMAL(10,2) NOT NULL,
idFormaPagamento INT NOT NULL,
idCliente INT NOT NULL,
idUsuario INT NOT NULL,
CONSTRAINT fk_formaPagamento_pedido FOREIGN KEY (idFormaPagamento) REFERENCES formaPagamento(idFormaPagamento),
CONSTRAINT fk_cliente_pedido FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
CONSTRAINT fk_usuario_pedido FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE pedidoPizza (
idPedido INT NOT NULL,
idPizza INT NOT NULL,
qtdPizza INT NOT NULL,
valorParcialItem DECIMAL(10,2) NOT NULL,
PRIMARY KEY (idPedido, idPizza),
CONSTRAINT fk_pedido_pedidoPizza FOREIGN KEY (idPedido) REFERENCES pedido(idPedido),
CONSTRAINT fk_pizza_pedidoPizza FOREIGN KEY (idPizza) REFERENCES pizza(idPizza)
);

CREATE TABLE parcelas (
idPedido INT NOT NULL PRIMARY KEY,
qtdParcelas INT NOT NULL
);







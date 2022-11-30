create database gerencie;

use gerencie;

create table empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(45),
cepEmpresa char(9),
telefone char(15),
CNPJ char(18) 
);

create table usuario(
idUsuario int primary key auto_increment,
nomeCompleto varchar(60),
nomeUser varchar(25),
CPF char(14),
email varchar(40),
senha varchar(20),
telefone char(15),
isAtivo char(1),
tipoUsu int, constraint chkTipo check(tipoUsu in (1, 2, 3)),
-- 1 = desenvolvedor
-- 2 = Gerente;
-- 3 = Analista;
fkFuncionario INT,
FOREIGN KEY (fkFuncionario) REFERENCES usuario(idUsuario),
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

create table fastfood(
idFastFood int primary key auto_increment,
nomeFastFood varchar(35),
CEP char(9),
CNPJ CHAR(18),
telefone char(15),
isAtivoFastFood char(1),
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

create table totem(	
idTotem varchar(20) primary key,
usuarioTotem varchar(40),
senhaTotem varchar(20),
sistemaOperacional varchar(45),
memoriaRAMTotal double,
limiteProcessador int,
limiteTemperatura int,
limiteRam int,
isAtivoTotem char(1),
fkFastFood INT,
FOREIGN KEY (fkFastFood) REFERENCES fastfood(idFastFood)
);

create table comandos(
idComando int primary key auto_increment,
dtHora datetime,
comandoExecutado varchar(40),
fkTotem varchar(20),
FOREIGN KEY (fkTotem) REFERENCES totem(idTotem),
fkUsuario INT,
FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
);

create table metrica(
idMetrica int primary key auto_increment, 
dtInicializado datetime,
UsoRAM  double,
disponivelRAM double,
usoProcessador int,
disponivelProcessador int,
temperatura int,
fkTotem varchar(20),
FOREIGN KEY (fkTotem) REFERENCES totem(idTotem)
);

select * from usuario;

update totem set isAtivoTotem = 't' where idTotem ='BFEBFBFF000406E3';
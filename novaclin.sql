CREATE TABLE paciente(
idPaciente int PRIMARY KEY NOT NULL ,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11)  NOT NULL UNIQUE ,
cel CHAR(11) NOT NULL,
email VARCHAR(30) NULL ,
logradouro VARCHAR(30) NULL,
numero VARCHAR(6) NULL,
complemento VARCHAR(10) NULL,
cidade VARCHAR(20) NULL,
cep CHAR(8)NULL,
oberservacoes VARCHAR(100) NULL
);

DROP TABLE paciente
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

CREATE TABLE recepcionista(
idRecepcionista INT NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE ,
login VARCHAR(20) NOT NULL UNIQUE ,
senha CHAR(6) NOT NULL,
celular CHAR(11) NULL
);

CREATE TABLE especialidade(
idEspecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeEspecialidade VARCHAR(30) NOT NULL
);
 
 
CREATE TABLE medico(
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IdEspecialidade INT NOT NULL,
nome VARCHAR(50) NOT NULL,
crm CHAR(8) NOT NULL,
login VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
CONSTRAINT Fk_MedicoEspecialidade FOREIGN KEY(idEspecialidade)
REFERENCES especialidade(idEspecialidade)
);
 
CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
sintomas VARCHAR(200) NULL,
prescricao VARCHAR(200) NULL,
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);
 
CREATE TABLE exame(
idExame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
dataHoraExame DATETIME NOT NULL,
nomeExame VARCHAR(30) NOT NULL,
statusExame VARCHAR(10) NOT NULL,
resultado VARCHAR(200) NULL,
dataRetiradaExane DATETIME NULL,
dataPrevisaoEntrega DATETIME NULL,
CONSTRAINT Fk_exameconsulta FOREIGN KEY(idConsulta)
REFERENCES consulta(idConsulta)
);

ALTER TABLE paciente
ADD estado CHAR(2) NOT NULL;
SHOW TABLES
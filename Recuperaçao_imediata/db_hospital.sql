
-- Banco de Dados HospitalDB
-- Tabela Departamento
CREATE TABLE Departamento (
    ID_Departamento INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR(100) NOT NULL
);

-- Tabela Médico
CREATE TABLE Medico (
    ID_Medico INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100) NOT NULL,
    ID_Departamento INTEGER,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

-- Tabela Paciente
CREATE TABLE Paciente (
    ID_Paciente INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Idade INTEGER NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

-- Tabela Consulta
CREATE TABLE Consulta (
    ID_Consulta INTEGER PRIMARY KEY AUTOINCREMENT,
    Data DATE NOT NULL,
    Hora TIME NOT NULL,
    Observacoes TEXT,
    ID_Paciente INTEGER,
    ID_Medico INTEGER,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID_Medico)
);

-- Inserção de dados
INSERT INTO Departamento (Nome) VALUES ('Cardiologia'), ('Neurologia'), ('Pediatria');

INSERT INTO Medico (Nome, Especialidade, ID_Departamento) VALUES
('Dr. João', 'Cardiologista', 1),
('Dra. Maria', 'Neurologista', 2),
('Dr. Carlos', 'Pediatra', 3);

INSERT INTO Paciente (Nome, Idade, Telefone, Email) VALUES
('Ana Silva', 30, '123456789', 'ana@gmail.com'),
('Carlos Souza', 45, '987654321', 'carlos@gmail.com'),
('Mariana Lima', 12, '112233445', 'mariana@gmail.com');

INSERT INTO Consulta (Data, Hora, Observacoes, ID_Paciente, ID_Medico) VALUES
('2024-12-10', '10:00:00', 'Consulta inicial', 1, 1),
('2024-12-11', '11:30:00', 'Revisão de exames', 2, 2),
('2024-12-12', '09:00:00', 'Acompanhamento pediátrico', 3, 3);

-- Alterações
ALTER TABLE Paciente ADD Email VARCHAR(100);

-- Views
CREATE VIEW ConsultasDetalhadas AS
SELECT Paciente.Nome AS NomePaciente, Medico.Nome AS NomeMedico, Departamento.Nome AS Departamento, Consulta.Data, Consulta.Hora
FROM Consulta
JOIN Paciente ON Consulta.ID_Paciente = Paciente.ID_Paciente
JOIN Medico ON Consulta.ID_Medico = Medico.ID_Medico
JOIN Departamento ON Medico.ID_Departamento = Departamento.ID_Departamento;

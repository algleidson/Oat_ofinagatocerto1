CREATE DAtABASE OficinaGatoCerto

GO
USE OficinaGatoCerto
--TABELA PESSOA---------------------------------------------------
CREATE TABLE Pessoa
(
	IdPessoa INT not null IDENTITY(1,1),
	Nome varchar(100) not null,
	CONSTRAINT PK_IdPessoa PRIMARY KEY ([IdPessoa])	
);  

INSERT INTO Pessoa (Nome)p
VALUES 
('Vivicius Casca de Bala'),
('Algleidson Pergiso'),
('Eduardo Cheveteira'),
('Nikolas The jack'),
('Maria Santos'),
('Pedro Oliveira'),
('Ana Pereira'),
('Carlos Souza'),
('Julia Costa'),
('Lucas Almeida');

select *from Pessoa



--TABELA Cliente-------------------------------------------
CREATE TABLE Cliente
(
	IdCliente INT not null IDENTITY(1,1),
	IdPessoa INT not null,
	DataAniversario DATE,
	CPF_CNPJ VARCHAR(100)not null,
	TipoPessoa VARCHAR(100)not null,
	CONSTRAINT PK_IdCliente PRIMARY KEY (IdCliente)
);

INSERT INTO Cliente (IdPessoa, DataAniversario, CPF_CNPJ, TipoPessoa)
VALUES 
(1, '1980-01-01', '111.111.111-11', 'Pessoa Fisica'),
(2, '1981-02-02', '222.222.222-22', 'Pessoa Fisica'),
(3, '1982-03-03', '333.333.333-33', 'Pessoa Fisica'),
(4, '1983-04-04', '444.444.444-44', 'Pessoa Fisica'),
(5, '1984-05-05', '555.555.555-55', 'Pessoa Fisica'),
(6, '1985-06-06', '666.666.666-66', 'Pessoa Fisica'),
(7, '1986-07-07', '777.777.777-77', 'Pessoa Fisica'),
(8, '1987-08-08', '888.888.888-88', 'Pessoa Fisica'),
(9, '1988-09-09', '999.999.999-99', 'Pessoa Fisica'),
(10, '1989-10-10', '101.010.101-01', 'Pessoa Fisica')

SELECT IdCliente, CPF_CNPJ FROM Cliente;



--TABELA PESSOA FISICA -------------------------------------------
CREATE TABLE PessoaFisica
(
	IdPessoaFisica INT not null IDENTITY(1,1),
	CPF VARCHAR(100)not null,
	RG VARCHAR(100)not null,
	IdPessoa INT not null,
	DataAniversario DATE,
	CONSTRAINT PK_IdPessoaFisica PRIMARY KEY (IdPessoaFisica),
	CONSTRAINT UNQ_IdPessoaFisicaCPF UNIQUE (CPF),
	CONSTRAINT UNQ_IdPessoaFisicaRG UNIQUE (RG),
	CONSTRAINT FK_IdPessoaFisica_E_Pessoa FOREIGN  KEY (IdPessoa) REFERENCES dbo.Pessoa(IdPessoa)
);

INSERT INTO PessoaFisica (CPF, RG, IdPessoa, DataAniversario)
VALUES 
('123.456.789-01', '12.345.678-9', 1, '1980-01-01'),
('234.567.890-12', '23.456.789-0', 2, '1981-02-02'),
('345.678.901-23', '34.567.890-1', 3, '1982-03-03'),
('456.789.012-34', '45.678.901-2', 4, '1983-04-04'),
('567.890.123-45', '56.789.012-3', 5, '1984-05-05'),
('678.901.234-56', '67.890.123-4', 6, '1985-06-06'),
('789.012.345-67', '78.901.234-5', 7, '1986-07-07'),
('890.123.456-78', '89.012.345-6', 8, '1987-08-08'),
('901.234.567-89', '90.123.456-7', 9, '1988-09-09'),
('012.345.678-90', '01.234.567-8', 10, '1989-10-10');

Select *from PessoaFisica


--TABELA PESSOA FUNCIONARIO-------------------------------------------
CREATE TABLE Funcionario 
(
	IdFuncionario INT not null IDENTITY(1,1),
	CPF VARCHAR(20) not null,
	RG VARCHAR(20) not null,
	NumeroPis DECIMAL not null,
	NumeroRegistro DECIMAL not null,
	DataAniversario DATE not null,
	DataAdmicao DATE not null,
	CARGO VARCHAR(20) not null,
	IdPessoa INT not null,
	CONSTRAINT IdFuncionario PRIMARY KEY (IdFuncionario),
	CONSTRAINT UNQ_IdFuncionarioCPF UNIQUE (CPF),
	CONSTRAINT UNQ_IdFuncionarioRG UNIQUE (RG),
	CONSTRAINT UNQ_IdFuncionarioNumeroPis UNIQUE (NumeroPis),
	CONSTRAINT FK_IdFuncionario_E_Pessoa FOREIGN  KEY (IdPessoa) REFERENCES dbo.Pessoa(IdPessoa)
);

INSERT INTO Funcionario (CPF, RG, NumeroPis, NumeroRegistro, DataAniversario, DataAdmicao, CARGO, IdPessoa)
VALUES 
('111.111.111-11', '1111111', 1111, 1111, '1980-01-01', '2000-01-01', 'Gerente', 1),
('222.222.222-22', '2222222', 2222, 2222, '1981-02-02', '2001-02-02', 'Mecanico', 2),
('333.333.333-33', '3333333', 3333, 3333, '1982-03-03', '2002-03-03', 'Eletricista', 3),
('444.444.444-44', '4444444', 4444, 4444, '1983-04-04', '2003-04-04', 'Mecanico', 4),
('555.555.555-55', '5555555', 5555, 5555, '1984-05-05', '2004-05-05', 'Borracheiro', 5);



--TABELA PESSOA JURIDICA-------------------------------------------
CREATE TABLE PessoaJuridica
(
	IdPessoaJuridica INT not null IDENTITY(1,1),
	CNPJ VARCHAR(14) not null,
	RazaoSocial VARCHAR (100) not null,
	NomeFantasia varchar (100) not null,
	IncricaoEstadual VARCHAR(14) not null,
	IdPessoa INT not null,
	CONSTRAINT PK_IdPessoaJuridica PRIMARY KEY (IdPessoaJuridica),
	CONSTRAINT UNQ_IdPessoaJuridicaCNPJ UNIQUE (CNPJ),
	CONSTRAINT UNQ_IdPessoaJuridicaIncricaoEstadial UNIQUE (IncricaoEstadial),
	CONSTRAINT FK_IdPessoaJuridica_E_Pessoa FOREIGN  KEY (IdPessoa) REFERENCES dbo.Pessoa(IdPessoa)
);

Exec sp_rename  'PessoaJuridica.PessoaJuridica.InsrcricaoEstadual','InscricaoEstadual','column'

select * from PessoaJuridica 

INSERT INTO PessoaJuridica (CNPJ, RazaoSocial, NomeFantasia, IncricaoEstadial, IdPessoa)
VALUES 
('12.345.678/0001-90', 'eletronica peças Ltda', 'Bacia das almas peças', '123.456.789.012', 1),
('23.456.789/0002-80', ' parabrisa Du Bom Ltda', 'parabisa trincado', '234.567.890.123', 2),
('34.567.890/0003-70', 'retica se quiser Ltda', 'retifica vai não volta', '345.678.901.234', 3),
('45.678.901/0004-60', 'funilaria boa ventura', 'novelo SA', '456.789.012.345', 4),
('56.789.012/0005-50', 'lampas e acessorios ltda', 'sem galantia', '567.890.123.456', 5),
('67.890.123/0006-40', 'pneu sa', 'pneus meia vida', '678.901.234.567', 6),
('78.901.234/0007-30', 'borracharia valparaiso ', 'vem sem vai com furo', '789.012.345.678', 7),
('89.012.345/0008-20', 'roda e desempenos', 'roda quadrada', '890.123.456.789', 8),
('90.123.456/0009-10', 'pintura em geral', 'pintura a guache', '901.234.567.890', 9),
('01.234.567/0010-00', 'eletrica faisca', 'eletrica curto certo', '012.345.678.901', 10);


ALTER TABLE PessoaJuridica
ALTER COLUMN CNPJ VARCHAR(20);

ALTER TABLE PessoaJuridica
ALTER COLUMN IncricaoEstadial VARCHAR(20);


--TABELA E-mail-------------------------------------------
CREATE TABLE Email
(
	IdEmail INT not null,
	IdPessoa INT not null,
	Email VARCHAR (100) not null,
	CONSTRAINT PK_IdEmail PRIMARY KEY (IdEmail)
);

INSERT INTO Email (IdEmail, IdPessoa, Email)
VALUES 
(1, 1, 'vivicius.casca@oficinagatocerto.com'),
(2, 2, 'algleidson.pergiso@oficinagatocerto.com'),
(3, 3, 'eduardo.cheveteira@oficinagatocerto.com'),
(4, 4, 'nikolas.thejack@oficinagatocerto.com'),
(5, 5, 'maria.santos@oficinagatocerto.com'),
(6, 6, 'pedro.oliveira@oficinagatocerto.com'),
(7, 7, 'ana.pereira@oficinagatocerto.com'),
(8, 8, 'carlos.souza@oficinagatocerto.com'),
(9, 9, 'julia.costa@oficinagatocerto.com'),
(10, 10, 'lucas.almeida@oficinagatocerto.com');


--TABELA ENDERECOS ------------------------------------------
CREATE TABLE Enderecos
(
    IdEndereco INT not null,
    IdPessoa INT not null,
    Rua VARCHAR(100) not null,
    Bairro VARCHAR(100) not null,
    Logradouro VARCHAR(100)not null,
    Numero VARCHAR(10) not null,
    CEP VARCHAR(20) not null,
    Cidade VARCHAR(100) not null,
    CONSTRAINT PK_IdEndereco PRIMARY KEY (IdEndereco),
	CONSTRAINT FK_IdIdEndereco_E_Pessoa FOREIGN  KEY (IdPessoa) REFERENCES dbo.Pessoa(IdPessoa)
);

INSERT INTO Enderecos (IdEndereco, IdPessoa, Rua, Bairro, Logradouro, Numero, CEP, Cidade)
VALUES 
(1, 1, 'Rua das Flores', 'Bairro picaretas', 'Quadra 10', '100', '72870-100', 'Valparaíso de Goiás'),
(2, 2, 'Avenida Central', 'Bairro nó cego', 'Quadra 20', '200', '72870-200', 'Valparaíso de Goiás'),
(3, 3, 'Rua dos Pássaros', 'Bairro sem valor ', 'Quadra 30', '300', '72870-300', 'Valparaíso de Goiás'),
(4, 4, 'Avenida Principal', 'Bairro Centro de desmanche ', 'Quadra 40', '400', '72870-400', 'Valparaíso de Goiás'),
(5, 5, 'Rua das Orquídeas', 'Bairro Jardim dos furtos ', 'Quadra 50', '500', '72870-500', 'Valparaíso de Goiás'),
(6, 6, 'Avenida Lateral', 'Bairro Centro despacho', 'Quadra 60', '600', '72870-600', 'Valparaíso de Goiás'),
(7, 7, 'Rua dos Beija-flores', 'Bairro furto certo', 'Quadra 70', '700', '72870-700', 'Valparaíso de Goiás'),
(8, 8, 'Avenida Secundária', 'Bairro perdeu play boy', 'Quadra 80', '800', '72870-800', 'Valparaíso de Goiás'),
(9, 9, 'Rua das Rosas', 'Bairro carro quebrado', 'Quadra 90', '900', '72870-900', 'Valparaíso de Goiás'),
(10, 10, 'Avenida Terciária', 'Bairro Centro', 'Quadra 100', '1000', '72870-1000', 'Valparaíso de Goiás');


--TABELA TELEFONE-------------------------------------------
CREATE TABLE Telefone
(
    IdTelefone INT not null,
    IdPessoa INT not null,
    Telefone VARCHAR(50) not null,
    CONSTRAINT PK_IdTelefone PRIMARY KEY (IdTelefone),
	CONSTRAINT FK_IdTelefone_E_Pessoa FOREIGN  KEY (IdPessoa) REFERENCES dbo.Pessoa(IdPessoa)
);

INSERT INTO Telefone (IdTelefone, IdPessoa, Telefone)
VALUES 
(1, 1, '(61) 1234-5678'),
(2, 2, '(61) 2345-6789'),
(3, 3, '(61) 3456-7890'),
(4, 4, '(61) 4567-8901'),
(5, 5, '(61) 5678-9012'),
(6, 6, '(61) 6789-0123'),
(7, 7, '(61) 7890-1234'),
(8, 8, '(61) 8901-2345'),
(9, 9, '(61) 9012-3456'),
(10, 10, '(61) 0123-4567');

--TABELA VENDAS-------------------------------------------
CREATE TABLE Vendas
(
    IdVendas INT not null,
    IdPessoa INT not null,
    DATAVenda DATE not null,
    QuantidadeVendida SMALLINT not null,
    ValorUnitario DECIMAL (10,2) not null,
    ValorTotal DECIMAL(10,2) not null
    CONSTRAINT PK_IdVendas PRIMARY KEY (IdVendas)
	CONSTRAINT FK_IdVendas_E_Pessoa FOREIGN  KEY (IdPessoa) REFERENCES dbo.Pessoa(IdPessoa)
);

INSERT INTO Vendas (IdVendas, IdPessoa, DATAVenda, QuantidadeVendida, ValorUnitario, ValorTotal)
VALUES 
(1, 1, '2024-01-01', 10, 100.00, 1000.00),
(2, 2, '2024-02-02', 20, 200.00, 4000.00),
(3, 3, '2024-03-03', 30, 300.00, 9000.00),
(4, 4, '2024-04-04', 40, 400.00, 16000.00),
(5, 5, '2024-05-05', 50, 500.00, 25000.00),
(6, 6, '2024-06-06', 60, 600.00, 36000.00),
(7, 7, '2024-07-07', 70, 700.00, 49000.00),
(8, 8, '2024-08-08', 80, 800.00, 64000.00),
(9, 9, '2024-09-09', 90, 900.00, 81000.00),
(10, 10, '2024-10-10', 100, 1000.00, 100000.00),
(11, 1, '2024-11-11', 110, 1100.00, 121000.00),
(12, 2, '2024-12-12', 120, 1200.00, 144000.00),
(13, 3, '2025-01-01', 130, 1300.00, 169000.00),
(14, 4, '2025-02-02', 140, 1400.00, 196000.00),
(15, 5, '2025-03-03', 150, 1500.00, 225000.00);


--TABELA ORDEM DE SEVIÇO-------------------------------------------
CREATE TABLE OrdemServico
(
    IdOS INT not null,
    IdPessoa INT not null,
    Profissional VARCHAR(100) not null,
    Tipo_Servico VARCHAR(100) not null,
    CONSTRAINT PK_IdOS PRIMARY KEY (IdOS),
    CONSTRAINT FK_IdOS_E_Pessoa FOREIGN  KEY (IdPessoa) REFERENCES dbo.Pessoa(IdPessoa)
);

INSERT INTO OrdemServico (IdOS, IdPessoa, Profissional, Tipo_Servico)
VALUES 
(1, 1, 'Vivicius Casca de Bala', 'Manutenção Preventiva'),
(2, 2, 'Algleidson Pergiso', 'Troca de Óleo'),
(3, 3, 'Eduardo Cheveteira', 'Revisão Geral'),
(4, 4, 'Nikolas The jack', 'Troca de Pneus'),
(5, 5, 'Maria Santos', 'Alinhamento e Balanceamento'),
(6, 6, 'Pedro Oliveira', 'Manutenção de Freios'),
(7, 7, 'Ana Pereira', 'Manutenção de Motor'),
(8, 8, 'Carlos Souza', 'Manutenção de Suspensão'),
(9, 9, 'Julia Costa', 'Manutenção de Transmissão'),
(10, 10, 'Lucas Almeida', 'Manutenção de Ar Condicionado'),
(11, 1, 'Vivicius Casca de Bala', 'Manutenção de Direção'),
(12, 2, 'Algleidson Pergiso', 'Manutenção de Bateria'),
(13, 3, 'Eduardo Cheveteira', 'Manutenção de Sistema de Ignição'),
(14, 4, 'Nikolas The jack', 'Manutenção de Sistema de Injeção'),
(15, 5, 'Maria Santos', 'Manutenção de Sistema de Exaustão');



--TABELA DE VEICULOS-------------------------------------------
CREATE TABLE Veiculo
(
    IdVeiculo INT not null,
    IDcliente INT not null,
    IdOS INT not null,
    Marca VARCHAR(100) not null,
    Modelo VARCHAR(100) not null,
    AnoFabricacao SMALLINT not null,
    Placa VARCHAR(100) not null,
    KmRodado INT not null,
    CONSTRAINT PK_IdVeiculo PRIMARY KEY (IdVeiculo),
    CONSTRAINT UNQ_Placa UNIQUE (Placa),
	CONSTRAINT FK_IdVeiculo_E_Pessoa FOREIGN  KEY (IDcliente) REFERENCES dbo.Pessoa(IdPessoa)
);

INSERT INTO Veiculo (IdVeiculo, IDcliente, IdOS, Marca, Modelo, AnoFabricacao, Placa, KmRodado)
VALUES 
(1, 1, 1, 'Ford', 'Fiesta', 2010, 'ABC-1234', 100000),
(2, 2, 2, 'Chevete', 'Chevett do DUDU', 1987, 'DEF-5678', 50000),
(3, 3, 3, 'Volkswagen', 'Gol', 2012, 'GHI-9012', 80000),
(4, 4, 4, 'Fiat', 'Uno', 2011, 'JKL-3456', 120000),
(5, 5, 5, 'Renault', 'Clio', 2013, 'MNO-7890', 70000),
(6, 6, 6, 'Peugeot', '208', 2014, 'PQR-2345', 60000),
(7, 7, 7, 'Citroen', 'C3', 2016, 'STU-6789', 40000),
(8, 8, 8, 'Honda', 'Civic', 2017, 'VWX-0123', 30000),
(9, 9, 9, 'Toyota', 'Corolla', 2018, 'YZA-4567', 20000),
(10, 10, 10, 'Hyundai', 'HB20', 2019, 'BCD-8901', 10000),
(11, 1, 11, 'Nissan', 'Versa', 2020, 'EFG-2345', 5000),
(12, 2, 12, 'Mitsubishi', 'Lancer', 2021, 'HIJ-6789', 2500),
(13, 3, 13, 'Jeep', 'Renegade', 2022, 'KLM-0123', 1250),
(14, 4, 14, 'BMW', '320i', 2023, 'NOP-4567', 625),
(15, 5, 15, 'Mercedes-Benz', 'C200', 2024, 'QRS-8901', 312);


--TABELA DE ORDEM DE SERVIÇO E PRODUTOS -----------------------
CREATE TABLE OrdemServicoDetalhes
(
	IdOrdemServicoDetalhes INT not null IDENTITY (1,1) PRIMARY KEY,
	IdOS INT not null,
	IdProduto INT not null,
	CONSTRAINT FK_OrdemServicoDetalhes_Possuem_Produtos Foreign KEY (IdProduto) REFERENCES Produto (IdProduto),
	CONSTRAINT FK_OrdemServicoDetalhes_Possuem_OrdemServico Foreign KEY (IdOS) REFERENCES OrdemServico (IdOS),
);


INSERT INTO OrdemServicoDetalhes (IdOS, IdProduto)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5);


--TABELA DE PRODUTO -------------------------------------------
CREATE TABLE Produto
(
    IdProduto INT not null,
	IdVendas INT not null,
	IdOS INT not null,
    Marca VARCHAR(100) not null,
    NomePeca VARCHAR(100) not null, 
    CodigoProduto VARCHAR(100) not null,
   	CONSTRAINT PK_IdProduto PRIMARY KEY (IdProduto),
    CONSTRAINT UNQ_CodigoProduto UNIQUE (CodigoProduto),
);
INSERT INTO Produto (IdProduto, IdVendas, IdOS, Marca, NomePeca, CodigoProduto)
VALUES 
(1, 1, 1, 'Bosch', 'Filtro de Óleo', 'BOS123'),
(2, 2, 2, 'NGK', 'Vela de Ignição', 'NGK456'),
(3, 3, 3, 'Bosch', 'Bateria', 'BOS789'),
(4, 4, 4, 'Continental', 'Correia', 'CON012'),
(5, 5, 5, 'Mann', 'Filtro de Ar', 'MAN345'),
(6, 6, 6, 'Castrol', 'Óleo de Motor', 'CAS678'),
(7, 7, 7, 'Brembo', 'Pastilhas de Freio', 'BRE901'),
(8, 8, 8, 'Monroe', 'Amortecedor', 'MON234'),
(9, 9, 9, 'Bosch', 'Alternador', 'BOS567'),
(10, 10, 10, 'NGK', 'Cabo de Vela', 'NGK890'),
(11, 11, 11, 'Bosch', 'Sensor de Oxigênio', 'BOS1234'),
(12, 12, 12, 'Continental', 'Radiador', 'CON4567'),
(13, 13, 13, 'Mann', 'Filtro de Combustível', 'MAN7890'),
(14, 14, 14, 'Castrol', 'Fluido de Freio', 'CAS0123'),
(15, 15, 15, 'Brembo', 'Disco de Freio', 'BRE3456');

--Criando procidores-----------------------------------------------


--inserir um novo registro na tabela Pessoa--------------------------------

CREATE PROCEDURE InsertPessoa
    @Nome varchar(100)
AS
BEGIN
    IF @Nome IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Pessoa(Nome)
    VALUES (@Nome);
END;
GO

--atualizar um registro existente na tabela Pessoa---------------------------------
CREATE PROCEDURE UpdatePessoa
    @IdPessoa INT,
    @Nome varchar(100)
AS
BEGIN
    IF @Nome IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Pessoa
    SET Nome = @Nome
    WHERE IdPessoa = @IdPessoa;
END;
GO
--inserir Cliente---------------------------------------------------------
CREATE PROCEDURE InsertCliente
    @IdPessoa INT,
    @DataAniversario DATE,
    @CPF_CNPJ VARCHAR(100),
    @TipoPessoa VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @CPF_CNPJ IS NULL OR @TipoPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Cliente(IdPessoa, DataAniversario, CPF_CNPJ, TipoPessoa)
    VALUES (@IdPessoa, @DataAniversario, @CPF_CNPJ, @TipoPessoa);
END;
GO
-- atualizar um registro existente na tabela Cliente--------------------
CREATE PROCEDURE UpdateCliente
    @IdCliente INT,
    @IdPessoa INT,
    @DataAniversario DATE,
    @CPF_CNPJ VARCHAR(100),
    @TipoPessoa VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @CPF_CNPJ IS NULL OR @TipoPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Cliente
    SET IdPessoa = @IdPessoa, DataAniversario = @DataAniversario, CPF_CNPJ = @CPF_CNPJ, TipoPessoa = @TipoPessoa
    WHERE IdCliente = @IdCliente;
END;
GO
--inserir um novo registro na tabela Cliente-----------------------------------------
CREATE PROCEDURE InsertCliente
    @IdPessoa INT,
    @DataAniversario DATE,
    @CPF_CNPJ VARCHAR(100),
    @TipoPessoa VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @CPF_CNPJ IS NULL OR @TipoPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Cliente(IdPessoa, DataAniversario, CPF_CNPJ, TipoPessoa)
    VALUES (@IdPessoa, @DataAniversario, @CPF_CNPJ, @TipoPessoa);
END;
GO
-- atualizar um registro existente na tabela Cliente---------------------------
CREATE PROCEDURE UpdateCliente
    @IdCliente INT,
    @IdPessoa INT,
    @DataAniversario DATE,
    @CPF_CNPJ VARCHAR(100),
    @TipoPessoa VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @CPF_CNPJ IS NULL OR @TipoPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Cliente
    SET IdPessoa = @IdPessoa, DataAniversario = @DataAniversario, CPF_CNPJ = @CPF_CNPJ, TipoPessoa = @TipoPessoa
    WHERE IdCliente = @IdCliente;
END;
GO
--inserir um novo registro na tabela PessoaFisica--------------------------------------------------
CREATE PROCEDURE InsertPessoaFisica
    @CPF VARCHAR(100),
    @RG VARCHAR(100),
    @IdPessoa INT,
    @DataAniversario DATE
AS
BEGIN
    IF @CPF IS NULL OR @RG IS NULL OR @IdPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO PessoaFisica(CPF, RG, IdPessoa, DataAniversario)
    VALUES (@CPF, @RG, @IdPessoa, @DataAniversario);
END;
GO
--atualizar um registro existente na tabela PessoaFisica----------------------
CREATE PROCEDURE UpdatePessoaFisica
    @IdPessoaFisica INT,
    @CPF VARCHAR(100),
    @RG VARCHAR(100),
    @IdPessoa INT,
    @DataAniversario DATE
AS
BEGIN
    IF @CPF IS NULL OR @RG IS NULL OR @IdPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE PessoaFisica
    SET CPF = @CPF, RG = @RG, IdPessoa = @IdPessoa, DataAniversario = @DataAniversario
    WHERE IdPessoaFisica = @IdPessoaFisica;
END;
GO
--inserir um novo registro na tabela Funcionario
CREATE PROCEDURE InsertFuncionario
    @CPF VARCHAR(20),
    @RG VARCHAR(20),
    @NumeroPis DECIMAL,
    @NumeroRegistro DECIMAL,
    @DataAniversario DATE,
    @DataAdmicao DATE,
    @CARGO VARCHAR(20),
    @IdPessoa INT
AS
BEGIN
    IF @CPF IS NULL OR @RG IS NULL OR @NumeroPis IS NULL OR @NumeroRegistro IS NULL OR @DataAniversario IS NULL OR @DataAdmicao IS NULL OR @CARGO IS NULL OR @IdPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Funcionario(CPF, RG, NumeroPis, NumeroRegistro, DataAniversario, DataAdmicao, CARGO, IdPessoa)
    VALUES (@CPF, @RG, @NumeroPis, @NumeroRegistro, @DataAniversario, @DataAdmicao, @CARGO, @IdPessoa);
END;
GO
-- atualizar um registro existente na tabela Funcionario----------------------------
CREATE PROCEDURE UpdateFuncionario
    @IdFuncionario INT,
    @CPF VARCHAR(20),
    @RG VARCHAR(20),
    @NumeroPis DECIMAL,
    @NumeroRegistro DECIMAL,
    @DataAniversario DATE,
    @DataAdmicao DATE,
    @CARGO VARCHAR(20),
    @IdPessoa INT
AS
BEGIN
    IF @CPF IS NULL OR @RG IS NULL OR @NumeroPis IS NULL OR @NumeroRegistro IS NULL OR @DataAniversario IS NULL OR @DataAdmicao IS NULL OR @CARGO IS NULL OR @IdPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Funcionario
    SET CPF = @CPF, RG = @RG, NumeroPis = @NumeroPis, NumeroRegistro = @NumeroRegistro, DataAniversario = @DataAniversario, DataAdmicao = @DataAdmicao, CARGO = @CARGO, IdPessoa = @IdPessoa
    WHERE IdFuncionario = @IdFuncionario;
END;
GO
--inserir um novo registro na tabela PessoaJuridica-----------------------------
CREATE PROCEDURE InsertPessoaJuridica
    @CNPJ VARCHAR(14),
    @RazaoSocial VARCHAR(100),
    @NomeFantasia VARCHAR(100),
    @IncricaoEstadial VARCHAR(14),
    @IdPessoa INT
AS
BEGIN
    IF @CNPJ IS NULL OR @RazaoSocial IS NULL OR @NomeFantasia IS NULL OR @IncricaoEstadial IS NULL OR @IdPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO PessoaJuridica(CNPJ, RazaoSocial, NomeFantasia, IncricaoEstadial, IdPessoa)
    VALUES (@CNPJ, @RazaoSocial, @NomeFantasia, @IncricaoEstadial, @IdPessoa);
END;
GO
--atualizar um registro existente na tabela PessoaJuridica------------------------------------
CREATE PROCEDURE UpdatePessoaJuridica
    @IdPessoaJuridica INT,
    @CNPJ VARCHAR(14),
    @RazaoSocial VARCHAR(100),
    @NomeFantasia VARCHAR(100),
    @IncricaoEstadial VARCHAR(14),
    @IdPessoa INT
AS
BEGIN
    IF @CNPJ IS NULL OR @RazaoSocial IS NULL OR @NomeFantasia IS NULL OR @IncricaoEstadial IS NULL OR @IdPessoa IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE PessoaJuridica
    SET CNPJ = @CNPJ, RazaoSocial = @RazaoSocial, NomeFantasia = @NomeFantasia, IncricaoEstadial = @IncricaoEstadial, IdPessoa = @IdPessoa
    WHERE IdPessoaJuridica = @IdPessoaJuridica;
END;
GO
--inserir um novo registro na tabela Email-----------------------------------------------
CREATE PROCEDURE InsertEmail
    @IdPessoa INT,
    @Email VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @Email IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Email(IdPessoa, Email)
    VALUES (@IdPessoa, @Email);
END;
GO
--atualizar um registro existente na tabela Email-------------------------------
CREATE PROCEDURE UpdateEmail
    @IdEmail INT,
    @IdPessoa INT,
    @Email VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @Email IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Email
    SET IdPessoa = @IdPessoa, Email = @Email
    WHERE IdEmail = @IdEmail;
END;
GO
--inserir um novo registro na tabela Enderecos--------------------------------
CREATE PROCEDURE InsertEnderecos
    @IdPessoa INT,
    @Rua VARCHAR(100),
    @Bairro VARCHAR(100),
    @Logradouro VARCHAR(100),
    @Numero VARCHAR(10),
    @CEP VARCHAR(20),
    @Cidade VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @Rua IS NULL OR @Bairro IS NULL OR @Logradouro IS NULL OR @Numero IS NULL OR @CEP IS NULL OR @Cidade IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Enderecos(IdPessoa, Rua, Bairro, Logradouro, Numero, CEP, Cidade)
    VALUES (@IdPessoa, @Rua, @Bairro, @Logradouro, @Numero, @CEP, @Cidade);
END;
GO
--atualizar um registro existente na tabela Enderecos-------------------------------------------
CREATE PROCEDURE UpdateEnderecos
    @IdEndereco INT,
    @IdPessoa INT,
    @Rua VARCHAR(100),
    @Bairro VARCHAR(100),
    @Logradouro VARCHAR(100),
    @Numero VARCHAR(10),
    @CEP VARCHAR(20),
    @Cidade VARCHAR(100)
AS
BEGIN
    IF @IdPessoa IS NULL OR @Rua IS NULL OR @Bairro IS NULL OR @Logradouro IS NULL OR @Numero IS NULL OR @CEP IS NULL OR @Cidade IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Enderecos
    SET IdPessoa = @IdPessoa, Rua = @Rua, Bairro = @Bairro, Logradouro = @Logradouro, Numero = @Numero, CEP = @CEP, Cidade = @Cidade
    WHERE IdEndereco = @IdEndereco;
END;
GO
--inserir um novo registro na tabela Vendas-------------------------------------------
CREATE PROCEDURE InsertVendas
    @IdPessoa INT,
    @DATAVenda DATE,
    @QuantidadeVendida SMALLINT,
    @ValorUnitario DECIMAL(10,2),
    @ValorTotal DECIMAL(10,2)
AS
BEGIN
    IF @IdPessoa IS NULL OR @DATAVenda IS NULL OR @QuantidadeVendida IS NULL OR @ValorUnitario IS NULL OR @ValorTotal IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Vendas(IdPessoa, DATAVenda, QuantidadeVendida, ValorUnitario, ValorTotal)
    VALUES (@IdPessoa, @DATAVenda, @QuantidadeVendida, @ValorUnitario, @ValorTotal);
END;
GO
--atualizar um registro existente na tabela Vendas----------------------------
CREATE PROCEDURE UpdateVendas
    @IdVendas INT,
    @IdPessoa INT,
    @DATAVenda DATE,
    @QuantidadeVendida SMALLINT,
    @ValorUnitario DECIMAL(10,2),
    @ValorTotal DECIMAL(10,2)
AS
BEGIN
    IF @IdPessoa IS NULL OR @DATAVenda IS NULL OR @QuantidadeVendida IS NULL OR @ValorUnitario IS NULL OR @ValorTotal IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Vendas
    SET IdPessoa = @IdPessoa, DATAVenda = @DATAVenda, QuantidadeVendida = @QuantidadeVendida, ValorUnitario = @ValorUnitario, ValorTotal = @ValorTotal
    WHERE IdVendas = @IdVendas;
END;
GO
--inserir um novo registro na tabela Veiculo----------------------------------
CREATE PROCEDURE InsertVeiculo
    @IDcliente INT,
    @IdOS INT,
    @Marca VARCHAR(100),
    @Modelo VARCHAR(100),
    @AnoFabricacao SMALLINT,
    @Placa VARCHAR(100),
    @KmRodado INT
AS
BEGIN
    IF @IDcliente IS NULL OR @IdOS IS NULL OR @Marca IS NULL OR @Modelo IS NULL OR @AnoFabricacao IS NULL OR @Placa IS NULL OR @KmRodado IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Veiculo(IDcliente, IdOS, Marca, Modelo, AnoFabricacao, Placa, KmRodado)
    VALUES (@IDcliente, @IdOS, @Marca, @Modelo, @AnoFabricacao, @Placa, @KmRodado);
END;
GO
--atualizar um registro existente na tabela Veiculo
CREATE PROCEDURE UpdateVeiculo
    @IdVeiculo INT,
    @IDcliente INT,
    @IdOS INT,
    @Marca VARCHAR(100),
    @Modelo VARCHAR(100),
    @AnoFabricacao SMALLINT,
    @Placa VARCHAR(100),
    @KmRodado INT
AS
BEGIN
    IF @IDcliente IS NULL OR @IdOS IS NULL OR @Marca IS NULL OR @Modelo IS NULL OR @AnoFabricacao IS NULL OR @Placa IS NULL OR @KmRodado IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Veiculo
    SET IDcliente = @IDcliente, IdOS = @IdOS, Marca = @Marca, Modelo = @Modelo, AnoFabricacao = @AnoFabricacao, Placa = @Placa, KmRodado = @KmRodado
    WHERE IdVeiculo = @IdVeiculo;
END;
GO
--inserir um novo registro na tabela OrdemServicoDetalhes---------------------------------------
CREATE PROCEDURE InsertOrdemServicoDetalhes
    @IdOS INT,
    @IdProduto INT
AS
BEGIN
    IF @IdOS IS NULL OR @IdProduto IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO OrdemServicoDetalhes(IdOS, IdProduto)
    VALUES (@IdOS, @IdProduto);
END;
GO
--atualizar um registro existente na tabela OrdemServicoDetalhes-----------------------------
CREATE PROCEDURE UpdateOrdemServicoDetalhes
    @IdOrdemServicoDetalhes INT,
    @IdOS INT,
    @IdProduto INT
AS
BEGIN
    IF @IdOS IS NULL OR @IdProduto IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE OrdemServicoDetalhes
    SET IdOS = @IdOS, IdProduto = @IdProduto
    WHERE IdOrdemServicoDetalhes = @IdOrdemServicoDetalhes;
END;
GO
--inserir um novo registro na tabela Produto-------------------------------
CREATE PROCEDURE InsertProduto
    @IdVendas INT,
    @IdOS INT,
    @Marca VARCHAR(100),
    @NomePeca VARCHAR(100),
    @CodigoProduto VARCHAR(100)
AS
BEGIN
    IF @IdVendas IS NULL OR @IdOS IS NULL OR @Marca IS NULL OR @NomePeca IS NULL OR @CodigoProduto IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    INSERT INTO Produto(IdVendas, IdOS, Marca, NomePeca, CodigoProduto)
    VALUES (@IdVendas, @IdOS, @Marca, @NomePeca, @CodigoProduto);
END;
GO
--atualizar um registro existente na tabela Produto----------------------
CREATE PROCEDURE UpdateProduto
    @IdProduto INT,
    @IdVendas INT,
    @IdOS INT,
    @Marca VARCHAR(100),
    @NomePeca VARCHAR(100),
    @CodigoProduto VARCHAR(100)
AS
BEGIN
    IF @IdVendas IS NULL OR @IdOS IS NULL OR @Marca IS NULL OR @NomePeca IS NULL OR @CodigoProduto IS NULL
    BEGIN
        RAISERROR('Não é permitido campos nulos', 16, 1);
        RETURN;
    END

    UPDATE Produto
    SET IdVendas = @IdVendas, IdOS = @IdOS, Marca = @Marca, NomePeca = @NomePeca, CodigoProduto = @CodigoProduto
    WHERE IdProduto = @IdProduto;
END;
GO

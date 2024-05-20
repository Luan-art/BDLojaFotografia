
CREATE TABLE Endereco (
    CodEnd BIGINT,
    Cep VARCHAR(10),
    Uf CHAR(2),
    Cidade VARCHAR(100),
    Bairro VARCHAR(100),
    Rua VARCHAR(100),
    Numero VARCHAR(10),
	CONSTRAINT pkEndereco Primary Key(CodEnd)
);

CREATE TABLE Cliente (
    Id BIGINT,
    Nome VARCHAR(100),
    CodEnd INT,
    TelefoneResidencial VARCHAR(15),
    TelefoneComercial VARCHAR(15),
    Celular VARCHAR(15),
    CPF VARCHAR(14) UNIQUE,
    RG VARCHAR(20)UNIQUE,
    DataNascimento DATE,
    Sexo CHAR(1),
    CNPJ VARCHAR(18)UNIQUE,
    InscEstadual VARCHAR(20)UNIQUE,
    Responsavel VARCHAR(100),
    Tipo CHAR(1), 
	CONSTRAINT pkCliente Primary Key(Id),
    FOREIGN KEY (Id) REFERENCES Endereco(CodEnd)
);

CREATE TABLE Funcionario (
    Id BIGINT,
    Nome VARCHAR(100),
    CodEnd BIGINT,
    TelefoneResidencial VARCHAR(15),
    TelefoneComercial VARCHAR(15),
    Celular VARCHAR(15),
    Contato VARCHAR(100),
    Funcao VARCHAR(50),
    Departamento VARCHAR(50),
	CONSTRAINT pkFuncionario Primary Key(Id),
    FOREIGN KEY (CodEnd) REFERENCES Endereco(CodEnd)
);

CREATE TABLE Produto (
    Id BIGINT,
    Descricao VARCHAR(100),
    PrecoDeCusto DECIMAL(10, 2),
    PrecoDeVenda DECIMAL(10, 2),
    QuantidadeEstoque INT,
    QuantidadeMinima INT,
    Tipo VARCHAR(50),
	CONSTRAINT pkProduto Primary Key(Id)
);

CREATE TABLE Venda (
    Numero BIGINT,
    DataVenda DATE,
    IDCliente BIGINT,
    IDFuncionario BIGINT,
    ValorDaVenda DECIMAL(10, 2),
    CondicaoDeVenda VARCHAR(50),
	CONSTRAINT pkVenda PRIMARY KEY (Numero, DataVenda),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(Id),
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(Id)
);

CREATE TABLE ItensDaVenda (
    IdProduto BIGINT,
    NumeroVenda BIGINT,
    DataItemVenda DATE,
    Descricao VARCHAR(100),
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    CONSTRAINT pkItensDaVenda PRIMARY KEY (IdProduto, NumeroVenda, DataItemVenda),
    FOREIGN KEY (IdProduto) REFERENCES Produto(Id),
    FOREIGN KEY (NumeroVenda, DataItemVenda) REFERENCES Venda(Numero, DataVenda)
);

CREATE TABLE FuncionarioVenda (
    Numero BIGINT,
    DataFV DATE,
    IdFuncionario BIGINT,
    ValorDaVenda DECIMAL(10, 2),
    CondicaoDeVenda VARCHAR(50),
    CONSTRAINT pkFuncionarioVenda PRIMARY KEY (Numero, DataFV, IdFuncionario),
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(Id)
);

INSERT INTO Endereco (CodEnd, Cep, Uf, Cidade, Bairro, Rua, Numero) VALUES
(1, '12345-678', 'SP', 'São Paulo', 'Centro', 'Rua A', '100'),
(2, '23456-789', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Rua B', '200');

INSERT INTO Cliente (Id, Nome, CodEnd, TelefoneResidencial, TelefoneComercial, Celular, CPF, RG, DataNascimento, Sexo, CNPJ, InscEstadual, Responsavel, Tipo) VALUES
(1, 'João Silva', 1, '1111-1111', '2222-2222', '9999-9999', '123.456.789-00', 'MG-12.345.678', '1980-01-01', 'M', NULL, NULL, NULL, 'F'),
(2, 'Empresa X', 2, '3333-3333', '4444-4444', '8888-8888', NULL, NULL, NULL, NULL, '12.345.678/0001-90', 'ISENTO', 'Maria Souza', 'J');

INSERT INTO Funcionario (Id, Nome, CodEnd, TelefoneResidencial, TelefoneComercial, Celular, Contato, Funcao, Departamento) VALUES
(1, 'Carlos Almeida', 1, '5555-5555', '6666-6666', '7777-7777', 'carlos@empresa.com', 'Vendedor', 'Vendas'),
(2, 'Ana Costa', 2, '7777-7777', '8888-8888', '9999-9999', 'ana@empresa.com', 'Gerente', 'Administração');

INSERT INTO Produto (Id, Descricao, PrecoDeCusto, PrecoDeVenda, QuantidadeEstoque, QuantidadeMinima, Tipo) VALUES
(1, 'Câmera Digital', 500.00, 700.00, 50, 5, 'Eletrônicos'),
(2, 'Lente 50mm', 200.00, 300.00, 30, 3, 'Acessórios');

INSERT INTO Venda (Numero, DataVenda, IDCliente, IDFuncionario, ValorDaVenda, CondicaoDeVenda) VALUES
(1, '2024-05-19', 1, 1, 1400.00, 'Cartão de Crédito'),
(2, '2024-05-20', 2, 2, 300.00, 'Dinheiro');

INSERT INTO ItensDaVenda (IdProduto, NumeroVenda, DataItemVenda, Descricao, Quantidade, PrecoUnitario) VALUES
(1, 1, '2024-05-19', 'Câmera Digital', 2, 700.00),
(2, 2, '2024-05-20', 'Lente 50mm', 1, 300.00);

INSERT INTO FuncionarioVenda (Numero, DataFV, IdFuncionario, ValorDaVenda, CondicaoDeVenda) VALUES
(1, '2024-05-19', 1, 1400.00, 'Cartão de Crédito'),
(2, '2024-05-20', 2, 300.00, 'Dinheiro');

SELECT * FROM Cliente;

SELECT * FROM Venda;

SELECT * FROM ItensDaVenda;

SELECT * FROM Funcionario;

SELECT * FROM Endereco;

SELECT * FROM Produto;

SELECT * FROM FuncionarioVenda;

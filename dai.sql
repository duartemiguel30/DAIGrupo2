CREATE DATABASE mysql_dai;
USE mysql_dai;

-- Tabela para Administrador
CREATE TABLE Administrador (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    senha_admin VARCHAR(100)
);

-- Tabela para Utilizadores
CREATE TABLE Utilizador (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);

-- Tabela para Motoristas
CREATE TABLE Motorista (
    motorista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    salario DECIMAL(10, 2)
    -- Outros campos relacionados ao motorista, se necessário
);

-- Tabela para Passageiros
CREATE TABLE Passageiro (
    passageiro_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela para Autocarros
CREATE TABLE Autocarro (
    autocarro_id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(20),
    modelo VARCHAR(100),
    capacidade INT,
    motorista_id INT,
    FOREIGN KEY (motorista_id) REFERENCES Motorista(motorista_id)
    -- Outros campos relacionados ao autocarro, se necessário
);

-- Tabela para Viagens
CREATE TABLE Viagem (
    viagem_id INT PRIMARY KEY AUTO_INCREMENT,
    origem VARCHAR(100),
    destino VARCHAR(100),
    data_hora DATETIME,
    autocarro_id INT,
    motorista_id INT,
    FOREIGN KEY (autocarro_id) REFERENCES Autocarro(autocarro_id),
    FOREIGN KEY (motorista_id) REFERENCES Motorista(motorista_id)
);

-- Tabela para Bilhetes
CREATE TABLE Bilhete (
    bilhete_id INT PRIMARY KEY AUTO_INCREMENT,
    passageiro_id INT,
    viagem_id INT,
    data_compra DATETIME,
    FOREIGN KEY (passageiro_id) REFERENCES Passageiro(passageiro_id),
    FOREIGN KEY (viagem_id) REFERENCES Viagem(viagem_id)
);

-- Tabela para Transações de Pagamento
CREATE TABLE TransacaoPagamento (
    transacao_id INT PRIMARY KEY AUTO_INCREMENT,
    bilhete_id INT,
    valor DECIMAL(10, 2),
    metodo_pagamento VARCHAR(100),
    status VARCHAR(50),
    data_hora DATETIME,
    FOREIGN KEY (bilhete_id) REFERENCES Bilhete(bilhete_id)
);

-- Tabela para Informações de Pagamento
CREATE TABLE InformacaoPagamento (
    info_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    nome_titular VARCHAR(100),
    numero_cartao VARCHAR(16),
    data_expiracao VARCHAR(7),
    cvv VARCHAR(4),
    -- Outros campos relacionados às informações de pagamento, se necessário
    FOREIGN KEY (usuario_id) REFERENCES Utilizador(user_id)
);

CREATE TABLE CodigoQR (
    qr_id INT PRIMARY KEY AUTO_INCREMENT,
    bilhete_id INT,
    qr_code TEXT,
    valido BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (bilhete_id) REFERENCES Bilhete(bilhete_id)
);

USE mysql_dai;

-- Adicionar coluna saldo à tabela Utilizador
ALTER TABLE Utilizador ADD saldo DECIMAL(10, 2) DEFAULT 0;

-- Tabela para Transações Financeiras do Utilizador
CREATE TABLE TransacaoFinanceira (
    transacao_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    tipo_transacao ENUM('Compra', 'Recarga', 'Reembolso'),
    valor DECIMAL(10, 2),
    data_transacao DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES Utilizador(user_id)
);

-- Tabela para Estatísticas
CREATE TABLE EstatisticasMes (
    estatisticas_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    mes INT,
    ano INT,
    total_gasto DECIMAL(10, 2),
    numero_viagens INT,
    FOREIGN KEY (user_id) REFERENCES Utilizador(user_id)
);

USE mysql_dai;

-- Tabela para Rotas
CREATE TABLE Rota (
    rota_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao VARCHAR(255)
    -- Outros campos relacionados à rota, se necessário
);

-- Tabela para Paragens
CREATE TABLE Paragem (
    paragem_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    latitude DECIMAL(10, 6),
    longitude DECIMAL(10, 6)
    -- Outros campos relacionados à paragem, se necessário
);

-- Tabela para Associar Paragens às Rotas
CREATE TABLE RotaParagem (
    rota_id INT,
    paragem_id INT,
    ordem INT,
    PRIMARY KEY (rota_id, paragem_id),
    FOREIGN KEY (rota_id) REFERENCES Rota(rota_id),
    FOREIGN KEY (paragem_id) REFERENCES Paragem(paragem_id)
);

-- Tabela para Horários das Rotas
CREATE TABLE Horario (
    horario_id INT PRIMARY KEY AUTO_INCREMENT,
    rota_id INT,
    paragem_id INT,
    hora TIME,
    FOREIGN KEY (rota_id) REFERENCES Rota(rota_id),
    FOREIGN KEY (paragem_id) REFERENCES Paragem(paragem_id)
);

USE mysql_dai;
CREATE TABLE Notificacao (
    id_notificacao INT PRIMARY KEY AUTO_INCREMENT,
    id_utilizador INT,
    mensagem TEXT,
    data_envio DATETIME,
    FOREIGN KEY (id_utilizador) REFERENCES Utilizador(user_id)
);

CREATE TABLE AvaliacaoViagem (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    id_utilizador INT,
    id_viagem INT,
    classificacao INT,
    comentario TEXT,
    data_avaliacao DATETIME,
    FOREIGN KEY (id_utilizador) REFERENCES Utilizador(user_id),
    FOREIGN KEY (id_viagem) REFERENCES Viagem(viagem_id)
);

CREATE TABLE AvaliacaoMotorista (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    id_utilizador INT,
    id_motorista INT,
    classificacao INT,
    comentario TEXT,
    data_avaliacao DATETIME,
    FOREIGN KEY (id_utilizador) REFERENCES Utilizador(user_id),
    FOREIGN KEY (id_motorista) REFERENCES Motorista(motorista_id)
);

CREATE TABLE PontosUtilizador (
    id_utilizador INT PRIMARY KEY,
    pontos INT DEFAULT 0,
    FOREIGN KEY (id_utilizador) REFERENCES Utilizador(user_id)
);

CREATE TABLE Recompensa (
    id_recompensa INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255),
    pontos_necessarios INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Utilizador(user_id)
);

CREATE TABLE TicketSuporte (
    id_ticket INT PRIMARY KEY AUTO_INCREMENT,
    id_utilizador INT,
    assunto VARCHAR(255),
    descricao TEXT,
    estado ENUM('Aberto', 'Fechado'),
    data_submissao DATETIME,
    FOREIGN KEY (id_utilizador) REFERENCES Utilizador(user_id)
);

/*parte de autenticacao utilizador*/

-- Registro de utilizador
CREATE PROCEDURE RegistrarUtilizador(
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(100)
)
BEGIN
    INSERT INTO Utilizador (nome, email, senha) VALUES (p_nome, p_email, p_senha);
END;

-- Login de utilizador
CREATE PROCEDURE LoginUtilizador(
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(100)
)
BEGIN
    SELECT user_id FROM Utilizador WHERE email = p_email AND senha = p_senha;
END;

/*autenticacao motorista*/

-- Login de motorista
CREATE PROCEDURE LoginMotorista(
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(100)
)
BEGIN
    SELECT motorista_id FROM Motorista WHERE email = p_email AND senha = p_senha;
END;

/*consulta de informacoes*/

-- Verificar horários de autocarros
SELECT * FROM Horario;

-- Verificar rotas disponíveis
SELECT * FROM Rota;

-- Visualizar estatísticas do mês
-- Supondo que exista uma tabela EstatisticasMes com campos como user_id, total_gasto, numero_viagens, etc.
CREATE PROCEDURE VisualizarEstatisticasMes(
    IN p_user_id INT
)
BEGIN
    SELECT total_gasto, numero_viagens FROM EstatisticasMes WHERE user_id = p_user_id;
END;

-- Verificar saldo da conta
SELECT saldo FROM Utilizador WHERE user_id = @user_id;

/*operacoes financeiras utilizador*/

-- Carregar saldo na conta
CREATE PROCEDURE CarregarSaldo(
    IN p_user_id INT,
    IN p_valor DECIMAL(10, 2)
)
BEGIN
    UPDATE Utilizador SET saldo = saldo + p_valor WHERE user_id = p_user_id;
END;

-- Comprar bilhetes para as viagens desejadas
-- Supondo que exista uma tabela Bilhete com campos como passageiro_id, viagem_id, etc.
CREATE PROCEDURE ComprarBilhete(
    IN p_user_id INT,
    IN p_viagem_id INT,
    IN p_data_compra DATETIME
)
BEGIN
    INSERT INTO Bilhete (passageiro_id, viagem_id, data_compra) VALUES (p_user_id, p_viagem_id, p_data_compra);
    -- Atualizar estatísticas do mês
    UPDATE EstatisticasMes SET numero_viagens = numero_viagens + 1 WHERE user_id = p_user_id;
    -- Atualizar saldo do utilizador (se necessário)
    -- Deduzir valor do saldo do utilizador (se necessário)
END;

/*confirmar bilhetes vendidos motorista*/

-- Confirmar bilhetes vendidos e validar bilhetes de passageiros
-- Supondo que exista uma tabela Bilhete com campos como passageiro_id, viagem_id, etc.
CREATE PROCEDURE ConfirmarBilhetesVendidos(
    IN p_motorista_id INT,
    IN p_viagem_id INT
)

USE mysql_dai;
ALTER TABLE Bilhete ADD COLUMN confirmado BOOLEAN DEFAULT FALSE;

CREATE PROCEDURE ConfirmarBilhetesVendidos(
    IN p_viagem_id INT
)
BEGIN
    -- Confirmar bilhetes vendidos para a viagem especificada pelo motorista
    UPDATE Bilhete SET confirmado = TRUE WHERE viagem_id = p_viagem_id;
END;

/*parte das notificacoes*/

USE mysql_dai;

ALTER TABLE Notificacao ADD COLUMN user_id INT;

-- Implementar um sistema de notificações
-- Supondo que exista uma tabela Notificacao com campos como user_id, mensagem, data_envio, etc.
CREATE PROCEDURE EnviarNotificacao(
    IN p_user_id INT,
    IN p_mensagem TEXT,
    IN p_data_envio DATETIME
)
BEGIN
    INSERT INTO Notificacao (user_id, mensagem, data_envio) VALUES (p_user_id, p_mensagem, p_data_envio);
END;


/*pparte das avaliacoes*/

USE mysql_dai;
ALTER TABLE AvaliacaoViagem ADD COLUMN user_id INT;
ALTER TABLE AvaliacaoViagem ADD COLUMN viagem_id INT;

ALTER TABLE AvaliacaoMotorista ADD COLUMN user_id INT;
ALTER TABLE AvaliacaoMotorista ADD COLUMN motorista_id INT;


-- Permitir que os utilizadores avaliem as viagens
-- Supondo que exista uma tabela AvaliacaoViagem com campos como user_id, viagem_id, classificacao, comentario, etc.
CREATE PROCEDURE AvaliarViagem(
    IN p_user_id INT,
    IN p_viagem_id INT,
    IN p_classificacao INT,
    IN p_comentario TEXT
)
BEGIN
    INSERT INTO AvaliacaoViagem (user_id, viagem_id, classificacao, comentario) VALUES (p_user_id, p_viagem_id, p_classificacao, p_comentario);
END;

-- Permitir que os utilizadores avaliem os motoristas
-- Supondo que exista uma tabela AvaliacaoMotorista com campos como user_id, motorista_id, classificacao, comentario, etc.
CREATE PROCEDURE AvaliarMotorista(
    IN p_user_id INT,
    IN p_motorista_id INT,
    IN p_classificacao INT,
    IN p_comentario TEXT
)
BEGIN
    INSERT INTO AvaliacaoMotorista (user_id, motorista_id, classificacao, comentario) VALUES (p_user_id, p_motorista_id, p_classificacao, p_comentario);
END;

/*sistema de recompensa*/

ALTER TABLE PontosUtilizador ADD COLUMN user_id INT;


ALTER TABLE Recompensa ADD COLUMN pontos_necessarios INT;


CREATE PROCEDURE ResgatarRecompensa(
    IN p_user_id INT,
    IN p_id_recompensa INT
)
BEGIN
    DECLARE pontos_usuario INT;
    DECLARE pontos_necessarios_recompensa INT;

    -- Obter os pontos do usuário
    SELECT pontos INTO pontos_usuario FROM PontosUtilizador WHERE user_id = p_user_id;

    -- Obter os pontos necessários para a recompensa
    SELECT pontos_necessarios INTO pontos_necessarios_recompensa FROM Recompensa WHERE id_recompensa = p_id_recompensa;

    -- Verificar se o usuário tem pontos suficientes para resgatar a recompensa
    IF pontos_usuario >= pontos_necessarios_recompensa THEN
        -- Adicionar a recompensa ao utilizador
        INSERT INTO Recompensa (user_id, id_recompensa) VALUES (p_user_id, p_id_recompensa);

        -- Deduzir os pontos necessários do saldo do utilizador
        UPDATE PontosUtilizador SET pontos = pontos - pontos_necessarios_recompensa WHERE user_id = p_user_id;

        -- Outras operações relacionadas com a recompensa (por exemplo, aplicar desconto, conceder vantagem, etc.)
    ELSE
        -- Caso o utilizador não tenha pontos suficientes para resgatar a recompensa
        -- Pode ser lançada uma exceção ou uma mensagem de erro pode ser retornada
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuário não possui pontos suficientes para resgatar a recompensa';
    END IF;
END;

/*parte do suporte ao cliente*/

ALTER TABLE TicketSuporte ADD COLUMN user_id INT;

-- Disponibilizar um canal de suporte
-- Supondo que exista uma tabela TicketSuporte com campos como user_id, assunto, descricao, estado, data_submissao, etc.
CREATE PROCEDURE AbrirTicketSuporte(
    IN p_user_id INT,
    IN p_assunto VARCHAR(255),
    IN p_descricao TEXT
)
BEGIN
    INSERT INTO TicketSuporte (user_id, assunto, descricao, estado, data_submissao) VALUES (p_user_id, p_assunto, p_descricao, 'Aberto', NOW());
END;

-- Consultar tickets de suporte
CREATE PROCEDURE ConsultarTicketsSuporte(
    IN p_user_id INT
)
BEGIN
    SELECT * FROM TicketSuporte WHERE user_id = p_user_id;
END;

-- Fechar ticket de suporte
CREATE PROCEDURE FecharTicketSuporte(
    IN p_id_ticket INT
)
BEGIN
    UPDATE TicketSuporte SET estado = 'Fechado' WHERE id_ticket = p_id_ticket;
END;

/*parte do admin*/

CREATE PROCEDURE AdicionarUtilizador(
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(100)
)
BEGIN
    INSERT INTO Utilizador (nome, email, senha) VALUES (p_nome, p_email, p_senha);
END;

CREATE PROCEDURE EditarUtilizador(
    IN p_user_id INT,
    IN p_nome VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(100)
)
BEGIN
    UPDATE Utilizador SET nome = p_nome, email = p_email, senha = p_senha WHERE user_id = p_user_id;
END;

CREATE PROCEDURE RemoverUtilizador(
    IN p_user_id INT
)
BEGIN
    DELETE FROM Utilizador WHERE user_id = p_user_id;
END;

CREATE PROCEDURE AdicionarAutocarro(
    IN p_matricula VARCHAR(20),
    IN p_modelo VARCHAR(100),
    IN p_capacidade INT,
    IN p_motorista_id INT
)
BEGIN
    INSERT INTO Autocarro (matricula, modelo, capacidade, motorista_id) VALUES (p_matricula, p_modelo, p_capacidade, p_motorista_id);
END;

CREATE PROCEDURE EditarAutocarro(
    IN p_autocarro_id INT,
    IN p_matricula VARCHAR(20),
    IN p_modelo VARCHAR(100),
    IN p_capacidade INT,
    IN p_motorista_id INT
)
BEGIN
    UPDATE Autocarro SET matricula = p_matricula, modelo = p_modelo, capacidade = p_capacidade, motorista_id = p_motorista_id WHERE autocarro_id = p_autocarro_id;
END;

CREATE PROCEDURE RemoverAutocarro(
    IN p_autocarro_id INT
)
BEGIN
    DELETE FROM Autocarro WHERE autocarro_id = p_autocarro_id;
END;

-- Adicionar Rota
CREATE PROCEDURE AdicionarRota(
    IN p_nome VARCHAR(100),
    IN p_descricao VARCHAR(255)
)
BEGIN
    INSERT INTO Rota (nome, descricao) VALUES (p_nome, p_descricao);
END;

-- Editar Rota
CREATE PROCEDURE EditarRota(
    IN p_rota_id INT,
    IN p_nome VARCHAR(100),
    IN p_descricao VARCHAR(255)
)
BEGIN
    UPDATE Rota SET nome = p_nome, descricao = p_descricao WHERE rota_id = p_rota_id;
END;

-- Remover Rota
CREATE PROCEDURE RemoverRota(
    IN p_rota_id INT
)
BEGIN
    DELETE FROM Rota WHERE rota_id = p_rota_id;
END;

-- Adicionar Horário
CREATE PROCEDURE AdicionarHorario(
    IN p_rota_id INT,
    IN p_paragem_id INT,
    IN p_hora TIME
)
BEGIN
    INSERT INTO Horario (rota_id, paragem_id, hora) VALUES (p_rota_id, p_paragem_id, p_hora);
END;

-- Editar Horário
CREATE PROCEDURE EditarHorario(
    IN p_horario_id INT,
    IN p_hora TIME
)
BEGIN
    UPDATE Horario SET hora = p_hora WHERE horario_id = p_horario_id;
END;

-- Remover Horário
CREATE PROCEDURE RemoverHorario(
    IN p_horario_id INT
)
BEGIN
    DELETE FROM Horario WHERE horario_id = p_horario_id;
END;

-- Adicionar Paragem
CREATE PROCEDURE AdicionarParagem(
    IN p_nome VARCHAR(100),
    IN p_latitude DECIMAL(10, 6),
    IN p_longitude DECIMAL(10, 6)
)
BEGIN
    INSERT INTO Paragem (nome, latitude, longitude) VALUES (p_nome, p_latitude, p_longitude);
END;

-- Editar Paragem
CREATE PROCEDURE EditarParagem(
    IN p_paragem_id INT,
    IN p_nome VARCHAR(100),
    IN p_latitude DECIMAL(10, 6),
    IN p_longitude DECIMAL(10, 6)
)
BEGIN
    UPDATE Paragem SET nome = p_nome, latitude = p_latitude, longitude = p_longitude WHERE paragem_id = p_paragem_id;
END;

-- Remover Paragem
CREATE PROCEDURE RemoverParagem(
    IN p_paragem_id INT
)
BEGIN
    DELETE FROM Paragem WHERE paragem_id = p_paragem_id;
END;



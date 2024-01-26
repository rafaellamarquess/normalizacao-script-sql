use uc4atividades;

-- Cliente
ALTER TABLE cliente
DROP COLUMN endereco,
DROP COLUMN telefone;

-- Criação da tabela "Endereco"
CREATE TABLE endereco (
  id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  nome_rua VARCHAR(255) NOT NULL,
  complemento VARCHAR(255) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);

-- Criação da tabela "Telefone"
CREATE TABLE telefone (
  id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  telefone_celular VARCHAR(15) NOT NULL,
  telefone_residencial VARCHAR(15) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);


-- Tabela "Itens" para normalizar a tabela "Item_venda"
CREATE TABLE itens (
  id INT NOT NULL AUTO_INCREMENT,
  nome_produto VARCHAR(255) NOT NULL,
  produto_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (produto_id) REFERENCES produto(id)
  );
  
ALTER TABLE item_venda
ADD COLUMN item_id INT NOT NULL;
  
-- Tabela "Cliente_Venda"
CREATE TABLE cliente_venda (
  venda_id INT NOT NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (venda_id),
  FOREIGN KEY (venda_id) REFERENCES venda(id),
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Tabela "Funcionario_Venda"
CREATE TABLE funcionario_venda (
  venda_id INT NOT NULL,
  funcionario_id INT NOT NULL,
  PRIMARY KEY (venda_id),
  FOREIGN KEY (venda_id) REFERENCES venda(id),
  FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);



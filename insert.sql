use loja;

-- Inserir dados estados (usando INSERT IGNORE para evitar duplicados)
INSERT IGNORE INTO estado (Nome, Uf)
VALUES
  ('São Paulo', 'SP'),
  ('Brasília', 'DF'),
  ('Rio de Janeiro', 'RJ'),
  ('Minas Gerais', 'MG');

-- Inserir dados municípios (usando INSERT IGNORE y LEFT JOIN)
INSERT IGNORE INTO municipio (Nome, Cod, fk_id)
SELECT m.Nome, m.Cod, e.Id
FROM
  (
    SELECT 'São Paulo' AS Nome, '01000-000' AS Cod, 'SP' AS Uf
    UNION
    SELECT 'Brasília', '70000-000', 'DF'
    UNION
    SELECT 'Rio de Janeiro', '20000-000', 'RJ'
    UNION
    SELECT 'Belo Horizonte', '30000-000', 'MG'
  ) AS m
LEFT JOIN estado e ON m.Uf = e.Uf;


-- Inserción de datos en la tabla cliente
INSERT INTO cliente (Nome, Cpf, Celular, EndNumero, EndMunicipio, EndCEP, Municipio_id)
VALUES
  ('Juan Perez', '12345678901', '9876543210', 123, 1, '01000-000', 1),
  ('Ana Silva', '98765432101', '1234567890', 456, 2, '20000-000', 2),
  ('Carlos Santos', '23456789012', '1112223334', 789, 3, '30000-000', 3);


INSERT INTO conta_receber (cliente_id, factura_ventaid, dataconta, data_vencimiento, valor, situacao)
VALUES
  (1, 101, '2023-01-15', '2023-02-15', 1500.00, '1'),
  (2, 102, '2023-02-01', '2023-03-01', 2000.00, '2'),
  (3, 103, '2023-03-10', '2023-04-10', 1200.00, '3');









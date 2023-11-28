use loja;

-- Criação da VIEW
CREATE VIEW contas_nao_pagas AS
SELECT
    cr.Id AS Id_da_conta,
    c.Nome AS Nome_do_Cliente,
    c.Cpf AS CPF_do_Cliente,
    cr.data_vencimiento AS Data_vencimiento,
    cr.valor AS Valor_da_conta
FROM
    conta_receber cr
JOIN
    cliente c ON cr.cliente_id = c.Id
WHERE
    cr.situacao = '1';

-- Exemplo de Uso da VIEW
SELECT * FROM contas_nao_pagas;

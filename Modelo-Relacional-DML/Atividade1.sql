-- Atividade 1 - a) 
INSERT INTO EMPREGADO VALUES (
  '943775543', 'Roberto', 'F', 'Silva', 'M',
  'Rua X, 22 - Araucária - PR', '1952-06-21',
  '888665555', '1', 58000
);

-- Atividade 1 - b)
INSERT INTO PROJETO VALUES ('4', 'ProdutoA', 'Araucaria', '2');
-- Violação de constrainst de chave estrangeira, não existe o dnum 2 na tabela "departamento"

-- Atividade 1 - c)
INSERT INTO DEPARTAMENTO VALUES ('4', 'Produção', '943775543', '1998-10-01');
-- Violação de unique constraint, já existe o dnum 4 na table departamento

-- Atividade 1 - d)
INSERT INTO TRABALHA VALUES ('677678989', null, 40.0);
-- Violação de not-null constraint, a columan pno não pode ser nula e é chave primária 

-- Atividade 1 - e)
INSERT INTO DEPENDENTE VALUES ('453453453', 'Joao', 'M', '1970-12-12', 'CONJUGE');

-- Atividade 1 - f)
DELETE FROM TRABALHA WHERE essn = '333445555';

-- Atividade 1 - g)
DELETE FROM EMPREGADO WHERE ssn = '987654321';
-- Violação de constraint de chave estrangeira, ainda existem dependentes desse empregado em outras tabelas 

-- Atividade 1 - h)
DELETE FROM PROJETO WHERE pjnome = 'ProdutoX';
-- Violação de constraint de chave estrangeira, esse projeto ainda é referenciado em trabalha 

-- Atividade 1 - i)
UPDATE DEPARTAMENTO
SET gerssn = '123456789', gerdatainicio = '1999-01-10'
WHERE dnumero = '5';

-- Atividade 1 - j)
UPDATE EMPREGADO
SET superssn = '943775543'
WHERE ssn = '999887777';

-- Atividade 1 - l)
UPDATE TRABALHA
SET horas = 5.0
WHERE essn = '999887777' AND pno = '10';
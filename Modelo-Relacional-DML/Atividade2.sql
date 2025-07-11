-- Atividade 2 - a)
SELECT essn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn ASC, parentesco DESC;

-- Atividade 2 - b)
SELECT E.pnome, E.unome, E.endereco
FROM EMPREGADO E
JOIN DEPARTAMENTO D ON E.dno = D.dnumero
WHERE D.dnome = 'Pesquisa';

-- Atividade 2 - c)
SELECT P.pjnome, D.dnome, E.unome, E.endereco, E.datanasc
FROM PROJETO P
JOIN DEPARTAMENTO D ON P.dnum = D.dnumero
JOIN EMPREGADO E ON D.gerssn = E.ssn
WHERE P.plocal = 'Araucaria';

-- Atividade 2 - d)
SELECT DISTINCT E.pnome, E.unome
FROM EMPREGADO E
JOIN TRABALHA T ON E.ssn = T.essn
JOIN PROJETO P ON T.pno = P.pnumero
WHERE P.pjnome = 'Automatizacao' AND T.horas > 10;

-- Atividade 2 - e)
SELECT pnome, unome, salario
FROM EMPREGADO
ORDER BY salario DESC
LIMIT 3;

-- Atividade 2 - f)
SELECT DISTINCT E.pnome, E.unome, (S.salario * 1.20) AS salario_com_aumento
FROM EMPREGADO E
JOIN EMPREGADO S ON E.superssn = S.ssn;

-- Atividade 2 - g)
SELECT D.dnome, L.dlocalizacao
FROM DEPARTAMENTO D
JOIN LOCALIZACAO L ON D.dnumero = L.dnum;

-- Atividade 2 - h)
SELECT D.dnome, P.pjnome
FROM DEPARTAMENTO D
JOIN PROJETO P ON D.dnumero = P.dnum;

-- Atividade 2 - i)
SELECT pnome, unome, datanasc
FROM EMPREGADO
WHERE sexo = 'F' AND salario > 30000;

-- Atividade 2 - j)
SELECT P.pjnome
FROM EMPREGADO E
JOIN TRABALHA T ON E.ssn = T.essn
JOIN PROJETO P ON T.pno = P.pnumero
WHERE E.pnome = 'Fabio';

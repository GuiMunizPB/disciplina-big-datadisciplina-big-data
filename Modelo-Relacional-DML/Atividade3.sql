-- Atividade 3 - a)
SELECT E.ssn, E.pnome || ' ' || E.unome AS nome_completo
FROM EMPREGADO E
JOIN EMPREGADO S ON E.superssn = S.ssn
WHERE E.dno <> S.dno;
-- Mostra os empregados que o supervisor pertence a um departamento diferente

-- Atividade 3 - b)
SELECT essn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn ASC, parentesco DESC;

-- Atividade 3 - c)
SELECT E.pnome, E.unome
FROM EMPREGADO E
WHERE E.superssn = (
  SELECT ssn FROM EMPREGADO
  WHERE pnome = 'Joaquim' AND inicialm = 'E' AND unome = 'Brito'
);
-- Seleciona os empregados que possuem supervisor como "Joaquim E Brito"

-- Atividade 3 - d)
SELECT DISTINCT P.pnumero, P.pjnome
FROM PROJETO P
JOIN TRABALHA T ON P.pnumero = T.pno
JOIN EMPREGADO E ON T.essn = E.ssn
WHERE E.unome = 'Will'

UNION

SELECT DISTINCT P.pnumero, P.pjnome
FROM PROJETO P
JOIN DEPARTAMENTO D ON P.dnum = D.dnumero
JOIN EMPREGADO E ON D.gerssn = E.ssn
WHERE E.unome = 'Will';
-- Inclui projetos em que Will participa diretamente ou como gerente

-- Atividade 3 - e)
SELECT DISTINCT E.pnome, E.unome
FROM EMPREGADO E
JOIN TRABALHA T ON E.ssn = T.essn
JOIN PROJETO P ON T.pno = P.pnumero
WHERE P.dnum = '5';
-- Empregados que trabalham em projetos do departamento 5

-- Atividade 3 - f)
SELECT DISTINCT E.pnome, E.unome, E.endereco
FROM EMPREGADO E
JOIN TRABALHA T ON E.ssn = T.essn
JOIN PROJETO P ON T.pno = P.pnumero
JOIN DEPARTAMENTO D ON E.dno = D.dnumero
WHERE P.plocal = 'Curitiba'
  AND D.dnumero NOT IN (
    SELECT dnum FROM LOCALIZACAO WHERE dlocalizacao = 'Curitiba'
  );
-- Empregados que trabalham em projetos em Curitiba, mas departamento não está em Curitiba

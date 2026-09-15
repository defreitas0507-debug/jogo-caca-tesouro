PRAGMA foreign_keys = ON;

CREATE VIEW IF NOT EXISTS vw_resultado_partida AS
SELECT
    p.id AS partida,
    p.percentual_nivel1 AS nivel1_percentual,
    p.percentual_nivel2 AS nivel2_percentual,
    p.percentual_nivel3 AS nivel3_percentual,
    p.bateria_final,
    p.creditos_obtidos,
    p.nivel_atingido,
    CASE p.tesouro_encontrado WHEN 1 THEN 'SIM' ELSE 'NAO' END AS tesouro_encontrado,
    p.rodadas,
    '[' || p.linha_risco || ',' || p.coluna_risco || ']' AS posicao_risco
FROM partidas p;

SELECT * FROM vw_resultado_partida;

SELECT
    numero AS casa,
    '[' || linha || ',' || coluna || ']' AS posicao,
    nivel,
    conteudo
FROM casas
WHERE partida_id = 1
ORDER BY numero;

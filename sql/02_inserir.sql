PRAGMA foreign_keys = ON;

INSERT INTO partidas (
    percentual_nivel1, percentual_nivel2, percentual_nivel3,
    bateria_inicial, bateria_final, creditos_obtidos,
    nivel_atingido, tesouro_encontrado, rodadas, linha_risco, coluna_risco
) VALUES (25, 35, 40, 100, 57, 15, 3, 1, 20, 2, 1);

-- Cenario de exemplo: 25%, 35%, 40% -> Nivel I: casas 1-6,
-- Nivel II: casas 7-15, Nivel III: casas 16-25.
-- B05, B10, Risco e Tesouro nao ocupam a mesma casa.
INSERT INTO casas (partida_id, numero, linha, coluna, nivel, conteudo) VALUES
(1, 1, 0, 0, 1, 'VAZIA'),
(1, 2, 0, 1, 1, 'VAZIA'),
(1, 3, 0, 2, 1, 'B05'),
(1, 4, 0, 3, 1, 'VAZIA'),
(1, 5, 0, 4, 1, 'VAZIA'),
(1, 6, 1, 0, 1, 'VAZIA'),
(1, 7, 1, 1, 2, 'VAZIA'),
(1, 8, 1, 2, 2, 'B10'),
(1, 9, 1, 3, 2, 'VAZIA'),
(1, 10, 1, 4, 2, 'VAZIA'),
(1, 11, 2, 0, 2, 'VAZIA'),
(1, 12, 2, 1, 2, 'RIS'),
(1, 13, 2, 2, 2, 'VAZIA'),
(1, 14, 2, 3, 2, 'VAZIA'),
(1, 15, 2, 4, 2, 'VAZIA'),
(1, 16, 3, 0, 3, 'VAZIA'),
(1, 17, 3, 1, 3, 'VAZIA'),
(1, 18, 3, 2, 3, 'VAZIA'),
(1, 19, 3, 3, 3, 'VAZIA'),
(1, 20, 3, 4, 3, 'TESOURO'),
(1, 21, 4, 0, 3, 'VAZIA'),
(1, 22, 4, 1, 3, 'VAZIA'),
(1, 23, 4, 2, 3, 'VAZIA'),
(1, 24, 4, 3, 3, 'VAZIA'),
(1, 25, 4, 4, 3, 'VAZIA');

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS partidas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    percentual_nivel1 INTEGER NOT NULL,
    percentual_nivel2 INTEGER NOT NULL,
    percentual_nivel3 INTEGER NOT NULL,
    bateria_inicial INTEGER NOT NULL DEFAULT 100,
    bateria_final INTEGER NOT NULL,
    creditos_obtidos INTEGER NOT NULL DEFAULT 0,
    nivel_atingido INTEGER NOT NULL,
    tesouro_encontrado INTEGER NOT NULL CHECK (tesouro_encontrado IN (0,1)),
    rodadas INTEGER NOT NULL DEFAULT 0,
    linha_risco INTEGER NOT NULL,
    coluna_risco INTEGER NOT NULL,
    CHECK (percentual_nivel1 + percentual_nivel2 + percentual_nivel3 = 100)
);

CREATE TABLE IF NOT EXISTS casas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    partida_id INTEGER NOT NULL,
    numero INTEGER NOT NULL CHECK (numero BETWEEN 1 AND 25),
    linha INTEGER NOT NULL CHECK (linha BETWEEN 0 AND 4),
    coluna INTEGER NOT NULL CHECK (coluna BETWEEN 0 AND 4),
    nivel INTEGER NOT NULL CHECK (nivel BETWEEN 1 AND 3),
    conteudo TEXT NOT NULL CHECK (conteudo IN ('VAZIA','B05','B10','RIS','TESOURO')),
    UNIQUE (partida_id, numero),
    UNIQUE (partida_id, linha, coluna),
    FOREIGN KEY (partida_id) REFERENCES partidas(id) ON DELETE CASCADE
);

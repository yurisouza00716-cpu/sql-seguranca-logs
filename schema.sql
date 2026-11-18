CREATE TABLE eventos_login (id INTEGER PRIMARY KEY, data_hora TEXT NOT NULL, ip_origem TEXT NOT NULL, usuario TEXT, resultado TEXT NOT NULL CHECK (resultado IN ('sucesso','falha')));

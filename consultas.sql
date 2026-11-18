-- 1. IPs com mais falhas de login
SELECT ip_origem, COUNT(*) AS falhas FROM eventos_login WHERE resultado = 'falha' GROUP BY ip_origem ORDER BY falhas DESC;

-- 2. Usuários mais atacados
SELECT usuario, COUNT(*) AS falhas FROM eventos_login WHERE resultado = 'falha' GROUP BY usuario ORDER BY falhas DESC;

-- 3. Taxa de falha por IP
SELECT ip_origem, SUM(resultado = 'falha') AS falhas, SUM(resultado = 'sucesso') AS sucessos, ROUND(100.0 * SUM(resultado = 'falha') / COUNT(*), 1) AS pct_falha FROM eventos_login GROUP BY ip_origem ORDER BY pct_falha DESC;

-- 4. Logins com sucesso vindos de IPs com muitas falhas (possivel comprometimento)
SELECT data_hora, ip_origem, usuario FROM eventos_login WHERE resultado = 'sucesso' AND ip_origem IN (SELECT ip_origem FROM eventos_login WHERE resultado = 'falha' GROUP BY ip_origem HAVING COUNT(*) >= 50) ORDER BY data_hora;

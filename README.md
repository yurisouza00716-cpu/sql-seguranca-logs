# sql-seguranca-logs

Projeto de SQL aplicado a seguranca: um banco SQLite com eventos de login SSH e consultas que respondem perguntas de um analista de SOC.

## Aviso

Os 500 eventos sao simulados (gerados com SQL, com IPs de faixas reservadas para documentacao). Nao ha nenhum dado real.

## Arquivos

- schema.sql: cria a tabela eventos_login
- dados.sql: gera os eventos simulados
- consultas.sql: consultas de analise
- logs.db: banco pronto para uso

## Consultas

1. IPs com mais falhas de login
2. Usuarios mais atacados
3. Taxa de falha por IP
4. Logins com sucesso vindos de IPs com muitas falhas (possivel comprometimento)

## Como rodar

    sqlite3 -header -column logs.db < consultas.sql

## Proximos passos

- Views e indices
- Cruzar os eventos com alertas do Wazuh do meu home lab

.mode	columns
.headers	on
.nullvalue	NULL

SELECT ID, dia_semana FROM Ocorrencia WHERE julianday(hora_inicio) >= julianday("12:00") and julianday(hora_fim) <= julianday("18:00");
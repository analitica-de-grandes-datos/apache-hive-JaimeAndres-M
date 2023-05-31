/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/


DROP TABLE IF EXISTS tabla_p1;
CREATE TABLE tabla_p1 (letra STRING, fecha STRING, numero INT)
ROW FORMAT delimited fields terminated by '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE tabla_p1;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT letra, COUNT(1) as count
FROM tabla_p1
GROUP BY letra
;
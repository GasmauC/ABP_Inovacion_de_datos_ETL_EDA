CREATE DATABASE IF NOT EXISTS abp_etl;
CREATE TABLE ventas_clientes (
    invoice_no VARCHAR(255) PRIMARY KEY,
    customer_id VARCHAR(255),
    category VARCHAR(255),
    quantity INT,
    price INT,
    invoice_date DATE,
    shopping_mall VARCHAR(255),
    gender VARCHAR(50),
    age INT,
    payment_method VARCHAR(255)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/datos_limpios_import.csv'
INTO TABLE ventas_clientes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- ¡MUY IMPORTANTE! Esto ignora la fila del encabezado (los nombres de las columnas)


-- Contamos cada método de pago, lo ordenamos de mayor a menor y tomamos solo el primero
SELECT payment_method, COUNT(*) as frecuencia_de_pago
FROM ventas_clientes
GROUP BY payment_method
ORDER BY frecuencia_de_pago DESC
LIMIT 1;

-- Modo de pago más frecuente (por Género)
(SELECT 'Female' AS gender, payment_method, COUNT(*) AS frecuencia
 FROM ventas_clientes
 WHERE gender = 'Female'
 GROUP BY payment_method
 ORDER BY frecuencia DESC
 LIMIT 1)

UNION ALL

(SELECT 'Male' AS gender, payment_method, COUNT(*) AS frecuencia
 FROM ventas_clientes
 WHERE gender = 'Male'
 GROUP BY payment_method
 ORDER BY frecuencia DESC
 LIMIT 1);
 
 -- Análisis de Comportamiento de Compra por Género
 SELECT
    category,
    gender,
    COUNT(invoice_no) AS transaction_count
FROM
    ventas_clientes
GROUP BY
    category,
    gender
ORDER BY
    category,
    gender;
 
 -- Métodos de pago para el rango etario de 25 a 35 años
SELECT payment_method, COUNT(*) AS frecuencia
FROM ventas_clientes
WHERE age BETWEEN 25 AND 35
GROUP BY payment_method
ORDER BY frecuencia DESC;


-- Precios por categoría de productos (mínimo, máximo y promedio)
SELECT
    category,
    MIN(price) AS precio_minimo,
    MAX(price) AS precio_maximo,
    AVG(price) AS precio_promedio
FROM ventas_clientes
GROUP BY category;

-- Análisis Descriptivo de Edad por Centro Comercial
SELECT
    shopping_mall,
    AVG(age) AS edad_promedio,
    MIN(age) AS edad_minima,
    MAX(age) AS edad_maxima,
    STDDEV(age)  AS desviacion_estandar_edad 
FROM
    ventas_clientes
GROUP BY
    shopping_mall
ORDER BY
    shopping_mall;
    
-- Top 2 Categorías por Grupo de Edad en cada Mall
-- Usamos una Expresión de Tabla Común (CTE) para hacer la consulta más legible

WITH RankedCategories AS (
    -- Primero, numeramos las filas para cada grupo de mall y edad,
    -- ordenando por la cantidad de transacciones de forma descendente.
    SELECT
        shopping_mall,
        age_group,
        category,
        transaction_count,
        ROW_NUMBER() OVER(PARTITION BY shopping_mall, age_group ORDER BY transaction_count DESC) as row_num
    FROM (
        -- En la subconsulta interna, creamos los grupos de edad con CASE
        -- y contamos las transacciones.
        SELECT
            shopping_mall,
            category,
            CASE
                WHEN age >= 18 AND age < 25 THEN '18-24'
                WHEN age >= 25 AND age < 35 THEN '25-34'
                WHEN age >= 35 AND age < 45 THEN '35-44'
                WHEN age >= 45 AND age < 60 THEN '45-59'
                WHEN age >= 60 THEN '60+'
            END AS age_group,
            COUNT(*) as transaction_count
        FROM
            ventas_clientes
        GROUP BY
            shopping_mall,
            category,
            age_group
    ) AS CountsByGroup
)
-- Finalmente, seleccionamos solo aquellas filas donde la numeración es 1 o 2.
SELECT
    shopping_mall,
    age_group,
    category,
    transaction_count
FROM
    RankedCategories
WHERE
    row_num <= 2
ORDER BY
    shopping_mall,
    age_group,
    transaction_count DESC;






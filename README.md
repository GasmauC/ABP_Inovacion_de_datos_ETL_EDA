# 📊 Análisis Estratégico de Comportamiento de Compra en Retail

![Python](https://img.shields.io/badge/Python-3.10-blue?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-ETL-150458?style=for-the-badge&logo=pandas&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Validation-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Data Viz](https://img.shields.io/badge/Matplotlib-Seaborn-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Finalizado-success?style=for-the-badge)

> **Trabajo Final de Integración (ABP)** - Módulo: Innovación de Datos  
> **Institución:** Instituto Superior Politécnico Córdoba (ISPC)  
> **Carrera:** Tecnicatura Superior en Ciencia de Datos e Inteligencia Artificial

---

## 📖 Descripción del Proyecto

Este proyecto nace de una necesidad crítica de negocio: **transformar la "ceguera de datos" en ventaja competitiva**. 

Analizamos un dataset de **99,457 transacciones** del sector retail (2021-2023) para identificar patrones de consumo, segmentar clientes y optimizar estrategias de venta. El flujo de trabajo abarca desde la ingeniería de datos (ETL) hasta la visualización estratégica y validación con SQL.

### 🎯 Objetivos Principales
* **Transformar datos crudos** en inteligencia de negocio accionable.
* **Identificar motores de rentabilidad** (Volumen vs. Valor).
* **Segmentar el mercado** por edad, género y ubicación geográfica (Malls).
* **Validar la integridad** del análisis mediante consultas SQL.

---

## 🛠️ Tecnologías y Herramientas

El proyecto se desarrolló utilizando un stack tecnológico centrado en el análisis de datos:

* **Lenguaje:** Python (Google Colab / Jupyter Notebooks).
* **Librerías de Manipulación:** `Pandas` (Limpieza, transformación, imputación de nulos).
* **Visualización:** `Matplotlib` y `Seaborn` (Gráficos de barras, torta e histogramas).
* **Base de Datos:** SQL (Diseño de esquema relacional y consultas de validación).

---

## ⚙️ Metodología: El Proceso ETL

El núcleo técnico del proyecto consistió en un pipeline robusto:

### 1. Extracción (Extract)
* Ingesta de dos fuentes de datos crudas: `customer_data.csv` y `sales_data.csv`.

### 2. Transformación (Transform)
* **Unión de Datasets:** Uso de `pd.merge()` para enriquecer las ventas con datos demográficos.
* **Limpieza de Datos:**
    * Imputación de **119 valores nulos** en la columna `age` utilizando la **mediana** estadística.
    * Conversión de `invoice_date` a formato `datetime`.
    * Casteo de variables numéricas (`int`) para optimizar memoria.
* **Ingeniería de Atributos:** Creación de `age_group` (bins) para segmentación etaria.

### 3. Carga y Validación (Load)
* Generación de un dataset limpio `df_final`.
* Diseño de esquema SQL `CREATE TABLE ventas_clientes` y validación de métricas clave mediante queries complejas (Joins, Unions, Window Functions).

---

## 💡 Hallazgos Clave (Insights)

Tras el análisis exploratorio (EDA), descubrimos cuatro verdades fundamentales sobre el negocio:

| Hallazgo | Descripción | Impacto Estratégico |
| :--- | :--- | :--- |
| **💸 Hábito de Efectivo** | El **44.7%** de las compras son en efectivo. | Oportunidad latente para digitalización y programas de fidelidad. |
| **🔄 Mercado Diverso** | Distribución de edad uniforme (18-69 años). | Necesidad de marketing intergeneracional, no solo enfocado en jóvenes. |
| **⚖️ Motores Duales** | **Clothing** genera volumen; **Technology** genera valor. | Estrategias diferenciadas para tráfico vs. rentabilidad. |
| **📍 Polos de Venta** | "Mall of Istanbul" y "Kanyon" concentran el **40%** de ventas. | Prioridad para pruebas piloto y personalización geográfica. |

---

## 📊 Visualizaciones Destacadas

*(Aquí puedes insertar las imágenes generadas en tu notebook, por ejemplo:)*

* **Distribución de Métodos de Pago:** Evidencia la dependencia del efectivo.
* **Ventas por Categoría y Género:** Muestra cómo el segmento femenino lidera el volumen en Ropa y Cosméticos.
* **Top Categorías por Mall:** Comparativa de rendimiento entre centros comerciales.

---

## 🗄️ Estructura del Repositorio

```text
├── data/                   # Archivos CSV crudos (customer_data, sales_data)
├── notebooks/              # Jupyter Notebooks con el proceso ETL y EDA
├── sql/                    # Scripts de creación de tablas y consultas de validación
├── reports/                # Informes en PDF (Ejecutivo y Técnico)
├── images/                 # Gráficos generados para el README
└── README.md               # Documentación del proyecto

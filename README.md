# 📊 Análisis Estratégico Retail: ETL, EDA & Business Intelligence

**Transformación de datos crudos en estrategias de negocio rentables.**

Este proyecto aborda una problemática común en el sector retail: la incapacidad de extraer valor de grandes volúmenes de datos transaccionales. A través de un pipeline **ETL (Extract, Transform, Load)** y un **Análisis Exploratorio de Datos (EDA)**, se procesaron más de 99,000 registros para diseñar estrategias de marketing segmentado y optimización de inventario.

![Python](https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-ETL-150458?style=for-the-badge&logo=pandas&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Validation-orange?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Estado-Finalizado-success?style=for-the-badge)

## 💼 Contexto del Negocio

Una empresa de retail posee datos históricos de ventas y clientes, pero carece de inteligencia de negocios.
**El Desafío:** Responder preguntas críticas como: *¿Quiénes son nuestros clientes más valiosos? ¿Qué métodos de pago prefieren? ¿Cómo varía el consumo entre diferentes centros comerciales?*

**El Objetivo:** Pasar de un enfoque intuitivo a uno **Data-Driven**, permitiendo:
* Campañas de marketing personalizadas.
* Gestión eficiente de stock en categorías de alto valor.
* Fidelización de clientes mediante digitalización de pagos.

## ⚙️ Arquitectura del Proyecto (Pipeline)

El flujo de trabajo sigue el ciclo de vida estándar de la Ciencia de Datos:

```mermaid
graph LR
A[Datos Crudos CSV] --> B(Limpieza con Pandas);
B --> C{Transformación & Enriquecimiento};
C --> D[Carga a SQL / CSV Limpio];
D --> E[Análisis Exploratorio (EDA)];
E --> F[Insights & Estrategia];

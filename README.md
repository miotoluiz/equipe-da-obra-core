# Construction Management System - Core Operations

An enterprise-grade relational database schema designed to manage mid-sized construction operations, project tracking, and high-performance financial matrices. This system focuses heavily on robust data consistency and business logic enforcement.

## 🛠️ Tech Stack & Specifications
* **Database Engine:** Oracle Database 21c (Relational Schema)
* **Modeling Environment:** Oracle SQL Developer Data Modeler
* **Cloud Infrastructure:** Oracle APEX (Application Express)
* **Design Pattern:** Modular Architecture (Core Operations Module)

---

## 📐 Database Architecture Diagram

> 💡 **Developer Note:** [Insert your Oracle Data Modeler exported diagram image here once you upload it to the repo, e.g., `![Schema Diagram](image_e4e848.jpg)`]

---

## ⚙️ Core Business Rules Enforced

1. **Manager Responsibility:** Every construction project is explicitly assigned to a certified Technical Manager (from the `managers` table) to maintain strict accountability.
2. **Financial Precision:** The `budgets` table implements an automated Virtual Column (`total_value`) that guarantees real-time calculation of construction values without risk of data desynchronization between material, labor, and profit margins.
3. **Temporal Integrity:** Date check constraints (`CHK`) prevent chronological anomalies, ensuring that estimated end dates and stage completions can never occur before their respective start dates.
4. **Cascading Operations:** Relational dependencies use `ON DELETE CASCADE` strategies where operationally safe (e.g., removing a project automatically cleans up its timeline stages and temporary labor allocations).

---

## 📂 Project Structure

* `01_Schema.sql` - Complete Data Definition Language (DDL) script including tables, identity sequences, and relational constraints.
* `02_Seed_Data.sql` - Production-ready Data Manipulation Language (DML) script containing mock data for localized testing.
* `Data_dictionary.md` - Complete data dictionary mapping types, definitions, and field constraints.

---

## 📈 Future Modular Enhancements

This repository contains the **Core Operations Module**. The architecture was built from the ground up to support seamless modular scalability. Future releases will introduce:
* **Financial Module:** Comprehensive cash flow tracking, invoice generation, and customer payment installments.
* **Procurement Module:** Subcontractor contracts, material supply logs, and automated purchase orders.
* **HR Module:** Internal payroll, employee timesheets, and corporate administrative logging.
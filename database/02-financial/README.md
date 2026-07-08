# Construction Management System - Core Financials

An enterprise-grade financial management database layer designed to handle cash flow tracking, invoice state machines, contract milestone billing, and real-time expenditure metrics. This module connects directly to the core operations layer to deliver granular visibility over project profitability.

## 🛠️ Tech Stack & Specifications
* **Database Engine:** Oracle Database 21c (Relational Schema)
* **Modeling Environment:** Oracle SQL Developer Data Modeler
* **Cloud Infrastructure:** Oracle APEX (Application Express)
* **Design Pattern:** Modular Architecture (Core Financials Module)

---

## ⚙️ Core Business Rules Enforced

1. **Relational Inflow Mapping:** Every invoice (`invoices`) generated must be linked to an existing active operational project, allowing a precise breakdown of billing vs. execution stage.
2. **Payment Lifecycle Ledger:** The `payments_received` table tracks individual transactions against issued invoices, allowing partial payments (milestone billing) and enforcing strict identity sequencing for audit trials.
3. **Outlay Categorization:** Project-specific expenditures are captured instantly within the `operational_expenses` table, dividing costs into operational categories (Materials, Logistics, Permissions) to isolate operational overhead from fixed material costs.
4. **Cascading Integrity:** To prevent orphaned accounting entries, critical constraints implement `ON DELETE CASCADE` routines, ensuring that if a project or an invoice is dropped, all related logs are accurately cleared.

---

## 📂 Project Structure

* `01_ddl_schema.sql` - Complete Data Definition Language (DDL) script establishing billing tables, primary keys, and cross-module foreign key constraints.
* `02_seed_data.sql` - Data Manipulation Language (DML) script containing production-ready financial logs, invoices, and expenses for localized testing.
* `03_queries.sql` - Advanced analytical queries tracking real-time project profitability and cash flow metrics.
* `04_data_dictionary.md` - Complete data dictionary mapping types, business logic definitions, and financial constraints.

---

## 📈 Scalability Overview

This repository hosts the **Core Financials Module**, expanding the core engine. The schema operates as a decoupled micro-architecture ready to integrate seamlessly with upcoming modules:
* **Procurement Module:** Direct mapping of supplier purchase orders to the `operational_expenses` register.
* **HR Module:** Automated payroll settlement pipelines flowing into the operational labor cost tracking.
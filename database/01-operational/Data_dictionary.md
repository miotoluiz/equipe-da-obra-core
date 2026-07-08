# Data Dictionary - Core Operations Module

This document provides the technical specifications, data types, and business constraints for the database schema of **Equipe da Obra Ltda.**

---

## 1. Table: `managers`
Stores the technical professionals responsible for project execution and budget creation.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `manager_id` | NUMBER | PK, Identity | Unique internal identifier for the manager. |
| `first_name` | VARCHAR2(50) | NOT NULL | First name of the technical professional. |
| `last_name` | VARCHAR2(50) | NOT NULL | Last name of the technical professional. |
| `role` | VARCHAR2(50) | NOT NULL | Professional designation (e.g., Project Manager). |
| `email` | VARCHAR2(100)| UNIQUE | Professional email address. |
| `phone` | VARCHAR2(20) | None | Contact phone number. |

---

## 2. Table: `customers`
Stores clients who contract the construction and renovation services.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `customer_id`| NUMBER | PK, Identity | Unique internal identifier for the customer. |
| `first_name` | VARCHAR2(50) | NOT NULL | First name of the client. |
| `last_name` | VARCHAR2(50) | NOT NULL | Last name of the client. |
| `email` | VARCHAR2(100)| UNIQUE | Contact email address for contracts. |
| `phone` | VARCHAR2(20) | None | Contact phone number. |

---

## 3. Table: `projects`
Stores the construction projects managed by the company.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `project_id` | NUMBER | PK, Identity | Unique internal identifier for the project. |
| `customer_id`| NUMBER | FK (customers) | Links the project to the owner. |
| `manager_id` | NUMBER | FK (managers)  | Links the project to the technical supervisor. |
| `project_name`| VARCHAR2(100)| NOT NULL | Name or title of the construction site. |
| `location` | VARCHAR2(255)| NOT NULL | Full physical address of the site. |
| `start_date` | DATE | NOT NULL | Scheduled or actual start date. |
| `estimated_end_date`| DATE| NOT NULL | Target completion date. Must be >= start_date. |
| `status` | VARCHAR2(30) | NOT NULL | Operational state (Planning, Active, Completed). |

---

## 4. Table: `budgets`
Handles the financial matrix and profit calculations for each project.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `budget_id` | NUMBER | PK, Identity | Unique internal identifier for the financial log. |
| `project_id` | NUMBER | FK (projects), UK| Unique link to a project (1:1 relationship). |
| `creator_id` | NUMBER | FK (managers)  | The manager who calculated the costs. |
| `estimated_material_cost`| NUMBER(12,2)| NOT NULL | Budget allocated for materials. |
| `estimated_labor_cost`| NUMBER(12,2)| NOT NULL | Budget allocated for workforce payment. |
| `base_profit_margin`| NUMBER(12,2)| NOT NULL | Company's base targeted profit. |
| `additional_margin`| NUMBER(12,2)| NOT NULL | Custom contractual or extra security margin. |
| `total_value` | NUMBER(12,2)| Virtual Column| Automated sum of all material, labor, and margins. |

---

## 5. Table: `project_stages`
Manages the technical execution steps and timeline chronogram.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `stage_id` | NUMBER | PK, Identity | Unique identifier for the timeline milestone. |
| `project_id` | NUMBER | FK (projects)  | The project this stage belongs to. |
| `stage_name` | VARCHAR2(100)| NOT NULL | Technical step description (e.g., Demolition). |
| `start_date` | DATE | NOT NULL | Execution start date for this milestone. |
| `end_date` | DATE | None | Completion date for this milestone. |
| `status` | VARCHAR2(30) | NOT NULL | Progress status (Not Started, In Progress, Done). |

---

## 6. Table: `labor_force`
Allocates field professionals and trade specialists to specific sites.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `labor_id` | NUMBER | PK, Identity | Unique identifier for the team allocation. |
| `project_id` | NUMBER | FK (projects)  | The site where the worker is assigned. |
| `worker_name`| VARCHAR2(100)| NOT NULL | Full name of the professional or technician. |
| `specialty` | VARCHAR2(50) | NOT NULL | Trade expertise (e.g., Electrician, Bricklayer). |
| `daily_rate` | NUMBER(10,2)| NOT NULL | Individual daily payment rate. |
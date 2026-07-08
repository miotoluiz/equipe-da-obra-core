# Financial Module Data Dictionary

This document details the relational data dictionary for the core financial tables of the enterprise system.

## 1. Table: `invoices`
Stores information about billing records, progress measurements, and client invoices.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `invoice_id` | NUMBER | PRIMARY KEY, IDENTITY | Unique system auto-incremented identifier for the invoice. |
| `project_id` | NUMBER | FOREIGN KEY -> `projects` | Associated construction project. |
| `invoice_number` | VARCHAR2(50) | UNIQUE, NOT NULL | Legal/Commercial invoice tracker identifier. |
| `issue_date` | DATE | NOT NULL | Date when the invoice was generated. |
| `due_date` | DATE | NOT NULL | Deadline payment date for the client. |
| `invoice_amount` | NUMBER(12,2) | NOT NULL | Total financial value billed. |
| `status` | VARCHAR2(30) | DEFAULT 'Issued' | Current state ('Issued', 'Paid', 'Partially Paid', 'Overdue'). |

## 2. Table: `payments_received`
Tracks cash inflows, partial or full, mapped to invoices.

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `payment_id` | NUMBER | PRIMARY KEY, IDENTITY | Unique payment transaction identifier. |
| `invoice_id` | NUMBER | FOREIGN KEY -> `invoices` | Target invoice tracking this payment. |
| `payment_date` | DATE | NOT NULL | Transaction execution timestamp date. |
| `amount_received`| NUMBER(12,2) | NOT NULL | Absolute financial amount processed into business assets. |
| `payment_method` | VARCHAR2(50) | NOT NULL | Gateway settlement type used (e.g., 'Pix', 'Bank Transfer'). |

## 3. Table: `operational_expenses`
Logs outlays and absolute project expenditures (materials, local logistics, permissions).

| Column Name | Data Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `expense_id` | NUMBER | PRIMARY KEY, IDENTITY | Absolute identifier for the cost expense log. |
| `project_id` | NUMBER | FOREIGN KEY -> `projects` | Target project consuming the infrastructure budget. |
| `description` | VARCHAR2(255)| NOT NULL | Business purpose or item description. |
| `expense_date` | DATE | NOT NULL | When the expense occurred. |
| `expense_amount` | NUMBER(12,2) | NOT NULL | Hard transaction value paid out. |
| `category` | VARCHAR2(50) | NOT NULL | Expense segmentation classification filter group. |
-- ===========================================================================
-- DML SCRIPT: SEED DATA FOR DEMONSTRATION (INTERNATIONAL STANDARD)
-- Project: Equipe da Obra Ltda. - Core Operations Module
-- File: 02_seed_data.sql
-- ===========================================================================

-- Limpando dados anteriores para evitar conflitos de chaves primárias em testes
DELETE FROM labor_force;
DELETE FROM project_stages;
DELETE FROM budgets;
DELETE FROM projects;
DELETE FROM managers;
DELETE FROM customers;
COMMIT;

-- ===========================================================================
-- 1. POPULATING TECHNICAL MANAGERS (IDs FIXOS: 1 e 2)
-- ===========================================================================
INSERT INTO managers (manager_id, first_name, last_name, role, email, phone)
VALUES (1, 'Arthur', 'Pendelton', 'Project Manager', 'arthur.p@equipeobra.com', '+15550144');

INSERT INTO managers (manager_id, first_name, last_name, role, email, phone)
VALUES (2, 'Sarah', 'Conner', 'Quantity Surveyor', 'sarah.c@equipeobra.com', '+15550177');

-- ===========================================================================
-- 2. POPULATING CUSTOMERS (IDs FIXOS: 1 e 2)
-- ===========================================================================
INSERT INTO customers (customer_id, first_name, last_name, email, phone)
VALUES (1, 'Robert', 'Downey', 'robert.d@clientmail.com', '+15550199');

INSERT INTO customers (customer_id, first_name, last_name, email, phone)
VALUES (2, 'Linda', 'Hamilton', 'linda.h@clientmail.com', '+15550122');

-- ===========================================================================
-- 3. POPULATING PROJECTS (IDs FIXOS: 100 e 200 para evitar conflito com autoincremento)
-- ===========================================================================
-- Project 100: Managed by Arthur (manager_id = 1) for Robert (customer_id = 1)
INSERT INTO projects (project_id, customer_id, manager_id, project_name, location, start_date, estimated_end_date, status)
VALUES (100, 1, 1, 'High-End Duplex Renovation', 'Miami Beach, FL', TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-12-01', 'YYYY-MM-DD'), 'Planning');

-- Project 200: Managed by Arthur (manager_id = 1) for Linda (customer_id = 2)
INSERT INTO projects (project_id, customer_id, manager_id, project_name, location, start_date, estimated_end_date, status)
VALUES (200, 2, 1, 'Commercial Office Fit-Out', 'Downtown Brickell, FL', TO_DATE('2026-07-15', 'YYYY-MM-DD'), TO_DATE('2026-10-15', 'YYYY-MM-DD'), 'Planning');

-- ===========================================================================
-- 4. POPULATING BUDGETS (Usando project_id e manager_id corretos)
-- ===========================================================================
-- Budget for Project 100: Calculated by Sarah (manager_id = 2) ou Arthur (manager_id = 1)
INSERT INTO budgets (project_id, manager_id, estimated_material_cost, estimated_labor_cost, base_profit_margin, additional_margin)
VALUES (100, 1, 180000.00, 120000.00, 80000.00, 12000.00);

-- Budget for Project 200: Calculated by Sarah (manager_id = 2)
INSERT INTO budgets (project_id, manager_id, estimated_material_cost, estimated_labor_cost, base_profit_margin, additional_margin)
VALUES (200, 2, 45000.00, 35000.00, 20000.00, 5000.00);

-- ===========================================================================
-- 5. POPULATING PROJECT STAGES (Usando project_id = 100)
-- ===========================================================================
INSERT INTO project_stages (project_id, stage_name, start_date, end_date, status)
VALUES (100, 'Demolition & Structural Reinforcement', TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-07-15', 'YYYY-MM-DD'), 'Not Started');

INSERT INTO project_stages (project_id, stage_name, start_date, end_date, status)
VALUES (100, 'Drywall & Framing', TO_DATE('2026-07-16', 'YYYY-MM-DD'), TO_DATE('2026-09-01', 'YYYY-MM-DD'), 'Not Started');

-- ===========================================================================
-- 6. POPULATING LABOR FORCE (Usando project_id = 100)
-- ===========================================================================
INSERT INTO labor_force (project_id, worker_name, specialty, daily_rate)
VALUES (100, 'David Miller', 'Electrician', 250.00);

INSERT INTO labor_force (project_id, worker_name, specialty, daily_rate)
VALUES (100, 'John Smith', 'Master Bricklayer', 300.00);

COMMIT;
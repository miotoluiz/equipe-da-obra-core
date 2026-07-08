-- ===========================================================================
-- MÓDULO FINANCEIRO CORE - DADOS INICIAIS (DML)
-- ===========================================================================

-- 1. Inserir Notas Fiscais (Invoices) emitidas para os projetos operacionais
-- Projeto 100: Reforma Comercial Centro / Projeto 200: Residencial Duplex Guriri
INSERT INTO invoices (invoice_id, project_id, invoice_number, issue_date, due_date, invoice_amount, status)
VALUES (1, 100, 'NF-2026-001', TO_DATE('2026-07-15', 'YYYY-MM-DD'), TO_DATE('2026-08-15', 'YYYY-MM-DD'), 50000.00, 'Paid');

INSERT INTO invoices (invoice_id, project_id, invoice_number, issue_date, due_date, invoice_amount, status)
VALUES (2, 100, 'NF-2026-002', TO_DATE('2026-08-15', 'YYYY-MM-DD'), TO_DATE('2026-09-15', 'YYYY-MM-DD'), 45000.00, 'Issued');

INSERT INTO invoices (invoice_id, project_id, invoice_number, issue_date, due_date, invoice_amount, status)
VALUES (3, 200, 'NF-2026-003', TO_DATE('2026-08-05', 'YYYY-MM-DD'), TO_DATE('2026-09-05', 'YYYY-MM-DD'), 85000.00, 'Partially Paid');


-- 2. Inserir Histórico de Pagamentos Recebidos dos clientes (Payments Received)
-- Pagamento total da NF 001
INSERT INTO payments_received (payment_id, invoice_id, payment_date, amount_received, payment_method)
VALUES (1, 1, TO_DATE('2026-08-10', 'YYYY-MM-DD'), 50000.00, 'Pix');

-- Pagamento parcial da NF 003 (Sinal de entrada da medição da obra de Guriri)
INSERT INTO payments_received (payment_id, invoice_id, payment_date, amount_received, payment_method)
VALUES (2, 3, TO_DATE('2026-08-06', 'YYYY-MM-DD'), 40000.00, 'Bank Transfer');


-- 3. Inserir Despesas Operacionais Reais da Obra (Operational Expenses)
-- Custos reais de materiais e taxas logísticas da obra de Guriri (Projeto 200) e Centro (Projeto 100)
INSERT INTO operational_expenses (expense_id, project_id, description, expense_date, expense_amount, category)
VALUES (1, 100, 'Compra de Sacos de Cimento CP-II', TO_DATE('2026-07-12', 'YYYY-MM-DD'), 4500.00, 'Materials');

INSERT INTO operational_expenses (expense_id, project_id, description, expense_date, expense_amount, category)
VALUES (2, 100, 'Locação de Caçamba de Entulho', TO_DATE('2026-07-13', 'YYYY-MM-DD'), 1200.00, 'Logistics');

INSERT INTO operational_expenses (expense_id, project_id, description, expense_date, expense_amount, category)
VALUES (3, 200, 'Adiantamento de Material de Fundação (Aço/Ferro)', TO_DATE('2026-08-02', 'YYYY-MM-DD'), 18500.00, 'Materials');

INSERT INTO operational_expenses (expense_id, project_id, description, expense_date, expense_amount, category)
VALUES (4, 200, 'Taxa de Alvará de Execução e Licenças Municipais', TO_DATE('2026-08-03', 'YYYY-MM-DD'), 2800.00, 'Permissions');

COMMIT;
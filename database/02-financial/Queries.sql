-- ===========================================================================
-- MÓDULO FINANCEIRO - CONSULTAS ANALÍTICAS (QUERIES)
-- ===========================================================================

-- CONSULTA 1: Fluxo de Caixa por Projeto (Total Faturado vs. Total Recebido vs. Despesas Reais)
SELECT 
    p.project_id,
    p.name AS project_name,
    NVL(SUM(i.invoice_amount), 0) AS total_invoiced,
    (SELECT NVL(SUM(pr.amount_received), 0) FROM payments_received pr WHERE pr.invoice_id IN (SELECT invoice_id FROM invoices WHERE project_id = p.project_id)) AS total_received,
    NVL(SUM(oe.expense_amount), 0) AS total_operational_expenses
FROM projects p
LEFT JOIN invoices i ON p.project_id = i.project_id
LEFT JOIN operational_expenses oe ON p.project_id = oe.project_id
GROUP BY p.project_id, p.name
ORDER BY p.project_id;


-- CONSULTA 2: Balanço de Notas Fiscais Inadimplentes ou com Saldo Devedor
SELECT 
    i.invoice_number,
    p.name AS project_name,
    i.invoice_amount,
    NVL(SUM(pr.amount_received), 0) AS total_paid,
    (i.invoice_amount - NVL(SUM(pr.amount_received), 0)) AS outstanding_balance,
    i.status
FROM invoices i
JOIN projects p ON i.project_id = p.project_id
LEFT JOIN payments_received pr ON i.invoice_id = pr.invoice_id
WHERE i.status <> 'Paid'
GROUP BY i.invoice_number, p.name, i.invoice_amount, i.status
ORDER BY i.invoice_number;
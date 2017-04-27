SELECT BudgetID, cp.BeginDate AS PeriodBegin, cp.EndDate AS PeriodEnd, tp.BeginDate AS TotalBegin, tp.EndDate AS TotalEnd, cp.OtherDirectCosts + cp.FnACosts + cp.SalariesWagesFringes AS PeriodCost,
tp.OtherDirectCosts + tp.FnACosts + tp.SalariesWagesFringes AS TotalCost
 FROM Budget b
JOIN BudgetPeriod cp ON cp.BudgetPeriodID = b.BudgetCurrentPeriodID
JOIN BudgetPeriod tp ON tp.BudgetPeriodID = b.BudgetTotalProjPeriodID;
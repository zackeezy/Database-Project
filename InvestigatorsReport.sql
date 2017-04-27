select i.FirstName, i.LastName, i.CollegeProgram, i.Department, i.Email, pn.AreaCode, p.ProposalID, a.AwardID, pn.Number
from Investigator i
join PhoneInvestigator pi on pi.InvestigatorID = i.InvestigatorID
join PhoneNumber pn on pi.PhoneNumberID = pn.PhoneNumberID
join InvestigatorProposal ip on i.InvestigatorID = ip.InvestigatorID
join Proposal p on p.ProposalID = ip.ProposalID
join InvestigatorAward ia on ia.InvestigatorID = i.InvestigatorID
join Award a on a.AwardID = ia.AwardID

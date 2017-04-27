Select s.name, pn.AreaCode, pn.Number, s.Email, a.Line1, a.Line2, a.City, a.State, a.ZIP
from Sponsor s
join PhoneSponsor ps on ps.SponsorID = s.SponsorID
join PhoneNumber pn on ps.PhoneNumberID = pn.PhoneNumberID
join Address a on s.AddressID = a.AddressID

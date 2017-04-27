
--Remove Data
DELETE FROM Signature;
DELETE FROM Approval;
DELETE FROM Budget;
DELETE FROM BudgetPeriod;
DELETE FROM CostSharingSummary;
DELETE FROM Source;
DELETE FROM PhoneInvestigator;
DELETE FROM PhoneSponsor;
DELETE FROM Sponsor;
DELETE FROM Address;
DELETE FROM PhoneNumber;
DELETE FROM Investigator;
DELETE FROM ProposalType;
DBCC CHECKIDENT ('ProposalType', RESEED, 0);
DBCC CHECKIDENT ('Investigator', RESEED, 0);
DBCC CHECKIDENT ('PhoneNumber', RESEED, 0);
DBCC CHECKIDENT ('Address', RESEED, 0);
DBCC CHECKIDENT ('Sponsor', RESEED, 0);
DBCC CHECKIDENT ('Source', RESEED, 0);
DBCC CHECKIDENT ('CostSharingSummary', RESEED, 0);
DBCC CHECKIDENT ('BudgetPeriod', RESEED, 0);
DBCC CHECKIDENT ('Budget', RESEED, 0);
DBCC CHECKIDENT ('Approval', RESEED, 0);
DBCC CHECKIDENT ('Signature', RESEED, 0);


--PROPOSAL TYPES
--(STATIC DATA)
INSERT INTO ProposalType(Description)
VALUES 
('New Proposal'),
('Pre-Proposal'),
('Renewal'),
('Supplement');


--Create base investigators
INSERT INTO Investigator(FirstName, LastName, CollegeProgram, Department, Email, FCOITrainingDate)
VALUES 
('Mike', 'James', 'Honors', 'Honors', 'james@harding.edu', 2/21/2006),
('Dana', 'Steil', 'Science', 'Computer Science', 'dsteil@harding.edu', 5/10/2015),
('Frank', 'McCown', 'Science', 'Computer Science', 'fmccown@harding.edu', 2/12/2014),
('Ginger', 'Blackstone', 'Arts and Humanities', 'Communication', 'gblackstone@harding.edu', 12/4/2016),
('Brandon', 'Emlaw', 'Science', 'Computer Science', 'bemlaw@harding.edu', 1/10/2017),
('Lance', 'Benson', 'Science', 'Chemistry', 'lbenson@harding.edu', 4/5/2016),
('George', 'Washington', 'Arts and Humanities', 'History', 'mrpresident@harding.edu', 5/5/2016),
('Doc', 'Brown', 'Science', 'Engineering', 'outtatime@harding.edu', 10/20/2015),
('Steve', 'Frye', 'Arts and humanities', 'Theatre', 'sfrye@harding.edu', 5/7/2016),
('Steve', 'Baber', 'Science', 'Computer Science', 'sbaber@harding.edu', 5/10/2016),
('Gabriel', 'Foust', 'Science', 'Computer Science', 'gfoust@harding.edu', 2/1/2015),
('Tim', 'Baird', 'Science', 'Computer Science', 'tbaird@harding.edu', 1/1/2016);

INSERT INTO PhoneNumber(AreaCode, Number, PhoneType)
VALUES
(237, 5234808, 'Cell'),
(740, 6680290, 'Cell'),
(967, 7187623, 'Office'),
(378, 6109126, 'Cell'),
(753, 8366481, 'Cell'),
(239, 6785835, 'Cell'),
(209, 0042878, 'Cell'),
(240, 5106770, 'Office'),
(905, 8448598, 'Office'),
(682, 4251936, 'Cell'),
(389, 0206173, 'Cell'),
(758, 1401566, 'Cell'),
(759, 6846577, 'Cell'),
(396, 0712758, 'Office'),
(140, 6906237, 'Cell'),
(199, 6556863, 'Office'),
(478, 9926672, 'Cell'),
(115, 1995739, 'Office'),
(143, 4868231, 'Office'),
(752, 1643194, 'Cell'),
(580, 7637790, 'Office'),
(947, 7240439, 'Office'),
(623, 9240747, 'Office'),
(943, 8994661, 'Office'),
(109, 1984169, 'Cell'),
(960, 1256616, 'Cell'),
(123, 3386225, 'Cell'),
(555, 0022111, 'Office'),
(823, 3544544, 'Cell'),
(213, 3667569, 'Office'),
(110, 5074958, 'Cell'),
(877, 1461514, 'Office'),
(890, 0016866, 'Office'),
(369, 6546746, 'Cell'),
(540, 4588294, 'Cell'),
(578, 1687200, 'Office'),
(120, 5601385, 'Office'),
(450, 2041408, 'Cell'),
(441, 9657089, 'Office'),
(192, 8259013, 'Office'),
(619, 0067916, 'Office'),
(955, 3558197, 'Cell'),
(588, 6313712, 'Office'),
(828, 6933345, 'Cell'),
(619, 5986203, 'Office'),
(906, 4707484, 'Office'),
(172, 4291469, 'Office'),
(264, 8849738, 'Cell');
 
 
 --Addresses
 INSERT INTO Address(Line1, Line2, City, State, ZIP)
 VALUES
 ('900 E Market Ave', '', 'Searcy', 'AR', 72143), --Legacy Park Research
 ('1 NASA Road', '', 'Houston', 'TX', 10203),
 ('Research Center', '202 Science St', 'Washington', 'DC', 11203),
 ('Communication Center', '203 Baker St', 'Washington', 'DC', 11203),
 ('500 Alabama Way', '', 'Birmingham', 'AL', 33404);
 
 --Sponsors
 INSERT INTO Sponsor(Name, ContactName, AddressID, Email)
 VALUES
 ('Legacy Park Research', 'Alex Hamilton', 1, 'ahamilton@example.com'),
 ('NASA', 'Mike Morgan', 2, 'nasa@example.com'),
 ('National Research Center', 'John Jacobs', 3, 'rcenter@example.gov'),
 ('National Communication Center', 'Kyle Andrews', 4, 'ccenter@example.gov'),
 ('University of Alabama', 'Tim Hals', 5, 'research@alabama.edu');
 
 
 --SponsorPhoneNumbers
 INSERT INTO PhoneSponsor(SponsorID, PhoneNumberID)
 VALUES
 (1, 1),
 (2, 2),
 (3, 3),
 (4, 4),
 (5, 5);
 
 INSERT INTO PhoneSponsor(SponsorID, PhoneNumberID)
 VALUES
 (1, 6),
 (1, 7),
 (1, 9),
 (5, 8);
 
--Investigator Phone Numbers
INSERT INTO PhoneInvestigator(InvestigatorID, PhoneNumberID)
VALUES
(1, 10),
(2, 11),
(3, 12),
(4, 13),
(5, 14),
(6, 15),
(7, 16),
(8, 17),
(9, 18),
(10, 19),
(11, 20),
(12, 21),
(1, 22),
(2, 23),
(10, 24);

INSERT INTO Source(Type, CurrentPeriod, TotalPeriod)
VALUES
('InKind', 1000, 1000),
('InKind', 2000, 4000),
('InKind', 1000, 2000),
('Cash', 100, 100),
('Equipment', 500, 1000),
('Service', 2000, 2000);


INSERT INTO CostSharingSummary(Source1ID, Source2ID, Source3ID, Source4ID)
VALUES
(NULL, NULL, NULL, NULL),
(1, 4, NULL, NULL),
(2, NULL, NULL, NULL),
(3, 5, 6, NULL);

INSERT INTO BudgetPeriod(BeginDate, EndDate, SalariesWagesFringes, OtherDirectCosts, FnACosts)
VALUES
('8/1/2016', '8/1/2018', 5000, 1000, 3000), --1
('8/1/2016', '8/1/2017', 2500, 500, 1500),  --2

('8/1/2015', '8/1/2020', 5000, 5000, 10000), --3
('8/1/2016', '8/1/2017', 1000, 1000, 2000), --4

('1/1/2017', '1/1/2018', 1000, 500, 0), --5

('8/1/2016', '8/1/2017', 4000, 100, 1000), --6
('8/1/2016', '8/1/2018', 8000, 200, 2000), --7

('8/1/2017', '8/1/2018', 2000, 100, 100), --8
('8/1/2017', '8/1/2019', 4000, 200, 200); --9

INSERT INTO Budget(BudgetTotalProjPeriodID, BudgetCurrentPeriodID, CostSharingSummaryID)
VALUES
(1, 2, 1),
(3, 4, 1),
(5, 5, 1),
(1, 1, 1),
(6, 7, 2),
(8, 9, 3),
(1, 2, 4),
(1, 2, 1),
(5, 5, 4);

INSERT INTO Approval(ProtocolNumber, IsSubmitted, DateOfApproval)
VALUES
('A100', 1, '1/1/2016'),
('C200', 1, '1/1/2014'),
('A205', 1, NULL),
('A206', 1, NULL),
('C405', 1, NULL),
('A500', 0, NULL),
('D101', 0, NULL);

INSERT INTO Signature(Name, Date)
VALUES
('Bruce Mclarty', '1/1/2015'),
('Tim Baird', '1/1/2016'),
('Mike James', '1/7/2016'),
('Dana Steil', '11/4/2015'),
('Frank McCown', '11/1/2014'),
('Steve Baber', '2/25/2017'),
('Gabriel Foust', '2/4/2016'),
('Investigator Name', '1/2/2017'),
('Program Operator', '1/1/2017');

Mike', 'James', 'Honors', 'Honors', 'james@harding.edu', 2/21/2006),
('Dana', 'Steil', 'Science', 'Computer Science', 'dsteil@harding.edu', 5/10/2015),
('Frank', 'McCown', 'Science', 'Computer Science', 'fmccown@harding.edu', 2/12/2014),
('Ginger', 'Blackstone', 'Arts AND Humanities', 'Communication', 'gblackstone@harding.edu', 12/4/2016),
('Brandon', 'Emlaw', 'Science', 'Computer Science', 'bemlaw@harding.edu', 1/10/2017),
('Lance', 'Benson', 'Science', 'Chemistry', 'lbenson@harding.edu', 4/5/2016),
('George', 'Washington', 'Arts AND Humanities', 'History', 'mrpresident@harding.edu', 5/5/2016),
('Doc', 'Brown', 'Science', 'Engineering', 'outtatime@harding.edu', 10/20/2015),
('Steve', 'Frye', 'Arts AND humanities', 'Theatre', 'sfrye@harding.edu', 5/7/2016),
('Steve', 'Baber', 'Science', 'Computer Science', 'sbaber@harding.edu', 5/10/2016),
('Gabriel', 'Foust', 'Science', 'Computer Science', 'gfoust@harding.edu', 2/1/2015),
('Tim', 'Baird', 'Science
INSERT INTO Proposal

--PROPOSAL TYPES
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
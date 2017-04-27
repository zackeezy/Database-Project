-- Zachary McKee and Brandon Emlaw

-- CREATE TABLES

CREATE TABLE Signature (
    SignatureID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255) NOT NULL,
    Date datetime NOT NULL
);


CREATE TABLE Approval (
    ApprovalID int IDENTITY(1,1) PRIMARY KEY,
    ProtocolNumber varchar(255),
    IsSubmitted bit NOT NULL,
    DateOfApproval datetime
);

CREATE TABLE Investigator (
    InvestigatorID int IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    CollegeProgram varchar(255) NOT NULL,
    Department varchar(255) NOT NULL,
    Email varchar(255),
    FCOITrainingDate datetime
);

CREATE TABLE PhoneNumber (
    PhoneNumberID int IDENTITY(1,1) PRIMARY KEY,
    AreaCode int NOT NULL,
    Number int NOT NULL,
    PhoneType varchar(255) NOT NULL
);

CREATE TABLE Address (
    AddressID int IDENTITY(1,1) PRIMARY KEY,
    Line1 varchar(255) NOT NULL,
    Line2 varchar(255),
    City varchar(255) NOT NULL,
    State char(2) NOT NULL,
    ZIP int NOT NULL
);

CREATE TABLE Sponsor (
    SponsorID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255) NOT NULL,
    ContactName varchar(255) NOT NULL,
    AddressID int FOREIGN KEY REFERENCES Address(AddressID),
    Email varchar(255)
);

CREATE TABLE PhoneSponsor(
    SponsorID int FOREIGN KEY REFERENCES Sponsor(SponsorID),
    PhoneNumberID int FOREIGN KEY REFERENCES PhoneNumber(PhoneNumberID),
    PRIMARY KEY (SponsorID, PhoneNumberID)
);

CREATE TABLE PhoneInvestigator(
    InvestigatorID int FOREIGN KEY REFERENCES Investigator(InvestigatorID),
    PhoneNumberID int FOREIGN KEY REFERENCES PhoneNumber(PhoneNumberID),
    PRIMARY KEY (InvestigatorID, PhoneNumberID)
);

CREATE TABLE ProposalType (
    ProposalTypeID int IDENTITY(1,1) PRIMARY KEY,
    Description varchar(255) NOT NULL
);


CREATE TABLE Source (
    SourceID int IDENTITY(1,1) PRIMARY KEY,
    Type varchar(255) NOT NULL,
    CurrentPeriod int NOT NULL,
    TotalPeriod int NOT NULL
);

CREATE TABLE CostSharingSummary (
    CostSharingSummaryID int IDENTITY(1,1) PRIMARY KEY,
    Source1ID int FOREIGN KEY REFERENCES Source(SourceID),
    Source2ID int FOREIGN KEY REFERENCES Source(SourceID),
    Source3ID int FOREIGN KEY REFERENCES Source(SourceID),
    Source4ID int FOREIGN KEY REFERENCES Source(SourceID)
);

CREATE TABLE BudgetPeriod (
    BudgetPeriodID int IDENTITY(1,1) PRIMARY KEY,
    BeginDate datetime NOT NULL,
    EndDate datetime NOT NULL,
    SalariesWagesFringes money NOT NULL DEFAULT 0,
    OtherDirectCosts money NOT NULL DEFAULT 0,
    FnACosts money NOT NULL DEFAULT 0
);

CREATE TABLE Budget (
    BudgetID int IDENTITY(1,1) PRIMARY KEY,
    BudgetCurrentPeriodID int NOT NULL FOREIGN KEY REFERENCES BudgetPeriod(BudgetPeriodID),
    BudgetTotalProjPeriodID int NOT NULL FOREIGN KEY REFERENCES BudgetPeriod(BudgetPeriodID),
    CostSharingSummaryID int NOT NULL FOREIGN KEY REFERENCES CostSharingSummary(CostSharingSummaryID)
);


CREATE TABLE Proposal (
    ProposalID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(255),
    ActivityType varchar(255),
    ProposalTypeID int NOT NULL FOREIGN KEY REFERENCES ProposalType(ProposalTypeID),
    SponsorID int NOT NULL FOREIGN KEY REFERENCES Sponsor(SponsorID),
    PrimeSponsorID int FOREIGN KEY REFERENCES Sponsor(SponsorID),
    CFDANumber varchar(255),
    SubmissionMethod varchar(255),
    DueDate datetime,
    IRBAApprovalID int FOREIGN KEY REFERENCES Approval(ApprovalID),
    IACUCApprovalID int FOREIGN KEY REFERENCES Approval(ApprovalID),
    IsIntellectualProperty bit NOT NULL,
    IsITAR bit NOT NULL,
    IBCApprovalID int FOREIGN KEY REFERENCES Approval(ApprovalID),
    IsStemCell bit NOT NULL,
    IsStemCellApproved bit NOT NULL,
    IsOutsideStates bit NOT NULL,
    IsNSFAandStudents bit NOT NULL,
    IsNSFAandStudentsWillAbide bit NOT NULL,
    IsAgreedtoGuidelines bit NOT NULL,
    SubawardeeSponsorID int FOREIGN KEY REFERENCES Sponsor(SponsorID),
    IsFinancialConflictOfInterest bit NOT NULL,
    PISignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    PIChairSignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    PIDeanSignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    COPISignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    COPIChairSignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    COPIDeanSignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    OfficeSignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    ProvostSignatureID int FOREIGN KEY REFERENCES Signature(SignatureID),
    BudgetID int NOT NULL FOREIGN KEY REFERENCES Budget(BudgetID)
);

CREATE TABLE Award (
    AwardID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(255),
    ActivityType varchar(255),
    ProposalTypeID int NOT NULL FOREIGN KEY REFERENCES ProposalType(ProposalTypeID),
    PreviousAwardID int FOREIGN KEY REFERENCES Award(AwardID),
    SponsorID int NOT NULL FOREIGN KEY REFERENCES Sponsor(SponsorID),
    PrimeSponsorID int FOREIGN KEY REFERENCES Sponsor(SponsorID),
    CFDANumber varchar(255),
    SubmissionMethod varchar(255),
    BudgetID int NOT NULL FOREIGN KEY REFERENCES Budget(BudgetID),
    OriginalProposalID int FOREIGN KEY REFERENCES Proposal(ProposalID)
);

ALTER TABLE Proposal
ADD PreviousAwardID int FOREIGN KEY REFERENCES Award(AwardID);


CREATE TABLE InvestigatorProposal (
    InvestigatorID int FOREIGN KEY REFERENCES Investigator(InvestigatorID),
    ProposalID int FOREIGN KEY REFERENCES Proposal(ProposalID),
    IsPrincipalInvestigator bit NOT NULL,
    FAndAPercentage int NOT NULL,
    PRIMARY KEY (InvestigatorId, ProposalID)
);


CREATE TABLE InvestigatorAward (
    InvestigatorID int FOREIGN KEY REFERENCES Investigator(InvestigatorID),
    AwardID int FOREIGN KEY REFERENCES Award(AwardID),
    IsPrincipalInvestigator bit NOT NULL,
    FAndAPercentage int NOT NULL,
    PRIMARY KEY (InvestigatorId, AwardID)
);





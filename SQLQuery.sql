SELECT @@VERSION AS 'SQL Server Version Details'

use crimes

SELECT COUNT(*) FROM [crimes].[dbo].[test2]

SELECT * FROM [crimes].[dbo].[test2]

CREATE TABLE Details (
    Details_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Arrest BIT,
	Domestic BIT 
);

CREATE TABLE CrimeType (
	CrimeType_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IUCR VARCHAR(50) NOT NULL ,
    PrimaryType VARCHAR(33),
);

CREATE TABLE Address (
	Address_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Block VARCHAR(35) NOT NULL ,
    CommunityArea DOUBLE PRECISION,
	CommunityAreaName VARCHAR(128),
	Region VARCHAR(18)
);



CREATE TABLE Date (
	Date_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Datetime VARCHAR(22) NOT NULL ,
	Hour BIGINT,
	Month BIGINT,
	MonthName VARCHAR(9),
	Year BIGINT
);


CREATE TABLE [crime].[dbo].CrimeFact (
  Crime_ID INT PRIMARY KEY IDENTITY(1,1),
  Date_ID INT NOT NULL,
  Address_ID INT NOT NULL,
  CrimeType_ID INT NOT NULL,
  Details_ID INT NOT NULL,
  LocationDescription VARCHAR(100),
  FOREIGN KEY (Details_id) REFERENCES Details(Details_ID),
  FOREIGN KEY (Address_id) REFERENCES Address(Address_ID),
  FOREIGN KEY (CrimeType_id) REFERENCES CrimeType(CrimeType_ID),
  FOREIGN KEY (Date_id) REFERENCES Date(Date_ID)
  );

DROP TABLE [crime].[dbo].[CrimeFact]

Truncate TABLE [crime].[dbo].[details]

Truncate TABLE [crime].[dbo].[address]

Truncate TABLE [crime].[dbo].[Region]

Truncate TABLE [crime].[dbo].[Date]

Truncate TABLE [crime].[dbo].[CrimeType]

Truncate TABLE [crime].[dbo].[CrimeFact]

SELECT * FROM [crime].[dbo].[details];

SELECT * FROM [crime].[dbo].[Address];

SELECT * FROM [crime].[dbo].[CrimeType];

SELECT * FROM [crime].[dbo].[test2];

SELECT * FROM [crime].[dbo].[Date];

INSERT INTO Details(Arrest,Domestic) SELECT  DISTINCT [Arrest],[Domestic] FROM [crime].[dbo].[test2]

INSERT INTO CrimeType(IUCR,PrimaryType) SELECT  DISTINCT [IUCR],[Primary Type] FROM [crime].[dbo].[test2]

INSERT INTO Address(Block,CommunityArea,CommunityAreaName,Region) SELECT DISTINCT [Block],[Community Area],[Community Area Name],[Area] FROM [crime].[dbo].[test2]

INSERT INTO Date(Datetime,Hour,Month,MonthName,Year) SELECT  DISTINCT [Date],[Hour],[Month],[Month Name],[Year] FROM test2



SELECT  DISTINCT [Primary Type] FROM test2

SELECT DISTINCT[IUCR] FROM test2

SELECT DISTINCT [Arrest] from test2

Drop TABLE [crime].[dbo].[Address]


SELECT [Address].[Address_ID] as [Address] FROM [crime].[dbo].[test2]
INNER JOIN [Address] ON [test2].[Block] = [Address].[Block] AND [test2].[Community Area] = [Address].[CommunityArea]

SELECT [Details].[Details_ID] as [Details] FROM [crime].[dbo].[test2]
INNER JOIN [Details] ON [test2].[Arrest] = [Details].[Arrest] AND [test2].[Domestic] = [Details].[Domestic]

SELECT [Date].[Date_ID] as [Date] FROM [crime].[dbo].[test2]
INNER JOIN [Date] ON [test2].[Date] = [Date].[Datetime] 

SELECT [CrimeType].[CrimeType_ID] as [CrimeType] FROM [crime].[dbo].[test2]
INNER JOIN [CrimeType] ON [test2].[IUCR] = [CrimeType].[IUCR] AND [test2].[Primary Type] = [CrimeType].[PrimaryType]


INSERT INTO CrimeFact
SELECT [Date].[Date_ID] as [Date],
[Address].[Address_ID] as [Address],
[CrimeType].[CrimeType_ID] as [CrimeType],
[Details].[Details_ID] as [Details],
[test2].[Location Description]
FROM [test2]
INNER JOIN [Date] ON [test2].[Date] = [Date].[Datetime] 
INNER JOIN [Address] ON [test2].[Block] = [Address].[Block] AND [test2].[Community Area] = [Address].[CommunityArea]
INNER JOIN [CrimeType] ON [test2].[IUCR] = [CrimeType].[IUCR] AND [test2].[Primary Type] = [CrimeType].[PrimaryType]
INNER JOIN [Details] ON [test2].[Arrest] = [Details].[Arrest] AND [test2].[Domestic] = [Details].[Domestic]



Select * FROM CrimeFact

SELECT * FROM test2

SELECT * FROM Address

SELECT * FROM Details

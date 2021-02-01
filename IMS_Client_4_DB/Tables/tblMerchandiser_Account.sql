CREATE TABLE [dbo].[tblMerchandiser_Account]
(
  
	[Merchandiser_AccountID] INT NOT NULL PRIMARY KEY IDENTITY,
    [MerchandiserID] INT NULL,
    [AccountID] INT NULL, 
    [CreatedBy] INT NULL, 
    [CreatedOn] DATETIME NULL, 
    [UpdateBy] INT NULL, 
    [UpdateOn] DATETIME NULL
)

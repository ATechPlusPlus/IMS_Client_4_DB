CREATE TABLE [dbo].[tblProductMaster](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Barcodes] [nvarchar](50) NULL,
	[ProductName] [nvarchar](MAX) NULL,
	[Weight] NVARCHAR(50) NOT NULL DEFAULT 0,
	[Packs] INT NULL DEFAULT 0 ,
	[UnitPrice] DECIMAL(18, 3) NULL,
	[CartonPrice] DECIMAL(18, 3) NULL,
	[ActiveStatus] [bit] NOT NULL CONSTRAINT [DF_ProductMaster_ActiveStatus]  DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL CONSTRAINT [DF_ProductMaster_CreatedBy]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_ProductMaster_CreatedOn]  DEFAULT (getdate()),
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
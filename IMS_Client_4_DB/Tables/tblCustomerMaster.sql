CREATE TABLE [dbo].[tblCustomerMaster](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[EmailID] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL DEFAULT 0,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerMaster] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_CustomerMaster_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

CREATE TABLE [dbo].[tblMerchandiserMaster](
	[MerchandiserID] [int] IDENTITY(1,1) NOT NULL,
	[MerchandiserName] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL DEFAULT 0,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblMerchandiserMaster] PRIMARY KEY CLUSTERED 
(
	[MerchandiserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblMerchandiserMaster] ADD  CONSTRAINT [DF_tblMerchandiserMaster_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

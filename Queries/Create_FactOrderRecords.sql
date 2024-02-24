USE [DWH_Gravity_Books]
GO

/****** Object:  Table [dbo].[FactOrderRecords]    Script Date: 1/17/2024 9:04:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactOrderRecords](
	[orderBK] [int] NOT NULL,
	[status_date] [datetime] NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_FactOrderRecords] PRIMARY KEY CLUSTERED 
(
	[orderBK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



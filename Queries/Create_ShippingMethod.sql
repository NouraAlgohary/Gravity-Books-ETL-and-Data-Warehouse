USE [DWH_Gravity_Books]
GO

/****** Object:  Table [dbo].[DimShippingMethod]    Script Date: 1/17/2024 9:04:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimShippingMethod](
	[methodSK] [int] IDENTITY(1,1) NOT NULL,
	[method_id_BK] [int] NOT NULL,
	[method_name] [varchar](100) NULL,
	[source_system_code] [tinyint] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_DimShippingMethod] PRIMARY KEY CLUSTERED 
(
	[methodSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



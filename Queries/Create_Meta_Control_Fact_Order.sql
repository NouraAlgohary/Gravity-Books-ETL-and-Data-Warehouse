USE [DWH_Gravity_Books]
GO

/****** Object:  Table [dbo].[Meta_Control_Fact_Order_Load]    Script Date: 1/17/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Meta_Control_Fact_Order_Load](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[last_modified_id_bk] [int] NULL,
	[last_load_date] [datetime] NULL,
 CONSTRAINT [PK_Meta_Control_Fact_Order_Load] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


